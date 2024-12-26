local reg = require 'mason-registry'
local lsp = require 'language-servers'
local fmt = require 'conform'
local lnt = require 'lint'
local dap = require 'dap'

-- Helper functions
local function swift_package_description(key)
  local package_json = vim.fn.system 'swift package describe --type json'
  return vim.fn.json_decode(package_json)[key]
end

local function swift_package_executables()
  return vim
    .iter(swift_package_description 'products' or {})
    :filter(function(product)
      for k, _ in pairs(product.type) do
        if k == 'executable' then
          return true
        end
      end
      return false
    end)
    :map(function(product)
      return product.name
    end)
    :totable()
end

local function swift_package_test_ids()
  local test_list_string = vim.fn.system 'swift test list --skip-build 2>/dev/null'
  local trimmed_string = vim.fn.trim(test_list_string)
  return vim.fn.split(trimmed_string, '\n')
end

-- Language Server
lsp.setup('sourcekit', {
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },
})

-- Formatter
fmt.formatters['swift format'] = {
  command = 'swift',
  args = { 'format', '$FILENAME', '--in-place' },
  stdin = false,
}
fmt.formatters_by_ft.swift = { 'swift format' }

-- Linter
lnt.linters_by_ft.swift = { 'swiftlint' }

-- Debugger
if reg.is_installed 'codelldb' then
  -- Paths to tools, libraries and frameworks
  local codelddb_path = reg.get_package('codelldb'):get_install_path() .. '/extension/adapter/codelldb'
  local xcode_developer_path = vim.fn.trim(vim.fn.system 'xcode-select -p')
  local xcode_paths = {
    liblldb = xcode_developer_path .. '/../SharedFrameworks/LLDB.framework/Versions/A/LLDB',
    swiftpm_testing_helper = xcode_developer_path .. '/Toolchains/XcodeDefault.xctoolchain/usr/libexec/swift/pm/swiftpm-testing-helper',
    swift_testing_library = xcode_developer_path .. '/Platforms/MacOSX.platform/Developer/usr/lib',
    swift_testing_framework = xcode_developer_path .. '/Platforms/MacOSX.platform/Developer/Library/Frameworks',
  }

  -- Adapter
  dap.adapters.codelldb_swift = {
    type = 'server',
    port = '${port}',
    executable = {
      -- Use codelldb installed by Mason
      command = codelddb_path,
      args = {
        '--port',
        '${port}',
        -- Use libdlldb that comes with XCode
        '--liblldb',
        xcode_paths.liblldb,
        -- Fine-tune codelldb settings
        '--settings',
        vim.fn.json_encode {
          showDisassembly = 'never', -- Do not jump into dissasembly when can't find symbols
        },
      },
    },
  }

  -- Run configurations
  dap.configurations.swift = {
    {
      name = 'Executable',
      type = 'codelldb_swift',
      request = 'launch',
      expressions = 'native',
      sourceLanguages = { 'swift' },
      stopOnEntry = false,
      program = function()
        local build_out = vim.fn.system 'swift build'
        if vim.v.shell_error ~= 0 then
          vim.notify('Build failed with ' .. build_out, vim.log.levels.ERROR)
          return dap.ABORT
        else
          local products = swift_package_executables()
          if #products == 0 or #products > 1 then
            vim.notify('Expecting 1 executable, but got: ' .. vim.inspect(products), vim.log.levels.ERROR)
            return dap.ABORT
          end
          local product = products[1]

          return '${workspaceFolder}/.build/debug/' .. product
        end
      end,
    },
    {
      name = 'Tests',
      type = 'codelldb_swift',
      request = 'launch',
      expressions = 'native',
      sourceLanguages = { 'swift' },
      stopOnEntry = false,
      program = xcode_paths.swiftpm_testing_helper,
      env = {
        DYLD_FRAMEWORK_PATH = xcode_paths.swift_testing_framework,
        DYLD_LIBRARY_PATH = xcode_paths.swift_testing_library,
      },
      args = function()
        local build_out = vim.fn.system 'swift build --build-tests'
        if vim.v.shell_error ~= 0 then
          vim.notify('Build failed with ' .. build_out, vim.log.levels.ERROR)
          return dap.ABORT
        else
          local products = swift_package_executables()
          if #products == 0 or #products > 1 then
            vim.notify('Expecting 1 executable, but got: ' .. vim.inspect(products), vim.log.levels.ERROR)
            return dap.ABORT
          end
          local test_product = products[1] .. 'PackageTests'

          local args = {
            '--test-bundle-path',
            '${workspaceFolder}/.build/debug/' .. test_product .. '.xctest/Contents/MacOS/' .. test_product,
            '--testing-library',
            'swift-testing',
          }

          local tests = swift_package_test_ids()
          return coroutine.create(function(run_dap_co)
            vim.ui.select(tests, { prompt = 'Test to Run' }, function(test)
              if test then
                table.insert(args, '--filter')
                table.insert(args, test)
              end
              coroutine.resume(run_dap_co, args)
            end)
          end)
        end
      end,
    },
  }
end

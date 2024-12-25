return {
  { -- Debugger
    'mfussenegger/nvim-dap',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      -- UI
      { 'nvim-neotest/nvim-nio', opts = nil },
      { 'rcarriga/nvim-dap-ui', opts = {} },

      { -- Use Mason to manage adapters
        'jay-babu/mason-nvim-dap.nvim',
        dependencies = { 'williamboman/mason.nvim' },
        opts = {},
      },
    },
    config = function()
      local reg = require 'mason-registry'
      local dap, dapui = require 'dap', require 'dapui'

      -- Open and close UI automatically
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- Style sign columns
      vim.fn.sign_define('DapStopped', { text = '→', texthl = 'Debug' })
      vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DebugBreakpoint', numhl = 'DebugBreakpoint' })
      vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DebugBreakpoint', numhl = 'DebugBreakpoint' })
      vim.fn.sign_define('DapBreakpointRejected', { text = '✖︎', texthl = 'DebugBreakpoint', numhl = 'DebugBreakpoint' })
      vim.fn.sign_define('DapLogPoint', { text = '✎', texthl = 'DebugBreakpoint', numhl = 'DebugBreakpoint' })

      -- Breakpoints
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = '[D]ebug [B]reakpoint' })
      vim.keymap.set('n', '<leader>dl', function()
        dap.set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
      end, { desc = '[D]ebug [L]og Point' })
      vim.keymap.set('n', '<leader>dc', function()
        dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end, { desc = '[D]ebug [C]conditional Breakpoint' })

      -- Starting and continuing
      vim.keymap.set('n', '<leader>dd', dap.continue, { desc = '[D]ebug [D]debug' })

      -- Stepping over, in and out
      vim.keymap.set('n', '<leader>do', dap.step_over, { desc = '[D]ebug Step [O]ver' })
      vim.keymap.set('n', '<leader>di', dap.step_into, { desc = '[D]ebug Step [I]nto' })
      vim.keymap.set('n', '<leader>du', dap.step_out, { desc = '[D]ebug Step O[u]t' })

      -- Debug View
      vim.keymap.set('n', '<leader>dvt', dapui.toggle, { desc = '[D]ebug [V]iew [T]oggle' })

      -- Swift
      if reg.is_installed 'codelldb' then
        local xcode_developer_path = vim.fn.trim(vim.fn.system 'xcode-select -p')
        local xcode_paths = {
          liblldb = xcode_developer_path .. '/../SharedFrameworks/LLDB.framework/Versions/A/LLDB',
          swiftpm_testing_helper = xcode_developer_path .. '/Toolchains/XcodeDefault.xctoolchain/usr/libexec/swift/pm/swiftpm-testing-helper',
          swift_testing_library = xcode_developer_path .. '/Platforms/MacOSX.platform/Developer/usr/lib',
          swift_testing_framework = xcode_developer_path .. '/Platforms/MacOSX.platform/Developer/Library/Frameworks',
        }

        local swift_package = function(key)
          local package_json = vim.fn.system 'swift package describe --type json'
          return vim.fn.json_decode(package_json)[key]
        end

        local swift_package_executables = function()
          return vim
            .iter(swift_package 'products' or {})
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

        local swift_package_tests = function()
          local test_list_string = vim.fn.system 'swift test list 2>/dev/null'
          local trimmed_string = vim.fn.trim(test_list_string)
          return vim.fn.split(trimmed_string, '\n')
        end

        -- Adapter
        dap.adapters.codelldb_swift = {
          type = 'server',
          port = '${port}',
          executable = {
            -- Use codelldb installed by Mason
            command = reg.get_package('codelldb'):get_install_path() .. '/extension/adapter/codelldb',
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

        -- Configurations
        dap.configurations.swift = {
          {
            name = 'Debug Executable',
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
            name = 'Debug Tests',
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

                local tests = swift_package_tests()
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
    end,
  },
}

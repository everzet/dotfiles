return {
  { -- Debugger
    'mfussenegger/nvim-dap',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      -- UI
      { 'nvim-neotest/nvim-nio', opts = nil },
      { 'rcarriga/nvim-dap-ui', opts = {} },

      -- Show debugger info in virtual text
      { 'theHamsta/nvim-dap-virtual-text', opts = {} },

      -- Manage adapters with Mason
      { 'jay-babu/mason-nvim-dap.nvim', opts = {
        ensure_installed = { 'delve' },
      } },

      { -- Go adapter
        'leoluz/nvim-dap-go',
        opts = {
          dap_configurations = {
            { -- Remote configuration
              --  Can be used with:
              --      dlv debug -l 127.0.0.1:38697 --headless ./main.go -- subcommand --myflag=xyz
              type = 'go',
              name = 'Attach remote',
              mode = 'remote',
              request = 'attach',
            },
          },
        },
      },
    },
    config = function()
      local dap, dapui, dapgo = require 'dap', require 'dapui', require 'dap-go'

      -- Open and close UI automatically
      dap.listeners.before.attach.dapui_auto = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_auto = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_auto = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_auto = function()
        dapui.close()
      end

      -- Style sign columns
      vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DebugBreakpoint', linehl = '', numhl = 'DebugBreakpoint' })
      vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DebugBreakpoint', linehl = '', numhl = 'DebugBreakpoint' })

      -- Breakpoints
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = '[D]ebug [B]reakpoint' })
      vim.keymap.set('n', '<leader>dl', function()
        dap.set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
      end, { desc = '[D]ebug [L]og Point' })
      vim.keymap.set('n', '<leader>dc', function()
        dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end, { desc = '[D]ebug [C]conditional Breakpoint' })

      -- Adapter-specific stuff
      vim.keymap.set('n', '<leader>dgt', dapgo.debug_test, { desc = '[D]ebug [G]o [T]est' })

      -- Starting and continuing
      vim.keymap.set('n', '<leader>dd', dap.continue, { desc = '[D]ebug [D]debug' })

      -- Stepping over, in and out
      vim.keymap.set('n', '<leader>do', dap.step_over, { desc = '[D]ebug Step [O]ver' })
      vim.keymap.set('n', '<leader>di', dap.step_into, { desc = '[D]ebug Step [I]nto' })
      vim.keymap.set('n', '<leader>du', dap.step_into, { desc = '[D]ebug Step O[u]t' })

      -- Debug View
      vim.keymap.set('n', '<leader>dvt', dapui.toggle, { desc = '[D]ebug [V]iew [T]oggle' })
    end,
  },
}

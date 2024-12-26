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
      vim.keymap.set('n', '<leader>dd', function()
        dap.continue()
      end, { desc = '[D]ebug [D]debug' })
      vim.keymap.set('n', '<leader>dq', function()
        dap.terminate()
      end, { desc = '[D]ebug [D]debug' })

      -- Stepping over, in and out
      vim.keymap.set('n', '<leader>do', dap.step_over, { desc = '[D]ebug Step [O]ver' })
      vim.keymap.set('n', '<leader>di', dap.step_into, { desc = '[D]ebug Step [I]nto' })
      vim.keymap.set('n', '<leader>du', dap.step_out, { desc = '[D]ebug Step O[u]t' })

      -- Debug View
      vim.keymap.set('n', '<leader>dvt', dapui.toggle, { desc = '[D]ebug [V]iew [T]oggle' })
    end,
  },
}

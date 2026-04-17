return {
  {
    'folke/trouble.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics' },
      { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer diagnostics' },
      { '<leader>xL', '<cmd>Trouble loclist toggle<cr>', desc = 'Location list' },
      { '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix list' },
      { '<C-n>', function() require('trouble').next({ skip_groups = true, jump = true }) end, desc = 'Next trouble item' },
      { '<C-p>', function() require('trouble').prev({ skip_groups = true, jump = true }) end, desc = 'Prev trouble item' },
    },
  },
}

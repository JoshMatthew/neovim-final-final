return {
  {
    'shortcuts/no-neck-pain.nvim',
    event = 'VeryLazy',
    opts = {
      width = 120,
    },
    keys = {
      { '<leader>np', '<cmd>NoNeckPain<cr>', desc = 'Toggle centered layout' },
    },
  },
}

-- shows outline of the file (like it shows functions)

return {
  {
    'stevearc/aerial.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {},
    keys = {
      { '<leader>o', '<cmd>AerialToggle<cr>', desc = 'Toggle code outline' },
    },
  },
}

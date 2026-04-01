return {
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {
      search = {
        multi_window = false,
      },
      prompt = {
        enabled = false,
      },
    },
    keys = {
      { 's', function() require('flash').jump() end, mode = { 'n', 'x', 'o' }, desc = 'Flash jump' },
      { 'S', function() require('flash').treesitter() end, mode = { 'n', 'x', 'o' }, desc = 'Flash treesitter' },
    },
  },
}

return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  config = function()
    -- vim.cmd.colorscheme 'catppuccin-mocha'
    vim.cmd.colorscheme 'catppuccin-frappe'
    -- vim.cmd.colorscheme 'catppuccin-latte'
  end,
}

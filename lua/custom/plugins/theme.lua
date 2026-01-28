-- return {
--   'bluz71/vim-moonfly-colors',
--   name = 'moonfly',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     ---@diagnostic disable-next-line: missing-fields
--     vim.cmd.colorscheme 'moonfly'
--   end,
-- }

-- for light mode
return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'catppuccin-mocha'
  end,
}

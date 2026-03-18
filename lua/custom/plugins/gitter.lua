-- return {
--   'kdheepak/lazygit.nvim',
--   lazy = true,
--   cmd = {
--     'LazyGit',
--     'LazyGitConfig',
--     'LazyGitCurrentFile',
--     'LazyGitFilter',
--     'LazyGitFilterCurrentFile',
--   },
--   -- optional for floating window border decoration
--   dependencies = {
--     'nvim-lua/plenary.nvim',
--   },
--   -- setting the keybinding for LazyGit with 'keys' is recommended in
--   -- order to load the plugin when the command is run for the first time
--   keys = {
--     { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
--   },
-- }
return {
  'NeogitOrg/neogit',
  lazy = true,
  dependencies = {
    'nvim-lua/plenary.nvim', -- required

    -- Only one of these is needed.
    'sindrets/diffview.nvim', -- optional

    -- Only one of these is needed.
    'nvim-telescope/telescope.nvim', -- optional
  },
  cmd = 'Neogit',
  keys = {
    { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Show Neogit UI' },
  },
}

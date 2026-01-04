local map = vim.keymap.set

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- view sidenav / project view
map('n', '<leader>en', '<cmd>Ex<cr>', { desc = 'Project view' })

-- close buffer
map('n', '<leader>c', '<cmd>bd<cr>', { desc = 'Close buffer' })

-- select all
map('n', '<C-a>', 'gg<S-v>G', { desc = 'Select all' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- OIL nvim
vim.keymap.set('n', '-', '<cmd>Oil<CR>')

-- Go to definition (LSP)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition' })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to Declaration' })

-- quickfix
vim.keymap.set('n', '<M-j>', '<cmd>cnext<CR>', { desc = 'Next quickfix' })
vim.keymap.set('n', '<M-k>', '<cmd>cprev<CR>', { desc = 'Previous quickfix' })

-- terminal
vim.keymap.set('n', '<leader>t', '<cmd>terminal<CR>', { desc = 'Opens terminal' })
vim.keymap.set('t', '<C-space>', '<C-\\><C-n>', { desc = 'Exits terminal to normal mode', silent = true })

-- Git non LAZYGIT
vim.keymap.set('n', '<leader>gb', '<cmd>Git blame_line<CR>', { desc = 'Git Blame Line' })
vim.keymap.set('n', '<leader>gB', '<cmd>Git blame<CR>', { desc = 'Git Blame' })

-- LSP code actions
vim.keymap.set('n', '<leader>ff', vim.lsp.buf.code_action, {
  desc = 'LSP Code Action',
})

-- yanking and pasting to registers
-- yanking
vim.keymap.set('v', '<leader>y', function()
  local reg = vim.fn.getcharstr()
  vim.cmd('normal! "' .. reg .. 'y')
end, { desc = 'Yank to register' })
-- pasting
vim.keymap.set('n', '<leader>p', function()
  local reg = vim.fn.getcharstr()
  vim.cmd('normal! "' .. reg .. 'p')
end, { desc = 'Paste from register' })

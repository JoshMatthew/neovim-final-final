local map = vim.keymap.set

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- view sidenav / project view
map('n', '<leader>en', '<cmd>Ex<cr>', { desc = 'Project view' })

-- close buffer
map('n', '<leader>c', '<cmd>bd<cr>', { desc = 'Close buffer' })
-- sync buffer with disk changes
map('n', '<leader><C-l>', ':checktime<CR>', { desc = 'Sync buffer with disk changes' })
-- select all
map('n', '<C-a>', 'gg<S-v>G', { desc = 'Select all' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- map("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- map("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- map("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- map("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- OIL nvim
map('n', '-', '<cmd>Oil<CR>')

-- Go to definition (LSP)
map('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition' })
map('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to Declaration' })

-- quickfix
map('n', '<C-n>', '<cmd>cnext<CR>', { desc = 'Next quickfix' })
map('n', '<C-p>', '<cmd>cprev<CR>', { desc = 'Previous quickfix' })

-- terminal
map('n', '<leader>t', '<cmd>terminal<CR>', { desc = 'Opens terminal' })
map('t', '<C-space>', '<C-\\><C-n>', { desc = 'Exits terminal to normal mode', silent = true })

-- Git non LAZYGIT
map('n', '<leader>gb', '<cmd>Git blame_line<CR>', { desc = 'Git Blame Line' })
map('n', '<leader>gB', '<cmd>Git blame<CR>', { desc = 'Git Blame' })

-- LSP code actions
map('n', '<leader>ff', vim.lsp.buf.code_action, {
  desc = 'LSP Code Action',
})
map('n', '<leader>i', vim.lsp.buf.hover, {
  desc = 'LSP Hover (type info)',
})
map('n', '<leader>rn', vim.lsp.buf.rename, {
  desc = 'LSP Rename symbol',
})

-- yanking and pasting to registers
-- yanking
map('v', '<leader>y', function()
  local reg = vim.fn.getcharstr()
  vim.cmd('normal! "' .. reg .. 'y')
end, { desc = 'Yank to register' })
-- pasting
map('n', '<leader>p', function()
  local reg = vim.fn.getcharstr()
  vim.cmd('normal! "' .. reg .. 'p')
end, { desc = 'Paste from register' })

-- mouse remaps
map('', '<ScrollWheelUp>', '1<C-y>')
map('', '<ScrollWheelDown>', '1<C-e>')

-- editor
map('n', '<leader><leader>', 'zz')

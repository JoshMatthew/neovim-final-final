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

map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

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

-- Git blame via gitsigns
map('n', '<leader>gb', function() require('gitsigns').blame_line() end, { desc = 'Git Blame Line' })
map('n', '<leader>gB', function() require('gitsigns').blame() end, { desc = 'Git Blame Buffer' })

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

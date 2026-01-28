return {
  'chentoast/marks.nvim',
  event = 'VeryLazy',
  opts = {
    default_mappings = false,
    builtin_marks = { '.', '<', '>', '^' },
    cyclic = true,
  },
  config = function(_, opts)
    require('marks').setup(opts)

    local map = vim.keymap.set
    map('n', '<leader>m', require('marks').toggle, { desc = 'Toggle mark' })
    map('n', '<leader>]', require('marks').next,   { desc = 'Next mark' })
    map('n', '<leader>[', require('marks').prev,   { desc = 'Prev mark' })

    -- open marks list in the location list
    map('n', '<leader>ml', '<Cmd>MarksListAll<CR>', { desc = 'Marks → location list' })

    -- alternate: use quickfix instead
    map('n', '<leader>mq', '<Cmd>MarksQFListAll<CR>', { desc = 'Marks → quickfix' })
  end,
}

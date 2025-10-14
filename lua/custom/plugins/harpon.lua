return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      settings = {
        save_on_toggle = false,
        save_on_change = true,
        enter_on_sendcmd = false,
        tmux_autoclose_windows = false,
        excluded_filetypes = { 'harpoon' },
        mark_branch = false,
        tabline = false,
        tabline_prefix = ' ',
        tabline_suffix = ' ',
      },
      menu = { width = 60, height = 10 },
      telescope = {
        -- telescope integration options (left empty in your snippet)
      },
    },
    config = function(_, opts)
      -- colon call ensures Harpoon’s methods receive the correct self
      require('harpoon'):setup(opts)
    end,
    keys = function()
      local keys = {
        {
          '<leader>hd',
          function()
            require('harpoon'):list():remove()
          end,
          desc = 'Harpoon Remove Current File',
        },
        {
          '<leader>a',
          function()
            require('harpoon'):list():add()
          end,
          desc = 'Harpoon File',
        },
        {
          '<leader>h',
          function()
            local harpoon = require 'harpoon'
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = 'Harpoon Quick Menu',
        },
      }

      -- <leader>1 to <leader>5 jump to marks 1–5
      for i = 1, 5 do
        table.insert(keys, {
          '<leader>' .. i,
          function()
            require('harpoon'):list():select(i)
          end,
          desc = 'Harpoon to File ' .. i,
        })
      end

      return keys
    end,
  },
}

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = { "<leader>`" },
  opts = {
    open_mapping = [[<leader>`]],
    direction = "float",
    float_opts = {
      border = "curved",
    },
    shade_terminals = false,
  },
}

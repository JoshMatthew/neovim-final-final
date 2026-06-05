return {
  {
    "chrisgrieser/nvim-early-retirement",
    config = true,
    event = "VeryLazy",
    opts = {
      retirementAgeMins = 20,
      notificationOnAutoClose = true,
    },
  },
  {
    "zeioth/garbage-day.nvim",
    dependencies = "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      aggressive_mode = false,
      notifications = true,
    },
  },
}

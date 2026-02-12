return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  opts = {
    interactions = {
      chat = {
        adapter = "opencode",
      },
      inline = {
        adapter = "copilot",
      },
      cmd = {
        adapter = "opencode",
      },
    }
  }
}

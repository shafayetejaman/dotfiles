return {
  {
    "folke/snacks.nvim",
    opts = {
      words = { enabled = false },
      terminal = {
        win = {
          position = "float",
          border = "single",
        },
      },
      picker = {
        win = {
          input = {
            keys = {
              ["J"] = { "preview_scroll_down", mode = { "n" } },
              ["K"] = { "preview_scroll_up", mode = { "n" } },
            },
          },
        },
      },
    },
  },
}

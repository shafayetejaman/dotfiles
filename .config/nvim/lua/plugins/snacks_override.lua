return {
  {
    "folke/snacks.nvim",
    opts = {
      notifier = {
        enabled = true,
        level = vim.log.levels.WARN,         -- only show WARN and ERROR
        -- level = vim.log.levels.ERROR, -- only show real errors (hides progress too)
      },
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

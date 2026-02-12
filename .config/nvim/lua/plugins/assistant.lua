return {
  {
    "A7lavinraj/assistant.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>aa", "<cmd>w<cr><cmd>Assistant<cr>", desc = "Assistant.nvim" },
    },
    opts = {
      commands = {
        python = {
          extension = "py",
          template = vim.fn.expand("/home/shafayet/workspace/CP/.cph/template.py"),
          compile = nil,
          execute = {
            main = "python3",
            args = { "$FILENAME_WITH_EXTENSION" },
          },
        },
      },
      ui = {
        border = 'single',
        diff_mode = true,
        title_components_separator = '',
      },
    },
  },
}

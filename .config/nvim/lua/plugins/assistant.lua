return {
  {
    "A7lavinraj/assistant.nvim",
    lazy = false,
    keys = {
      { "<leader>a", "<cmd>w<cr><cmd>Assistant<cr>", desc = "Assistant.nvim" },
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

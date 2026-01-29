return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    "zbirenbaum/copilot.lua",
    "nvim-lua/plenary.nvim",
  },
  opts = {
    question_header = " You ",
    answer_header = " Copilot ",
    window = {
      layout = "float",
    },
  },
  keys = {
    {
      "<leader>ci",
      function()
        require("CopilotChat").ask(
          "Complete or improve the selected code",
          { selection = require("CopilotChat.select").visual }
        )
      end,
      mode = { "v" },
      desc = "Copilot inline prompt",
    },
  },
}

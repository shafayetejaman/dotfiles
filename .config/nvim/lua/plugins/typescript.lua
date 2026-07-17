return {
  -- 1. Disable the default TypeScript servers in lspconfig
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = { enabled = false },
        ts_ls = { enabled = false },
        tsserver = { enabled = false },
      },
    },
  },

  -- 2. Configure typescript-tools to run as the primary LSP instead
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
}

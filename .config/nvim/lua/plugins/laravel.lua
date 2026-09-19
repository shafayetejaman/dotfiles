return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })
    end,
    opts = {
      servers = {
        laravel_lsp = {
          cmd = { "laravel-lsp" },
          filetypes = { "php", "blade" },
          root_dir = function(bufnr, on_dir)
            local root = vim.fs.root(bufnr, "artisan")
            if root then
              on_dir(root)
            end
          end,
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, { "blade" })
    end,
  },
}
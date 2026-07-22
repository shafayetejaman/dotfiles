-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = true
vim.opt.clipboard = ""
vim.opt.list = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- ~/.config/nvim/lua/config/lazy.lua
vim.api.nvim_set_hl(0, "MiniCursorword", {})
vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", {})
-- turn off cursor line highlight
vim.opt.cursorline = false
vim.opt.shortmess:append("I") -- disables intro/startup messages
vim.cmd("silent! messages clear")
vim.o.shell = "zsh"
vim.lsp.log.set_level("OFF")

-- LSP performance: increase debounce and reduce priority
vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
  vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx, vim.tbl_extend("force", config or {}, {
    debounce = 500,
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
  }))
end

-- Always use OSC 52 for the + and * clipboards if it is available. Fixes problems, when you open Neovim on a remote server from a local tmux session.
local has_osc52, osc52 = pcall(require, "vim.ui.clipboard.osc52")
if has_osc52 then
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = osc52.copy("+"),
      ["*"] = osc52.copy("*"),
    },
    paste = {
      ["+"] = osc52.paste("+"),
      ["*"] = osc52.paste("*"),
    },
  }
end

-- Automatically save the current buffer when it loses focus or you leave it
vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
  callback = function()
    -- Only save if it's a real file (not a prompt or UI buffer) and is modified
    if vim.bo.modified and not vim.bo.readonly and vim.bo.buftype == "" then
      vim.cmd("silent! write")
    end
  end,
})

-- Automatically remove unused imports (and organize them) on save for JS/TS projects
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = vim.api.nvim_create_augroup("ts_imports", { clear = true }),
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
  callback = function(args)
    if not args.buf or not vim.api.nvim_buf_is_valid(args.buf) then
      return
    end
    local clients = vim.lsp.get_clients({ bufnr = args.buf, name = "typescript-tools" })
    if #clients == 0 then
      clients = vim.lsp.get_clients({ bufnr = args.buf, method = "source/organizeImports" })
    end
    if #clients == 0 then
      return
    end
    vim.lsp.buf.code_action({
      apply = true,
      context = {
        only = { "source.organizeImports" },
        diagnostics = {},
      },
    })
  end,
})

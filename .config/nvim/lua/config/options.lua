-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = true
vim.opt.clipboard = ""
vim.opt.list = false

-- ~/.config/nvim/lua/config/lazy.lua
vim.api.nvim_set_hl(0, "MiniCursorword", {})
vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", {})
-- turn off cursor line highlight
vim.opt.cursorline = false
vim.opt.shortmess:append("I") -- disables intro/startup messages
vim.cmd("silent! messages clear")
vim.o.shell = "zsh"

-- Always use OSC 52 for the + and * clipboards if it is available. Fixes problems, when you open Neovim on a remote server from a local tmux session.
local has_osc52, osc52 = pcall(require, 'vim.ui.clipboard.osc52')
if has_osc52 then
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = osc52.copy('+'),
      ['*'] = osc52.copy('*'),
    },
    paste = {
      ['+'] = osc52.paste('+'),
      ['*'] = osc52.paste('*'),
    },
  }
end

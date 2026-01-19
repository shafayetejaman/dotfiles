-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local opts = { desc = "Custom clipboard mapping", silent = true }

-- Yank to system clipboard
-- Normal and visual modes
map({ "n" }, "Y", '"+yy', opts)
map({ "v" }, "Y", '"+y', opts)

-- Paste from system clipboard
-- Normal and visual modes
map({ "n", "v" }, "<leader>p", '"+p', opts)
map({ "n" }, "<tab>", "i <Tab> <Esc>", opts)
map({ "n", "v" }, "<A-a>", 'gg V G "+y <Esc>', opts)

vim.keymap.set({ "n" }, "<leader>cp", function()
  vim.fn.setreg("+", vim.fn.expand("%:p")) -- + register = system clipboard
  print("Copied absolute path to clipboard")
end, opts)

vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

-- Alt+u / Alt+d behave like Ctrl+u / Ctrl+d
vim.keymap.set("n", "<M-u>", "<C-u>", opts)
vim.keymap.set("n", "<M-d>", "<C-d>", opts)

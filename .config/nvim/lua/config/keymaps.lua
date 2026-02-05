-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local unmap = vim.keymap.del
local opts = { desc = "Custom clipboard mapping", silent = true }

-- Yank to system clipboard
-- Normal and visual modes
map({ "n" }, "Y", '"+yy', opts)
map({ "v" }, "Y", '"+y', opts)

-- Paste from system clipboard
-- Normal and visual modes
map({ "n", "v" }, "<leader>p", '"+p', opts)
map({ "n" }, "<tab>", "i<Tab><Esc>", opts)
map({ "n" }, "<A-a>", '<Esc>ggVG"+y<Esc>', opts)

map("n", "<leader>cp", function()
  vim.fn.setreg("+", vim.fn.expand("%:p")) -- + register = system clipboard
  print("Copied absolute path to clipboard")
end, opts)

map("n", "U", "<C-r>", { desc = "Redo" })

-- Alt+u / Alt+d behave like Ctrl+u / Ctrl+d
map("n", "<M-K>", "<C-u>", opts)
map("n", "<M-J>", "<C-d>", opts)
map("n", "<leader>w", function()
  vim.cmd("w")
  vim.cmd("close")
end, { desc = "Save and close split" })

map("n", "<leader>\\", "<cmd>vsplit<cr>", { desc = "Split window right" })
map("n", "<M-S-DOWN>", "yyp")
map("n", "<M-S-UP>", "yyP")

unmap("n", "<leader>|")

map("n", "<leader>0", '\"0p')

map({ "v" }, "<A-S-Down>", "yp", opts)
map({ "v" }, "<A-S-Up>", "yP", opts)
map({ "n" }, "<A-S-Down>", "yyp", opts)
map({ "n" }, "<A-S-Up>", "yyP", opts)


-- map("n", "<leader>r", 'viwy:%s/<C-r>"/', {
--   desc = "Replace all occurrences of word under cursor",
-- })
--
-- map("v", "<leader>r", 'y:%s/<C-r>"/', {
--   desc = "Replace all occurrences of visual selection",
-- })

return {
  "mg979/vim-visual-multi",
  lazy = false,
  init = function()
    vim.g.VM_mouse_mappings = 0
    vim.g.VM_default_mappings = 0

    vim.g.VM_maps = {
      ["Find Under"]         = "<C-d>",
      ["Find Subword Under"] = "<C-d>",
      ["Select All"]         = "<C-S-l>",
      ["Add Cursor Down"]    = "<S-Down>",
      ["Add Cursor Up"]      = "<S-Up>",
      ["Undo"]               = "<C-z>",
      ["Redo"]               = "<C-y>",
      ["Add Cursor At Pos"]  = "<M-x>",
      ["Goto Prev"]          = "<leader>[",
      ["Goto Next"]          = "<leader>]"

    }

    vim.api.nvim_set_hl(0, "VM_Cursor", {
      bg = "Grey60",
      fg = "Black",
    })
  end,
}

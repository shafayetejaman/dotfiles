return {
    "brenton-leighton/multiple-cursors.nvim",
    version = "*",
    opts = {
        -- Retain custom keymaps or commands inside multiple-cursor mode if needed
    },
    keys = {
        -- Find next match and add cursor (<C-d>)
        {
            "<C-d>",
            "<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
            mode = { "n", "x" },
            desc = "Add cursor & find next match",
        },

        -- Skip current match and jump to next (<C-k>)
        { "<C-k>", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Skip match and jump next" },

        -- Select all matches (<Alt-l>)
        { "<A-l>", "<Cmd>MultipleCursorsAddMatches<CR>", mode = { "n", "x" }, desc = "Select all matches" },

        -- Add cursor down / up (<Shift-Down> / <Shift-Up>)
        { "<S-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "i", "x" }, desc = "Add cursor down" },
        { "<S-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "i", "x" }, desc = "Add cursor up" },

        -- Mouse click cursor toggle
        {
            "<C-LeftMouse>",
            "<Cmd>MultipleCursorsMouseAddDelete<CR>",
            mode = { "n", "i" },
            desc = "Add/remove cursor with mouse",
        },

        -- Lock virtual cursors toggle
        { "<C-l>", "<Cmd>MultipleCursorsLock<CR>", mode = { "n", "x" }, desc = "Lock virtual cursors" },
    },
    config = function(_, opts)
        require("multiple-cursors").setup(opts)

        -- Set custom highlights for virtual cursors (migrated from VM_Cursor)
        vim.api.nvim_set_hl(0, "MultipleCursorsCursor", {
            bg = "#f2a0a0",
            fg = "Black",
        })
        vim.api.nvim_set_hl(0, "MultipleCursorsVisual", {
            bg = "#b2c3ff",
            fg = "Black",
        })
    end,
}

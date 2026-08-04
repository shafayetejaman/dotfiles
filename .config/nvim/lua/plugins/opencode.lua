return {
    "nickjvandyke/opencode.nvim",
    version = "*", -- Latest stable release
    event = "VeryLazy",

    config = function()
        ---@type opencode.Opts
        vim.g.opencode_opts = {
            -- Your configuration, if any; goto definition on the type for details
        }

        -- Refactored keymaps using <leader>a
        vim.keymap.set({ "n", "x" }, "<leader>ai", function()
            require("opencode").ask("@this: ")
        end, { desc = "Ask OpenCode…" })

        vim.keymap.set({ "n", "x" }, "<leader>as", function()
            require("opencode").select()
        end, { desc = "Select OpenCode prompt/action…" })

        vim.keymap.set({ "n", "x" }, "<leader>ao", function()
            return require("opencode").operator("@this ")
        end, { desc = "Append range to OpenCode", expr = true })

        vim.keymap.set({ "n" }, "<leader>aa", function()
            return require("opencode").operator("@this ") .. "_"
        end, { desc = "Append line to OpenCode", expr = true })

        vim.keymap.set({ "n" }, "<leader>au", function()
            require("opencode").command("session.half.page.up")
        end, { desc = "Scroll OpenCode up" })

        vim.keymap.set({ "n" }, "<leader>ad", function()
            require("opencode").command("session.half.page.down")
        end, { desc = "Scroll OpenCode down" })
    end,
}

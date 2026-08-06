return {
    {
        "folke/snacks.nvim",
        opts = function(_, opts)
            opts.words = { enabled = false }
            opts.notifier = {
                enabled = true,
                level = vim.log.levels.WARN, -- only show WARN and ERROR
                -- level = vim.log.levels.ERROR, -- only show real errors (hides progress too)
            }
            opts.terminal = {
                win = {
                    position = "float",
                    border = "single",
                },
            }
            opts.picker = {
                win = {
                    input = {
                        keys = {
                            ["J"] = { "preview_scroll_down", mode = { "n" } },
                            ["K"] = { "preview_scroll_up", mode = { "n" } },
                            ["-"] = { "edit_split", mode = { "n" } },
                            ["\\"] = { "edit_vsplit", mode = { "n" } },
                        },
                    },
                },
            }

            -- make sure dashboard/preset exists
            opts.dashboard = opts.dashboard or {}
            opts.dashboard.preset = opts.dashboard.preset or {}
            opts.dashboard.preset.keys = opts.dashboard.preset.keys or {}

            -- insert *after* the Lazy button
            -- find index of Lazy shortcut
            local insert_at = 1
            for i, entry in ipairs(opts.dashboard.preset.keys) do
                if entry.key == "l" then
                    insert_at = i + 1
                    break
                end
            end

            table.insert(opts.dashboard.preset.keys, insert_at, {
                icon = "󰺵 ",
                key = "L",
                desc = "LeetCode",
                action = ":Leet",
            })

            return opts
        end,
    },
}

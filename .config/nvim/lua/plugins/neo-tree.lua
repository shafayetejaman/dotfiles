return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
        -- 1. Enable normal mode globally for dialogs
        opts.enable_normal_mode_for_inputs = true

        -- to enter normal mode instead of closing the prompt window.
        opts.event_handlers = opts.event_handlers or {}
        table.insert(opts.event_handlers, {
            event = "neo_tree_popup_input_ready",
            ---@param args { bufnr: integer, winid: integer }
            handler = function(args)
                vim.keymap.set("i", "<esc>", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
            end,
        })

        -- 3. Merging your window mapping preferences safely
        opts.window = vim.tbl_deep_extend("force", opts.window or {}, {
            mappings = {
                ["P"] = {
                    "toggle_preview",
                    config = { use_float = true },
                },
                ["l"] = "open",
                ["h"] = "open",
                ["<Left>"] = "open",
                ["<Right>"] = "open",
                ["-"] = "open_split",
                ["\\"] = "open_vsplit",
                ["v"] = "select",
            },
        })

        -- 4. Adding your filesystem configurations
        opts.filesystem = vim.tbl_deep_extend("force", opts.filesystem or {}, {
            filtered_items = {
                hide_dotfiles = false,
            },
            follow_current_file = {
                enabled = true,
                leave_dirs_open = false,
            },
        })

        -- 5. Adding your buffer configurations
        opts.buffers = vim.tbl_deep_extend("force", opts.buffers or {}, {
            follow_current_file = {
                enabled = true,
            },
        })

        -- 6. Adding your relative line numbers event handler
        table.insert(opts.event_handlers, {
            event = "neo_tree_buffer_enter",
            handler = function()
                vim.cmd("setlocal relativenumber")
            end,
        })
    end,
}

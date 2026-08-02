return {
    {
        name = "theme-hotreload",
        dir = vim.fn.stdpath("config"),
        lazy = false,
        priority = 1000,
        config = function()
            local transparency_file = vim.fn.stdpath("config") .. "/plugin/after/transparency.lua"

            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyReload",
                callback = function()
                    vim.schedule(function()
                        -- Unload the theme module so a changed theme file is re-read
                        package.loaded["plugins.theme"] = nil

                        local ok, theme_spec = pcall(require, "plugins.theme")
                        if not ok then
                            return
                        end

                        -- Apply the theme. opts.colorscheme is a function that sets all
                        -- highlights (and clears them first), so call it directly.
                        for _, spec in ipairs(theme_spec) do
                            if spec[1] == "LazyVim/LazyVim" and spec.opts and spec.opts.colorscheme then
                                pcall(spec.opts.colorscheme)
                                break
                            end
                        end

                        -- Let plugins react to the new theme before re-applying transparency last
                        vim.api.nvim_exec_autocmds("ColorScheme", { modeline = false })
                        vim.api.nvim_exec_autocmds("VimEnter", { modeline = false })

                        vim.defer_fn(function()
                            -- Re-apply transparency settings
                            if vim.fn.filereadable(transparency_file) == 1 then
                                vim.cmd.source(transparency_file)
                            end

                            -- Force redraw to update all UI elements
                            vim.cmd("redraw!")
                        end, 50)
                    end)
                end,
            })
        end,
    },
}

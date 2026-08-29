return {
    {
        "nvim-lualine/lualine.nvim",
        opts = function(_, opts)
            -- override the default time component in lualine_z
            opts.sections.lualine_z = {
                {
                    function()
                        return " " .. os.date("%I:%M %p")
                    end,
                },
            }
            opts.sections.lualine_y = {}
            -- Filter out the "lazy.status.updates" component from lualine_x
            opts.sections.lualine_x = vim.tbl_filter(function(component)
                return type(component) ~= "table" or component[1] ~= require("lazy.status").updates
            end, opts.sections.lualine_x or {})

            -- Replace near-black status bar backgrounds with dark gray
            opts.options = opts.options or {}
            opts.options.theme = function()
                local name = vim.g.colors_name or "aether"
                local ok, base = pcall(require, "lualine.themes." .. name)
                if not ok then
                    return "auto"
                end
                for _, sections in pairs(base) do
                    if type(sections) == "table" then
                        for _, color in pairs(sections) do
                            if color.bg == "#171723" or color.bg == "#0f0f17" then
                                color.bg = "#43435a"
                            end
                        end
                        if sections.c then
                            sections.c.bg = nil
                        end
                        if sections.x then
                            sections.x.bg = nil
                        end
                    end
                end
                return base
            end
        end,
    },
}

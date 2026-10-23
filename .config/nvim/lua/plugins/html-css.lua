return {
    {
        "Jezda1337/nvim-html-css",
        event = "BufReadPre",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            enable_on = { "html", "php", "blade" },
            style_sheets = {
                "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css",
            },
            -- Configures hover/preview window inside the autocomplete list
            documentation = {
                auto_show = true,
            },
        },
    },
}

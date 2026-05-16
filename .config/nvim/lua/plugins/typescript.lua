-- lua/plugins/typescript.lua
return {
    "neovim/nvim-lspconfig",
    opts = {
        servers = {
            vtsls = { -- or tsgo if using it
                settings = {
                    typescript = {
                        tsserver = {
                            maxTsServerMemory = 8192, -- start with 4096
                        },
                    },
                },
                on_attach = function(client)
                    client.server_capabilities.semanticTokensProvider = nil
                end,
            },
        },
    },
}

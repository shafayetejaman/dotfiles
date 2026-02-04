return {
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    opts = {
      enabled = function()
        return not vim.tbl_contains({ "lua", "markdown" }, vim.bo.filetype)
      end,

      cmdline = { enabled = false },

      completion = {
        keyword = { range = 'full' },
        accept = { auto_brackets = { enabled = true } },

        list = {
          selection = {
            preselect = function(ctx) return vim.bo.filetype ~= 'markdown' end,
            auto_insert = true,
          }
        },

        menu = {
          auto_show = false,
          draw = {
            columns = {
              { "label",     "label_description", gap = 1 },
              { "kind_icon", "kind" }
            }
          }
        },

        documentation = { auto_show = true, auto_show_delay_ms = 500 },

        ghost_text = {
          enabled = true,
          show_with_menu = true,
          show_with_selection = true,
          show_without_selection = false,
        },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      snippets = { preset = 'default' },

      signature = {
        enabled = true,
        trigger = {
          enabled = false,
        }
      },

      keymap = {
        preset = "default",

        -- Tab: cycle next, accept if nothing else
        ["<Tab>"] = { "select_next", "accept", "fallback" },

        -- Shift-Tab: cycle previous
        ["<S-Tab>"] = { "select_prev", "fallback" },

        -- Enter: accept ghost text / selected item
        ["<CR>"] = { "accept", "fallback" },

        -- Manual show menu
        ["<C-Space>"] = { "show", "fallback" },
      },
    },
  },
}

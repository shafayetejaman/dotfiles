return {
  {
    "saghen/blink.cmp",
    opts_extend = {
      "sources.completion.enabled_providers",
      "sources.compat",
      "sources.default",
    },
    dependencies = {
      "rafamadriz/friendly-snippets",
      -- add blink.compat to dependencies
      {
        "saghen/blink.compat",
        optional = true, -- make optional so it's only enabled if any extras need it
        opts = {},
        version = not vim.g.lazyvim_blink_main and "*",
      },
    },
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
      enabled = function()
        return not vim.tbl_contains({ "lua", "markdown" }, vim.bo.filetype)
      end,


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
            },
            treesitter = { "lsp" },
          }
        },

        documentation = { auto_show = true, auto_show_delay_ms = 800 },

        ghost_text = {
          enabled = true,
          show_with_menu = true,
          show_with_selection = true,
          show_without_selection = false,
        },
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
        ["<C-j>"] = { "select_next", "accept", "fallback" },

        -- Shift-Tab: cycle previous
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },

        -- Enter: accept ghost text / selected item
        ["<CR>"] = { "accept", "fallback" },

        -- Manual show menu
        ["<C-Space>"] = { "show", "fallback" },
      },

      -- sources = {
      --   -- adding any nvim-cmp sources here will enable them
      --   -- with blink.compat
      --   compat = {},
      --   default = { "lsp", "path", "snippets", "buffer" },
      -- },
      sources = {
        providers = {
          lsp = {
            -- example: keep only unique by label
            transform_items = function(_, items)
              local seen = {}
              local new = {}

              for _, item in ipairs(items) do
                local key = item.label .. (item.kind or "")
                if not seen[key] then
                  seen[key] = true
                  table.insert(new, item)
                end
              end

              return new
            end,
          },
        },
      },
      appearance = {
        -- sets the fallback highlight groups to nvim-cmp's highlight groups
        -- useful for when your theme doesn't support blink.cmp
        -- will be removed in a future release, assuming themes add support
        use_nvim_cmp_as_default = false,
        -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
      },

      cmdline = {
        enabled = true,
        keymap = {
          preset = "cmdline",
          ["<Right>"] = false,
          ["<Left>"] = false,
          -- Tab: cycle next, accept if nothing else
          ["<Tab>"] = { "select_next", "accept", "fallback" },
          ["<C-j>"] = { "select_next", "accept", "fallback" },

          -- Shift-Tab: cycle previous
          ["<S-Tab>"] = { "select_prev", "fallback" },
          ["<C-k>"] = { "select_prev", "fallback" },

        },
      },
    },
  },
}

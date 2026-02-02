-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.highlights")
require("plugins.assistant")

require("neo-tree").setup({
  window = {
    mappings = {
      ["P"] = {
        "toggle_preview",
        config = {
          use_float = true,
          -- use_image_nvim = true,
          -- use_snacks_image = true,
          -- title = 'Neo-tree Preview',
        },
      },
      ["l"] = "open",
      ["h"] = "open",
      ["s"] = "open_split",
      ["v"] = "open_vsplit",
    }
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
    }
  },
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function(arg)
        vim.cmd [[
          setlocal relativenumber
        ]]
      end,
    }
  }
})

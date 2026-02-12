-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
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
    },
    follow_current_file = {
      enabled = true,          -- This auto-focuses the current file in the tree whenever the active buffer changes
      leave_dirs_open = false, -- Optional: If false, auto-expanded directories will close after focusing (keeps the tree tidy)
    },
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
  },
  -- Optionally for the buffers source (if you use it):
  buffers = {
    follow_current_file = {
      enabled = true,
    },
  },

})

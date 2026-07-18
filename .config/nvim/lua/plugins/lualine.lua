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
    end,
  },
}

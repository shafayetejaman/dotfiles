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
    end,
  },
}

return {
  {
    "nvim-mini/mini.surround",
    event = "VeryLazy",
    silent = true,
    opts = {
      mappings = {
        delete = "ds",
        replace = "cs",
        add = "ys"
      },
      custom_surroundings = {
        ["("] = { output = { left = "(", right = ")" } },
        ["{"] = { output = { left = "{", right = "}" } },
        ["["] = { output = { left = "[", right = "]" } },
        ["<"] = { output = { left = "<", right = ">" } },
      },
    },
  },
}

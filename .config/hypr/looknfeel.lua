-- Change the default Omarchy look'n'feel.

-- https://wiki.hypr.land/Configuring/Basics/Variables/#general
hl.config({
  general = {
    gaps_in = 3,
    gaps_out = 7,
    border_size = 2,
  },
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
hl.config({
  decoration = {
    rounding = 10,
  },
})

-- Disable workspace switching animation
hl.animation({ leaf = "workspaces", enabled = false })

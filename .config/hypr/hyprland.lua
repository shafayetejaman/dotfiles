-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/Start/

-- Omarchy's bootstrap keeps path setup out of this user config.
dofile((os.getenv("OMARCHY_PATH") or "/usr/share/omarchy") .. "/default/hypr/bootstrap.lua")

-- Load Omarchy defaults.
require("default.hypr.omarchy")

-- Put your personal overrides in these files. They're loaded after Omarchy's
-- defaults so package updates can improve the defaults without rewriting your
-- ~/.config/hypr files.
require("hypr.monitors")
require("hypr.input")
require("hypr.bindings")
require("hypr.looknfeel")
require("hypr.autostart")

-- Toggle config flags dynamically.
require("default.hypr.toggles")

-- Smart single-window borders removal
hl.config({
  workspace = {
    "w[tv1],bordersize:0",
    "f[1],bordersize:0",
  },
})

o.window({ workspace = "w[tv1]" }, { border_size = 0 })

-- Opacity rules
o.window("zen", { opacity = "1 1" })
o.window("code", { opacity = "1 1" })
o.window("dev.zed.Zed", { opacity = "1 1" })
o.window("com.mitchellh.ghostty", { opacity = "1 1" })

-- Float and size rules
o.window("org.gnome.gThumb", { float = true, size = { 900, 600 } })
o.window("org.kde.haruna", { float = true, size = { 900, 600 } })

-- Cursor theme
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "19")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "19")

-- Ecosystem
hl.config({
  ecosystem = {
    no_donation_nag = true,
  },
})

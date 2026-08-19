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

-- Smart gaps: no borders/gaps when only one window on workspace
hl.workspace_rule({ workspace = "w[tv1]", border_size = 0 })
hl.workspace_rule({ workspace = "f[1]", border_size = 0 })

-- Opacity override (must use "override" keyword to bypass theme's decoration.active_opacity multiplier)
o.window("zen", { opacity = "1.0 override 1.0 override" })

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

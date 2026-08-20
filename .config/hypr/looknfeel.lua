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
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "calm" })

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

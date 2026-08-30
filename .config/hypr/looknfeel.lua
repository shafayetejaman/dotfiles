-- Change the default Omarchy look'n'feel.

-- https://wiki.hypr.land/Configuring/Basics/Variables/#general
hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 8,
		border_size = 2,
	},
})

-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
hl.config({
	decoration = {
		rounding = 12,
	},
})

-- Disable workspace switching animation
hl.animation({ leaf = "workspaces", enabled = false })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2.6, bezier = "easeOutQuint" })

-- Smart gaps: no borders/gaps when only one window on workspace
hl.workspace_rule({ workspace = "w[tv1]", border_size = 0 })
hl.workspace_rule({ workspace = "f[1]", border_size = 0 })
hl.window_rule({
	match = {
		float = true,
	},
	border_size = 2,
})

-- Opacity override (must use "override" keyword to bypass theme's decoration.active_opacity multiplier)
o.window("zen", { opacity = "1.0 override 1.0 override" })

-- File finder overlay pops instantly: no compositor layer fade/slide.
hl.layer_rule({ match = { namespace = "shafayet-finder" }, no_anim = true, animation = "none" })

-- Float and size rules
o.window("org.gnome.gThumb", { float = true, size = { 900, 600 } })
o.window("org.kde.haruna", { float = true, size = { 900, 600 } })
o.window("org.localsend.localsend_app", { float = true, size = { 900, 700 } })

-- Cursor theme
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "23")

-- Layout override
hl.config({
	general = {
		layout = "scrolling",
	},
})

-- User look'n'feel overrides (replaces ~/.config/hypr/looknfeel.conf)

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
		rounding = 12,
	},
})

-- Smart single-window borders removal
hl.workspace_rule({ workspace = "w[tv1]", border_size = 0 })
hl.workspace_rule({ workspace = "f[1]", border_size = 0 })

-- Opacity overrides for specific apps
o.window("zen", { opacity = "1.0 1.0" })
o.window("code", { opacity = "1.0 1.0" })
o.window("dev.zed.Zed", { opacity = "1.0 1.0" })
o.window("com.mitchellh.ghostty", { opacity = "1.0 1.0" })

-- Float and size rules
o.window("org.gnome.gThumb", { float = true, border_size = 2, size = { 900, 600 } })
o.window("org.kde.haruna", { float = true, border_size = 2, size = { 900, 600 } })
o.window("org.localsend.localsend_app", { float = true, border_size = 2, size = { 900, 700 } })

-- Cursor theme
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "23")

-- Layout override
hl.config({
	general = {
		layout = "scrolling",
	},
})

-- Workspace 2 uses dwindle layout
hl.workspace_rule({ workspace = "2", layout = "dwindle" })

-- User autostart overrides (replaces ~/.config/hypr/autostart.conf)

hl.on("hyprland.start", function()
	-- Launch apps on specific workspaces
	hl.exec_cmd("zen-browser", { workspace = "2" })
	hl.exec_cmd("ghostty", { workspace = "3 silent" })

	-- Set wallpaper
	hl.exec_cmd("omarchy-theme-bg-next")

	-- Battery check
	hl.exec_cmd(os.getenv("HOME") .. "/dotfiles/.local/bin/battery-watch")

	-- Night light
	hl.exec_cmd("uwsm app -- hyprsunset")
end)

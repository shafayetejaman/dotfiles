-- User autostart overrides (replaces ~/.config/hypr/autostart.conf)

hl.on("hyprland.start", function()
	-- Launch apps on specific workspaces
	hl.exec_cmd("zen-browser", { workspace = "2" })
	hl.exec_cmd("ghostty", { workspace = "3 silent" })

	-- Set wallpaper
	hl.exec_cmd("omarchy-theme-bg-next")

	-- Battery check (inline)
	local f = io.open("/sys/class/power_supply/BAT0/status", "r")
	if f then
		local status = f:read("*a"):gsub("%s+", "")
		f:close()
		if status == "Discharging" then
			hl.exec_cmd("notify-send '   Not plugged in'")
		end
	end

	-- Night light
	hl.exec_cmd("uwsm app -- hyprsunset")
end)

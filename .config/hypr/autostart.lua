-- Extra autostart processes.
hl.on("hyprland.start", function()
	hl.exec_cmd("python3 /home/shafayet/Work/shutdownTimer/1.0.py")
	hl.exec_cmd("zen-browser", { workspace = "2 silent" })
	hl.exec_cmd("ghostty", { workspace = "3" })
	hl.exec_cmd("omarchy-theme-bg-next")
end)

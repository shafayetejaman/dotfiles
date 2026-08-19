-- Extra autostart processes.
hl.on("hyprland.start", function()
  hl.exec_cmd("python3 /home/shafayet/Work/shutdownTimer/1.0.py")
  hl.exec_cmd("hyprctl dispatch exec [workspace 2] zen-browser")
  hl.exec_cmd("hyprctl dispatch exec [workspace 3] ghostty")
  hl.exec_cmd("sleep 1 && hyprctl dispatch workspace 3")
  hl.exec_cmd("omarchy-theme-bg-next")
  hl.exec_cmd("wl-clip-persist --clipboard regular")
  -- Persistent workspace on HDMI-A-1
  hl.exec_cmd("hyprctl keyword workspace 3,persistent,monitor:HDMI-A-1")
end)

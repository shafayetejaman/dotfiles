-- Replica of ~/.local/share/omarchy/default/hypr/bindings/utilities.conf

-- Menus
o.bind("SUPER + SPACE", "Launch apps", "omarchy-launch-walker")
o.bind("SUPER + CTRL + E", "Emoji picker", "omarchy-launch-walker -m symbols")
o.bind("SUPER + CTRL + C", "Capture menu", "omarchy-menu capture")
o.bind("SUPER + CTRL + O", "Toggle menu", "omarchy-menu toggle")
o.bind("SUPER + CTRL + H", "Hardware menu", "omarchy-menu hardware")
o.bind("SUPER + ALT + SPACE", "Omarchy menu", "omarchy-menu")
o.bind("SUPER + SHIFT + code:201", "Omarchy menu", "omarchy-menu")
o.bind("SUPER + ESCAPE", "System menu", "omarchy-menu system")
hl.bind("XF86PowerOff", hl.dsp.exec_cmd("omarchy-menu system"), { locked = true, description = "Power menu" })
o.bind("SUPER + K", "Show key bindings", "omarchy-menu-keybindings")
o.bind("XF86Calculator", "Calculator", "gnome-calculator")

-- Aesthetics
o.bind("SUPER + SHIFT + SPACE", "Toggle top bar", "omarchy-toggle-waybar")
o.bind("SUPER + CTRL + SPACE", "Theme background menu", "omarchy-menu background")
o.bind("SUPER + SHIFT + CTRL + SPACE", "Theme menu", "omarchy-menu theme")
o.bind("SUPER + BACKSPACE", "Toggle window transparency", "omarchy-hyprland-window-transparency-toggle")
o.bind("SUPER + SHIFT + BACKSPACE", "Toggle window gaps", "omarchy-hyprland-window-gaps-toggle")
o.bind("SUPER + CTRL + BACKSPACE", "Toggle single-window square aspect", "omarchy-hyprland-window-single-square-aspect-toggle")

-- Notifications
o.bind("SUPER + COMMA", "Dismiss last notification", "makoctl dismiss")
o.bind("SUPER + SHIFT + COMMA", "Dismiss all notifications", "makoctl dismiss --all")
o.bind("SUPER + CTRL + COMMA", "Toggle silencing notifications", "omarchy-toggle-notification-silencing")
o.bind("SUPER + ALT + COMMA", "Invoke last notification", "makoctl invoke")
o.bind("SUPER + SHIFT + ALT + COMMA", "Restore last notification", "makoctl restore")

-- Toggles
o.bind("SUPER + CTRL + I", "Toggle locking on idle", "omarchy-toggle-idle")
o.bind("SUPER + CTRL + N", "Toggle nightlight", "omarchy-toggle-nightlight")
o.bind("SUPER + CTRL + Delete", "Toggle laptop display", "omarchy-hyprland-monitor-internal toggle")
o.bind("SUPER + CTRL + ALT + Delete", "Toggle laptop display mirroring", "omarchy-hyprland-monitor-internal-mirror toggle")
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("omarchy-hw-external-monitors && omarchy-hyprland-monitor-internal off"), { locked = true })
hl.bind("switch:off:Lid Switch", hl.dsp.exec_cmd("omarchy-hyprland-monitor-internal on"), { locked = true })

-- Captures
o.bind("PRINT", "Screenshot", "omarchy-capture-screenshot")
o.bind("ALT + PRINT", "Screenrecording", "omarchy-menu screenrecord")
o.bind("SUPER + PRINT", "Color picker", "pkill hyprpicker || hyprpicker -a")
o.bind("SUPER + CTRL + PRINT", "Extract text (OCR) from screenshot", "omarchy-capture-text-extraction")

-- File sharing
o.bind("SUPER + CTRL + S", "Share", "omarchy-menu share")

-- Transcoding
o.bind("SUPER + CTRL + period", "Transcode", "omarchy-transcode")

-- Reminders
o.bind("SUPER + CTRL + R", "Set reminder", "omarchy-menu reminder-set")
o.bind("SUPER + CTRL + ALT + R", "Show reminders", "omarchy-reminder show")
o.bind("SUPER + SHIFT + CTRL + R", "Clear reminders", "omarchy-reminder clear")

-- Waybar-less information
o.bind("SUPER + CTRL + ALT + T", "Show time", "notify-send -u low \"    $(date +\"%A %H:%M  ·  %d %B %Y  ·  Week %V\")\"")
o.bind("SUPER + CTRL + ALT + B", "Show battery remaining", "notify-send -u low \"$(omarchy-battery-status)\"")
o.bind("SUPER + CTRL + ALT + W", "Show weather", "notify-send -u low \"$(omarchy-weather-status)\"")

-- Control panels
o.bind("SUPER + CTRL + A", "Audio controls", "omarchy-launch-audio")
o.bind("SUPER + CTRL + B", "Bluetooth controls", "omarchy-launch-bluetooth")
o.bind("SUPER + CTRL + W", "Wifi controls", "omarchy-launch-wifi")
o.bind("SUPER + CTRL + T", "Activity", "omarchy-launch-tui btop")

-- Dictation
o.bind("SUPER + CTRL + X", "Toggle dictation", "voxtype record toggle")
o.bind("F9", "Start dictation (push-to-talk)", "voxtype record start")
hl.bind("F9", hl.dsp.exec_cmd("voxtype record stop"), { release = true, description = "Stop dictation (push-to-talk)" })

-- Zoom
o.bind("SUPER + CTRL + Z", "Zoom in", "hyprctl keyword cursor:zoom_factor $(hyprctl getoption cursor:zoom_factor -j | jq '.float + 1')")
o.bind("SUPER + CTRL + ALT + Z", "Reset zoom", "hyprctl keyword cursor:zoom_factor 1")

-- Lock system
o.bind("SUPER + CTRL + L", "Lock system", "omarchy-system-lock")

-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- Application bindings
o.bind("SUPER + RETURN", "Terminal", "alacritty")
o.bind("SUPER + SHIFT + F", "File manager", "nautilus --new-window ~/Downloads")
o.bind("SUPER + ALT + SHIFT + F", "File manager (cwd)", "nautilus --new-window $(omarchy-cmd-terminal-cwd)")
o.bind("SUPER + SHIFT + B", "Browser", "omarchy-launch-browser")
o.bind("SUPER + SHIFT + ALT + B", "Browser (private)", "omarchy-launch-browser --private")
o.bind("SUPER + SHIFT + N", "Editor", "omarchy-launch-tui ~/dotfiles/.local/bin/launch-nvim-tmux")
o.bind("SUPER + SHIFT + ALT + D", "Docker", { tui = "lazydocker" })
o.bind("SUPER + SHIFT + D", "Google Drive", "omarchy-launch-webapp 'https://drive.google.com/drive/u/0/my-drive' --profile-directory='Profile 5'")
o.bind("SUPER + SHIFT + O", "Obsidian", "omarchy-launch-or-focus ^obsidian$ 'uwsm-app -- obsidian'")

-- Web apps
o.bind("SUPER + SHIFT + A", "Gemini", "omarchy-launch-webapp 'https://gemini.google.com/app' --profile-directory='Profile 5'")
o.bind("SUPER + SHIFT + ALT + A", "Local AI", "omarchy-launch-webapp 'http://127.0.0.1:7000' --profile-directory='Profile 5'")
o.bind("SUPER + SHIFT + C", "Calendar", "omarchy-launch-webapp 'https://calendar.google.com/calendar/u/0/r/month?trp=false' --profile-directory='Profile 5'")
o.bind("SUPER + SHIFT + M", "Manual", "omarchy-launch-webapp 'https://quickref.me' --profile-directory='Profile 5'")
o.bind("SUPER + SHIFT + W", "Draw", "omarchy-launch-webapp 'https://excalidraw.com' --profile-directory='Profile 5'")
o.bind("SUPER + SHIFT + H", "Healp", "omarchy-launch-webapp 'https://quickref.me' --profile-directory='Profile 5'")
o.bind("SUPER + SHIFT + E", "Email", "omarchy-launch-webapp 'https://mail.google.com/mail/u/0/##inbox' --profile-directory='Profile 5'")
o.bind("SUPER + SHIFT + ALT + E", "Email Compose", "omarchy-launch-webapp 'https://mail.google.com/mail/u/0/?view=cm&fs=1&to=recipient@gmail.com' --profile-directory='Profile 5'")
o.bind("SUPER + SHIFT + Y", "YouTube", "omarchy-launch-webapp 'https://youtube.com/' --profile-directory='Profile 5'")
o.bind("SUPER + SHIFT + L", "Translate", "omarchy-launch-webapp 'https://translate.google.com/?sl=en&tl=bn&op=translate' --profile-directory='Profile 5'")
o.bind("SUPER + SHIFT + G", "Messenger", "omarchy-launch-or-focus-webapp WhatsApp 'https://www.messenger.com' --profile-directory='Profile 5'")

-- Utilities
o.bind("SUPER + Y", "Yazi File Manager", "omarchy-launch-tui yazi ~/Downloads")
o.bind("SUPER + CTRL + ALT + C", "Calculator", "gnome-calculator")
o.bind("SUPER + E", "Clipboard", "omarchy-launch-walker -m clipboard")
o.bind("SUPER + PERIOD", "Restore Last Notification", "makoctl restore")

-- Night Light toggle
hl.unbind("SUPER + CTRL + N")
o.bind("SUPER + CTRL + N", "Night Light", [[
  if pgrep hyprsunset < /dev/null; then
    pkill hyprsunset & notify-send -u low "   Night Light Disabled";
  else
    hyprsunset -t 2000 & notify-send -u low "  Night Light Enabled";
  fi
]])

-- Workspace navigation
hl.unbind("SUPER + TAB")
o.bind("SUPER + TAB", "Switch to previous workspace", "hyprctl dispatch workspace previous")

-- Volume controls
o.bind("SUPER + CTRL + equal", "Volume up", "swayosd-client --output-volume raise")
o.bind("SUPER + CTRL + minus", "Volume down", "swayosd-client --output-volume lower")
o.bind("SUPER + CTRL + 0", "Mute", "swayosd-client --output-volume mute-toggle")
o.bind("SUPER + CTRL + M", "Mute microphone", "omarchy-audio-input-mute")

-- Brightness controls
o.bind("SUPER + CTRL + bracketleft", "Decrease Brightness", "~/dotfiles/.config/hypr/scripts/brightness-control down")
o.bind("SUPER + CTRL + bracketright", "Increase Brightness", "~/dotfiles/.config/hypr/scripts/brightness-control up")

-- Unbind mouse bindings
hl.unbind("SUPER + mouse_up")
hl.unbind("SUPER + mouse_down")

-- Audio control
hl.unbind("SUPER + CTRL + V")
hl.unbind("SUPER + CTRL + A")
o.bind("SUPER + CTRL + V", "Audio Control", "omarchy-launch-or-focus-tui wiremix --tab output")

-- Scratchpad
hl.unbind("SUPER + ALT + S")
o.bind("SUPER + SHIFT + S", "Move window to scratchpad", "hyprctl dispatch movetoworkspacesilent special:scratchpad")

-- Share
hl.unbind("SUPER + CTRL + S")
o.bind("SUPER + CTRL + S", "Share", "~/dotfiles/.local/bin/localsend-share-menu")

-- Universal select all (Ghostty uses ALT+A, others use CTRL+A)
o.bind("SUPER + A", "Universal select all", [[
  WINDOW_CLASS=$(hyprctl activewindow -j | jq -r '.class')
  if [ "$WINDOW_CLASS" = "com.mitchellh.ghostty" ]; then
    hyprctl dispatch sendshortcut "ALT, A, class:^(com\.mitchellh\.ghostty)$"
  else
    hyprctl dispatch sendshortcut "CTRL, A, activewindow"
  fi
]])

-- Universal delete last word (Ghostty uses CTRL+DELETE, others use CTRL+BACKSPACE)
o.bind("CTRL + BACKSPACE", "Universal delete last word", [[
  WINDOW_CLASS=$(hyprctl activewindow -j | jq -r '.class')
  if [ "$WINDOW_CLASS" = "com.mitchellh.ghostty" ]; then
    hyprctl dispatch sendshortcut "CTRL, DELETE, class:^(com\.mitchellh\.ghostty)$"
  else
    hyprctl dispatch sendshortcut "CTRL, BACKSPACE, activewindow"
  fi
]])

-- Rename files (F2)
o.bind("SUPER + R", "Rename Files", "hyprctl dispatch sendshortcut ', F2, activewindow'")

-- Mouse shortcuts
o.bind("SHIFT + mouse:273", "Send Backspace", "hyprctl dispatch sendshortcut ', BackSpace, activewindow'")
o.bind("CTRL + mouse:273", "Send Delete", "hyprctl dispatch sendshortcut ', Delete, activewindow'")

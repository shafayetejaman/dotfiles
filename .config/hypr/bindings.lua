-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

local function send_shortcut_once(mods, key)
  return function()
    hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "down" }))
    hl.timer(function()
      hl.dispatch(hl.dsp.send_key_state({ mods = mods, key = key, state = "up" }))
    end, { timeout = 50, type = "oneshot" })
  end
end

-- Application bindings
hl.unbind("SUPER + SHIFT + ALT + D")
o.bind("SUPER + SHIFT + ALT + D", "Docker", { tui = "lazydocker" })
hl.unbind("SUPER + SHIFT + D")
o.bind(
	"SUPER + SHIFT + D",
	"Google Drive",
	"omarchy-launch-webapp 'https://drive.google.com/drive/u/0/my-drive' --profile-directory='Profile 5'"
)

-- Web apps
hl.unbind("SUPER + SHIFT + A")
o.bind(
	"SUPER + SHIFT + A",
	"Gemini",
	"omarchy-launch-webapp 'https://gemini.google.com/app' --profile-directory='Profile 5'"
)
hl.unbind("SUPER + SHIFT + ALT + A")
o.bind(
	"SUPER + SHIFT + ALT + A",
	"Local AI",
	"omarchy-launch-webapp 'http://127.0.0.1:7000' --profile-directory='Profile 5'"
)
hl.unbind("SUPER + SHIFT + C")
o.bind(
	"SUPER + SHIFT + C",
	"Calendar",
	"omarchy-launch-webapp 'https://calendar.google.com/calendar/u/0/r/month?trp=false' --profile-directory='Profile 5'"
)
hl.unbind("SUPER + SHIFT + M")
o.bind("SUPER + SHIFT + M", "Manual", "omarchy-launch-webapp 'https://quickref.me' --profile-directory='Profile 5'")
hl.unbind("SUPER + SHIFT + W")
o.bind("SUPER + SHIFT + W", "Draw", "omarchy-launch-webapp 'https://excalidraw.com' --profile-directory='Profile 5'")
o.bind("SUPER + SHIFT + H", "Healp", "omarchy-launch-webapp 'https://quickref.me' --profile-directory='Profile 5'")
hl.unbind("SUPER + SHIFT + E")
o.bind(
	"SUPER + SHIFT + E",
	"Email",
	"omarchy-launch-webapp 'https://mail.google.com/mail/u/0/##inbox' --profile-directory='Profile 5'"
)
hl.unbind("SUPER + SHIFT + ALT + E")
o.bind(
	"SUPER + SHIFT + ALT + E",
	"Email Compose",
	"omarchy-launch-webapp 'https://mail.google.com/mail/u/0/?view=cm&fs=1&to=recipient@gmail.com' --profile-directory='Profile 5'"
)
o.bind("SUPER + SHIFT + L", "Translate", "omarchy-launch-webapp 'https://translate.google.com/?sl=en&tl=bn&op=translate' --profile-directory='Profile 5'")
hl.unbind("SUPER + SHIFT + G")
o.bind(
	"SUPER + SHIFT + G",
	"Messenger",
	"omarchy-launch-or-focus-webapp WhatsApp 'https://www.messenger.com' --profile-directory='Profile 5'"
)

-- Utilities
o.bind("SUPER + Y", "Yazi File Manager", "omarchy-launch-tui yazi ~/Downloads")
o.bind("SUPER + E", "Clipboard", "omarchy-launch-walker -m clipboard")
o.bind("SUPER + PERIOD", "Restore Last Notification", "makoctl restore")

-- Night Light toggle
hl.unbind("SUPER + CTRL + N")
o.bind(
	"SUPER + CTRL + N",
	"Night Light",
	[[
  if pgrep hyprsunset < /dev/null; then
    pkill hyprsunset & notify-send -u low "   Night Light Disabled";
  else
    hyprsunset -t 2000 & notify-send -u low "  Night Light Enabled";
  fi
]]
)

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
hl.unbind("SUPER + SHIFT + S")
o.bind("SUPER + SHIFT + S", "Move window to scratchpad", "hyprctl dispatch movetoworkspacesilent special:scratchpad")

-- Share
hl.unbind("SUPER + CTRL + S")
o.bind("SUPER + CTRL + S", "Share", "~/dotfiles/.local/bin/localsend-share-menu")

-- Universal select all (Ghostty uses ALT+A, others use CTRL+A)
o.bind("SUPER + A", "Universal select all", function()
  local window = hl.get_active_window()
  if window and window.class == "com.mitchellh.ghostty" then
    send_shortcut_once("ALT", "A")()
  else
    send_shortcut_once("CTRL", "A")()
  end
end)

-- Universal delete last word (Ghostty uses CTRL+DELETE, others use CTRL+BACKSPACE)
o.bind("CTRL + BACKSPACE", "Universal delete last word", function()
  local window = hl.get_active_window()
  if window and window.class == "com.mitchellh.ghostty" then
    send_shortcut_once("CTRL", "Delete")()
  else
    send_shortcut_once("CTRL", "BackSpace")()
  end
end)

-- Rename files (F2)
o.bind("SUPER + R", "Rename Files", "hyprctl dispatch sendshortcut ', F2, activewindow'")

-- Mouse shortcuts
o.bind("SHIFT + mouse:273", "Send Backspace", "hyprctl dispatch sendshortcut ', BackSpace, activewindow'")
o.bind("CTRL + mouse:273", "Send Delete", "hyprctl dispatch sendshortcut ', Delete, activewindow'")

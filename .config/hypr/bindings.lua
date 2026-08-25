-- User binding overrides (replaces ~/.config/hypr/bindings.conf)
-- Unbind defaults before replacing them

----------------------------------------------------------------------
-- Application bindings
----------------------------------------------------------------------

-- File manager
hl.unbind("SUPER + SHIFT + F")
o.bind("SUPER + SHIFT + F", "File manager", "uwsm-app -- nautilus --new-window ~/Downloads")

-- Editor
hl.unbind("SUPER + SHIFT + N")
o.bind("SUPER + SHIFT + N", "Editor", "omarchy-launch-tui ~/dotfiles/.local/bin/launch-nvim-tmux")

----------------------------------------------------------------------
-- Web apps
----------------------------------------------------------------------

hl.unbind("SUPER + SHIFT + A")
o.bind(
	"SUPER + SHIFT + A",
	"Gemini",
	"omarchy-launch-webapp 'https://gemini.google.com/app' '--profile-directory=Profile 5'"
)
hl.unbind("SUPER + SHIFT + ALT + A")
o.bind("SUPER + SHIFT + ALT + A", "Grok", "omarchy-launch-webapp 'https://grok.com' '--profile-directory=Profile 5'")
hl.unbind("SUPER + SHIFT + C")
o.bind(
	"SUPER + SHIFT + C",
	"Calendar",
	"omarchy-launch-webapp 'https://calendar.google.com/calendar/u/0/r/month?trp=false' '--profile-directory=Profile 5'"
)
hl.unbind("SUPER + SHIFT + M")
o.bind("SUPER + SHIFT + M", "Manual", "omarchy-launch-webapp 'https://quickref.me' '--profile-directory=Profile 5'")
hl.unbind("SUPER + SHIFT + W")
o.bind("SUPER + SHIFT + W", "Draw", "omarchy-launch-webapp 'https://excalidraw.com' '--profile-directory=Profile 5'")
o.bind("SUPER + SHIFT + H", "Healp", "omarchy-launch-webapp 'https://quickref.me' '--profile-directory=Profile 5'")
hl.unbind("SUPER + SHIFT + E")
o.bind(
	"SUPER + SHIFT + E",
	"Email",
	"omarchy-launch-webapp 'https://mail.google.com/mail/u/0/##inbox' '--profile-directory=Profile 5'"
)
hl.unbind("SUPER + SHIFT + ALT + E")
o.bind(
	"SUPER + SHIFT + ALT + E",
	"Email Compose",
	"omarchy-launch-webapp 'https://mail.google.com/mail/u/0/?view=cm&fs=1&to=recipient@gmail.com' '--profile-directory=Profile 5'"
)
hl.unbind("SUPER + SHIFT + Y")
o.bind("SUPER + SHIFT + Y", "YouTube", "omarchy-launch-webapp 'https://youtube.com/' '--profile-directory=Profile 5'")
o.bind(
	"SUPER + SHIFT + L",
	"Translate",
	"omarchy-launch-webapp 'https://translate.google.com/?sl=en&tl=bn&op=translate' '--profile-directory=Profile 5'"
)
hl.unbind("SUPER + SHIFT + G")
o.bind(
	"SUPER + SHIFT + G",
	"Messenger",
	"omarchy-launch-or-focus-webapp Messenger 'https://www.messenger.com' '--profile-directory=Profile 5'"
)
hl.unbind("SUPER + SHIFT + D")
o.bind(
	"SUPER + SHIFT + D",
	"Drive",
	"omarchy-launch-or-focus-webapp Drive 'https://drive.google.com/drive/u/0/folders/1nn_k1ZBLLXDLhmLtej2msOI1tjPMGnIO' '--profile-directory=Profile 5'"
)

----------------------------------------------------------------------
-- Utilities
----------------------------------------------------------------------

o.bind("SUPER + Y", "Yazi File Manager", "omarchy-launch-tui yazi ~/Downloads")

o.bind("SUPER + SHIFT + ALT + D", "Lazydocker", "omarchy-launch-tui lazydocker")

-- Fuzzy file finder with preview
hl.unbind("SUPER + PERIOD")
o.bind("SUPER + PERIOD", "File Finder", "omarchy-shell shell toggle shafayet.finder")

-- Clipboard (override default SUPER+CTRL+V)
hl.unbind("SUPER + CTRL + V")
o.bind("SUPER + E", "Clipboard", "omarchy-shell shell toggle omarchy.clipboard")

-- Move window to scratchpad (override default)
hl.unbind("SUPER + ALT + S")
hl.unbind("SUPER + SHIFT + S")
o.bind("SUPER + SHIFT + S", "Move window to scratchpad", function()
	hl.dispatch(hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))
end)

hl.unbind("PRINT")
o.bind("PRINT", "Omashot", "omarchy-shell b.omashot show")

----------------------------------------------------------------------
-- Volume & brightness
----------------------------------------------------------------------

-- Volume (overrides default: shrink/expand window left a lot)
hl.unbind("SUPER + CTRL + EQUAL")
hl.unbind("SUPER + CTRL + MINUS")
-- some keyboard use this keycode for =/-
hl.unbind("SUPER + CTRL + code:20")
hl.unbind("SUPER + CTRL + code:21")
o.bind("SUPER + CTRL + EQUAL", "Volume up", "omarchy-audio-output-volume raise", { locked = true, repeating = true })
o.bind("SUPER + CTRL + MINUS", "Volume down", "omarchy-audio-output-volume lower", { locked = true, repeating = true })

-- Monitor brightness
o.bind(
	"SUPER + CTRL + BRACKETLEFT",
	"Brightness down",
	"omarchy-brightness-display 5%-",
	{ locked = true, repeating = true }
)
o.bind(
	"SUPER + CTRL + BRACKETRIGHT",
	"Brightness up",
	"omarchy-brightness-display +5%",
	{ locked = true, repeating = true }
)

hl.unbind("SUPER + CTRL + M")
o.bind("SUPER + CTRL + M", "Mic Mute", "omarchy-audio-input-mute")

----------------------------------------------------------------------
-- Toggles
----------------------------------------------------------------------

hl.unbind("SUPER + CTRL + N")
o.bind("SUPER + CTRL + N", "Night light toggle", function()
	local handle = io.popen("pgrep hyprsunset")
	local result = handle:read("*a")
	handle:close()

	if result and result ~= "" then
		hl.exec_cmd("pkill hyprsunset")
		hl.exec_cmd("omarchy osd -i '' -m 'Night Light Disabled'")
	else
		hl.exec_cmd("hyprsunset -t 2000")
		hl.exec_cmd("omarchy osd -i '' -m 'Night Light Enabled'")
	end
end)

hl.unbind("SUPER + CTRL + I")
o.bind("SUPER + CTRL + I", "Lock screen on idle toggle", function()
	hl.exec_cmd("omarchy-toggle-idle")
	hl.exec_cmd("omarchy osd -i '' -m 'Toggle Idle Lock'")
end)

----------------------------------------------------------------------
-- Workspace navigation
----------------------------------------------------------------------

-- Override default SUPER+TAB (was: next workspace, now: previous)
hl.unbind("SUPER + TAB")
o.bind("SUPER + TAB", "Switch to previous workspace", function()
	hl.dispatch(hl.dsp.focus({ workspace = "previous" }))
end)

-- Unbind mouse bindings
hl.unbind("SUPER + mouse_up")
hl.unbind("SUPER + mouse_down")

----------------------------------------------------------------------
-- Universal shortcuts
----------------------------------------------------------------------

-- Helper function to check if active window matches a substring
local function is_ghostty()
	local w = hl.get_active_window()
	if not w then
		return false
	end

	local class = (w.class or ""):lower()
	local title = (w.title or ""):lower()
	local initial_title = (w.initialTitle or w.initial_title or ""):lower()

	return class:find("ghostty") ~= nil or title:find("ghostty") ~= nil or initial_title:find("ghostty") ~= nil
end

-- Select all: Ghostty uses ALT+A, others CTRL+A
hl.unbind("SUPER + A")
o.bind("SUPER + A", "Universal select all", function()
	if is_ghostty() then
		hl.dispatch(hl.dsp.send_shortcut({ mods = "ALT", key = "A" }))
	else
		hl.dispatch(hl.dsp.send_shortcut({ mods = "CTRL", key = "A" }))
	end
end)

-- Delete last word: Ghostty uses CTRL+DELETE, others CTRL+BACKSPACE
hl.unbind("CTRL + BACKSPACE")
o.bind("CTRL + BACKSPACE", "Universal delete last word", function()
	if is_ghostty() then
		hl.dispatch(hl.dsp.send_shortcut({ mods = "CTRL", key = "Delete" }))
	else
		hl.dispatch(hl.dsp.send_shortcut({ mods = "CTRL", key = "BackSpace" }))
	end
end)

----------------------------------------------------------------------
-- Misc overrides
----------------------------------------------------------------------

-- Rename files (F2)
o.bind("SUPER + R", "Rename Files", function()
	hl.dispatch(hl.dsp.send_shortcut({ mods = "", key = "F2" }))
end)

-- Mouse shortcuts
o.bind("SHIFT + mouse:273", "Send Backspace", function()
	hl.dispatch(hl.dsp.send_shortcut({ mods = "", key = "BackSpace" }))
end)
o.bind("CTRL + mouse:273", "Send Delete", function()
	hl.dispatch(hl.dsp.send_shortcut({ mods = "", key = "Delete" }))
end)

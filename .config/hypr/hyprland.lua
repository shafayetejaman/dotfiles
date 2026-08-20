-- Hyprland Lua configuration for Omarchy 3.8
-- This file is loaded in preference to hyprland.conf by Hyprland 0.56+.
-- All existing .conf files are kept as fallback alternatives.

-- Set up module path so require("omarchy.*") and require("hypr.*") work.
-- On reload, clear cached modules so edits take effect immediately.
local home = os.getenv("HOME") or ""

local reload_prefixes = { "omarchy", "hypr", "theme" }
for module in pairs(package.loaded) do
	for _, prefix in ipairs(reload_prefixes) do
		if module == prefix or module:sub(1, #prefix + 1) == prefix .. "." then
			package.loaded[module] = nil
		end
	end
end

package.path = home
	.. "/.config/hypr/?.lua;"
	.. home
	.. "/.config/hypr/?/init.lua;"
	.. home
	.. "/.config/hypr/?/?.lua;"
	.. package.path

-- Load shared helpers (o.bind, o.window, o.launch, etc.)
require("helpers")

----------------------------------------------------------------------
-- Omarchy defaults (exact replicas of ~/.local/share/omarchy/default/hypr/*.conf)
----------------------------------------------------------------------

require("omarchy.autostart")
require("omarchy.bindings.media")
require("omarchy.bindings.clipboard")
require("omarchy.bindings.tiling")
require("omarchy.bindings.utilities")
require("omarchy.envs")
require("omarchy.looknfeel")
require("omarchy.input")
require("omarchy.windows")

-- Current theme overrides (loaded from ~/.config/hypr/theme/hyprland.lua)
pcall(function()
	require("theme.hyprland")
end)

----------------------------------------------------------------------
-- User overrides (loaded after defaults so they take precedence)
----------------------------------------------------------------------

require("monitors")
require("input")
require("bindings")
require("looknfeel")
require("autostart")

-- Touchscreen disabled by default (toggle via omarchy menu)
hl.device({
	name = "elan-touchscreen",
	enabled = false,
})

-- Ecosystem
hl.config({
	ecosystem = {
		no_donation_nag = true,
	},
})

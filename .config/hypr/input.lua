-- User input overrides (replaces ~/.config/hypr/input.conf)
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input

hl.config({
  input = {
    kb_layout = "us",
    kb_options = "compose:caps",
    repeat_rate = 40,
    repeat_delay = 600,
    numlock_by_default = true,

    touchpad = {
      scroll_factor = 0.4,
    },
  },
})

-- App-specific touchpad scroll speeds
o.window("(Alacritty|kitty|foot)", { scroll_touchpad = 1.5 })
o.window("com.mitchellh.ghostty", { scroll_touchpad = 0.2 })
o.window("(microsoft-edge|chromium)", { scroll_touchpad = 0.2 })

-- Touchpad gestures for changing workspaces
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Touchpad gestures for moving focus (helpful on scrolling layout)
hl.gesture({ fingers = 3, direction = "top", action = function() hl.dispatch(hl.dsp.focus({ direction = "left" })) end })
hl.gesture({ fingers = 3, direction = "bottom", action = function() hl.dispatch(hl.dsp.focus({ direction = "right" })) end })

-- Misc settings
hl.config({
  misc = {
    focus_on_activate = false,
    initial_workspace_tracking = false,
  },
})

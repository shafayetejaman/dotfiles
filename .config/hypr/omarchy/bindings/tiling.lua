-- Replica of ~/.local/share/omarchy/default/hypr/bindings/tiling-v2.conf

-- Close windows
o.bind("SUPER + W", "Close window", function() hl.dispatch(hl.dsp.window.close()) end)
o.bind("CTRL + ALT + DELETE", "Close all windows", "omarchy-hyprland-window-close-all")

-- Control tiling
o.bind("SUPER + J", "Toggle window split", function() hl.dispatch(hl.dsp.layout("togglesplit")) end)
o.bind("SUPER + P", "Pseudo window", function() hl.dispatch(hl.dsp.window.pseudo()) end)
o.bind("SUPER + T", "Toggle window floating/tiling", function() hl.dispatch(hl.dsp.window.float({ action = "toggle" })) end)
o.bind("SUPER + F", "Full screen", function() hl.dispatch(hl.dsp.window.fullscreen({ mode = 0 })) end)
o.bind("SUPER + CTRL + F", "Tiled full screen", function() hl.dispatch(hl.dsp.window.fullscreen_state({ client = 0, agent = 2 })) end)
o.bind("SUPER + ALT + F", "Full width", function() hl.dispatch(hl.dsp.window.fullscreen({ mode = 1 })) end)
o.bind("SUPER + O", "Pop window out (float & pin)", "omarchy-hyprland-window-pop")
o.bind("SUPER + L", "Toggle workspace layout", "omarchy-hyprland-workspace-layout-toggle")

-- Move focus with SUPER + arrow keys
o.bind("SUPER + left", "Focus on left window", function() hl.dispatch(hl.dsp.focus({ direction = "left" })) end)
o.bind("SUPER + right", "Focus on right window", function() hl.dispatch(hl.dsp.focus({ direction = "right" })) end)
o.bind("SUPER + up", "Focus on above window", function() hl.dispatch(hl.dsp.focus({ direction = "up" })) end)
o.bind("SUPER + down", "Focus on below window", function() hl.dispatch(hl.dsp.focus({ direction = "down" })) end)

-- Switch workspaces with SUPER + [1-9; 0]
for i = 1, 10 do
  local key = i % 10
  o.bind("SUPER + " .. key, "Switch to workspace " .. i, function() hl.dispatch(hl.dsp.focus({ workspace = i })) end)
  o.bind("SUPER + SHIFT + " .. key, "Move window to workspace " .. i, function() hl.dispatch(hl.dsp.window.move({ workspace = i })) end)
  o.bind("SUPER + SHIFT + ALT + " .. key, "Move window silently to workspace " .. i, function() hl.dispatch(hl.dsp.window.move({ workspace = i, follow = false })) end)
end

-- Control scratchpad
o.bind("SUPER + S", "Toggle scratchpad", function() hl.dispatch(hl.dsp.workspace.toggle_special("scratchpad")) end)
o.bind("SUPER + ALT + S", "Move window to scratchpad", function() hl.dispatch(hl.dsp.window.move({ workspace = "special:scratchpad", follow = false })) end)

-- TAB between workspaces
o.bind("SUPER + TAB", "Next workspace", function() hl.dispatch(hl.dsp.focus({ workspace = "e+1" })) end)
o.bind("SUPER + SHIFT + TAB", "Previous workspace", function() hl.dispatch(hl.dsp.focus({ workspace = "e-1" })) end)
o.bind("SUPER + CTRL + TAB", "Former workspace", function() hl.dispatch(hl.dsp.focus({ workspace = "previous" })) end)

-- Move workspaces to other monitors
o.bind("SUPER + SHIFT + ALT + left", "Move workspace to left monitor", function() hl.dispatch(hl.dsp.workspace.swap_monitors({ direction = "left" })) end)
o.bind("SUPER + SHIFT + ALT + right", "Move workspace to right monitor", function() hl.dispatch(hl.dsp.workspace.swap_monitors({ direction = "right" })) end)
o.bind("SUPER + SHIFT + ALT + up", "Move workspace to up monitor", function() hl.dispatch(hl.dsp.workspace.swap_monitors({ direction = "up" })) end)
o.bind("SUPER + SHIFT + ALT + down", "Move workspace to down monitor", function() hl.dispatch(hl.dsp.workspace.swap_monitors({ direction = "down" })) end)

-- Swap active window with the one next to it
o.bind("SUPER + SHIFT + left", "Swap window to the left", function() hl.dispatch(hl.dsp.window.swap({ direction = "left" })) end)
o.bind("SUPER + SHIFT + right", "Swap window to the right", function() hl.dispatch(hl.dsp.window.swap({ direction = "right" })) end)
o.bind("SUPER + SHIFT + up", "Swap window up", function() hl.dispatch(hl.dsp.window.swap({ direction = "up" })) end)
o.bind("SUPER + SHIFT + down", "Swap window down", function() hl.dispatch(hl.dsp.window.swap({ direction = "down" })) end)

-- Cycle through applications on active workspace
o.bind("ALT + TAB", "Focus on next window", function() hl.dispatch(hl.dsp.window.cycle_next()) end)
o.bind("ALT + SHIFT + TAB", "Focus on previous window", function() hl.dispatch(hl.dsp.window.cycle_next({ prev = true })) end)

-- Cycle through monitors
o.bind("CTRL + ALT + TAB", "Focus on next monitor", function() hl.dispatch(hl.dsp.focus({ monitor = "+1" })) end)
o.bind("CTRL + ALT + SHIFT + TAB", "Focus on previous monitor", function() hl.dispatch(hl.dsp.focus({ monitor = "-1" })) end)

-- Resize active window
o.bind("SUPER + minus", "Expand window left", function() hl.dispatch(hl.dsp.window.resize({ amount = "-100 0" })) end)
o.bind("SUPER + equal", "Shrink window left", function() hl.dispatch(hl.dsp.window.resize({ amount = "100 0" })) end)
o.bind("SUPER + SHIFT + minus", "Shrink window up", function() hl.dispatch(hl.dsp.window.resize({ amount = "0 -100" })) end)
o.bind("SUPER + SHIFT + equal", "Expand window down", function() hl.dispatch(hl.dsp.window.resize({ amount = "0 100" })) end)

-- Scroll through existing workspaces with SUPER + scroll
o.bind("SUPER + mouse_down", "Scroll active workspace forward", function() hl.dispatch(hl.dsp.focus({ workspace = "e+1" })) end)
o.bind("SUPER + mouse_up", "Scroll active workspace backward", function() hl.dispatch(hl.dsp.focus({ workspace = "e-1" })) end)

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "Move window" })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "Resize window" })

-- Toggle groups
o.bind("SUPER + G", "Toggle window grouping", function() hl.dispatch(hl.dsp.group.toggle()) end)
o.bind("SUPER + ALT + G", "Move active window out of group", function() hl.dispatch(hl.dsp.group.move_window()) end)

-- Join groups
o.bind("SUPER + ALT + left", "Move window to group on left", function() hl.dispatch(hl.dsp.group.move_window({ direction = "left" })) end)
o.bind("SUPER + ALT + right", "Move window to group on right", function() hl.dispatch(hl.dsp.group.move_window({ direction = "right" })) end)
o.bind("SUPER + ALT + up", "Move window to group on top", function() hl.dispatch(hl.dsp.group.move_window({ direction = "up" })) end)
o.bind("SUPER + ALT + down", "Move window to group on bottom", function() hl.dispatch(hl.dsp.group.move_window({ direction = "down" })) end)

-- Navigate a single set of grouped windows
o.bind("SUPER + ALT + TAB", "Next window in group", function() hl.dispatch(hl.dsp.group.next()) end)
o.bind("SUPER + ALT + SHIFT + TAB", "Previous window in group", function() hl.dispatch(hl.dsp.group.prev()) end)

-- Window navigation for grouped windows
o.bind("SUPER + CTRL + left", "Move grouped window focus left", function() hl.dispatch(hl.dsp.group.prev()) end)
o.bind("SUPER + CTRL + right", "Move grouped window focus right", function() hl.dispatch(hl.dsp.group.next()) end)

-- Scroll through a set of grouped windows
o.bind("SUPER + ALT + mouse_down", "Next window in group", function() hl.dispatch(hl.dsp.group.next()) end)
o.bind("SUPER + ALT + mouse_up", "Previous window in group", function() hl.dispatch(hl.dsp.group.prev()) end)

-- Activate window in a group by number
for i = 1, 5 do
  o.bind("SUPER + ALT + " .. i, "Switch to group window " .. i, function() hl.dispatch(hl.dsp.group.active({ index = i })) end)
end

-- Cycle monitor scaling
o.bind("SUPER + slash", "Cycle monitor scaling", "omarchy-hyprland-monitor-scaling-cycle")
o.bind("SUPER + ALT + slash", "Cycle monitor scaling backwards", "omarchy-hyprland-monitor-scaling-cycle --reverse")

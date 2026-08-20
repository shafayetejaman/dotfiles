-- Replica of ~/.local/share/omarchy/default/hypr/bindings/media.conf
-- Laptop multimedia keys for volume and LCD brightness (with OSD)

-- Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("omarchy-swayosd-client --output-volume raise"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("omarchy-swayosd-client --output-volume lower"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("omarchy-swayosd-client --output-volume mute-toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("omarchy-audio-input-mute"), { locked = true, repeating = true })

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("omarchy-brightness-display +5%"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("omarchy-brightness-display 5%-"), { locked = true, repeating = true })
hl.bind("SHIFT + XF86MonBrightnessUp", hl.dsp.exec_cmd("omarchy-brightness-display 100%"), { locked = true, repeating = true })
hl.bind("SHIFT + XF86MonBrightnessDown", hl.dsp.exec_cmd("omarchy-brightness-display 1%"), { locked = true, repeating = true })

-- Keyboard brightness
hl.bind("XF86KbdBrightnessUp", hl.dsp.exec_cmd("omarchy-brightness-keyboard up"), { locked = true, repeating = true })
hl.bind("XF86KbdBrightnessDown", hl.dsp.exec_cmd("omarchy-brightness-keyboard down"), { locked = true, repeating = true })
hl.bind("XF86KbdLightOnOff", hl.dsp.exec_cmd("omarchy-brightness-keyboard cycle"), { locked = true })

-- Touchpad toggle
hl.bind("XF86TouchpadToggle", hl.dsp.exec_cmd("omarchy-toggle-touchpad"), { locked = true })
hl.bind("XF86TouchpadOn", hl.dsp.exec_cmd("omarchy-toggle-touchpad on"), { locked = true })
hl.bind("XF86TouchpadOff", hl.dsp.exec_cmd("omarchy-toggle-touchpad off"), { locked = true })

-- Precise 1% multimedia adjustments with Alt modifier
hl.bind("ALT + XF86AudioRaiseVolume", hl.dsp.exec_cmd("omarchy-swayosd-client --output-volume +1"), { locked = true, repeating = true })
hl.bind("ALT + XF86AudioLowerVolume", hl.dsp.exec_cmd("omarchy-swayosd-client --output-volume -1"), { locked = true, repeating = true })
hl.bind("ALT + XF86MonBrightnessUp", hl.dsp.exec_cmd("omarchy-brightness-display +1%"), { locked = true, repeating = true })
hl.bind("ALT + XF86MonBrightnessDown", hl.dsp.exec_cmd("omarchy-brightness-display 1%-"), { locked = true, repeating = true })

-- Media player controls
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("omarchy-swayosd-client --playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("omarchy-swayosd-client --playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("omarchy-swayosd-client --playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("omarchy-swayosd-client --playerctl previous"), { locked = true })

-- Switch audio output with Super + Mute
hl.bind("SUPER + XF86AudioMute", hl.dsp.exec_cmd("omarchy-audio-output-switch"), { locked = true })

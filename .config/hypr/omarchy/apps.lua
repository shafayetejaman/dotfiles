-- Replica of ~/.local/share/omarchy/default/hypr/apps.conf
-- All 19 app-specific window/layer rules

-- 1Password
o.window("^(1[p|P]assword)$", { no_screen_share = true })
o.window("^(1[p|P]assword)$", { tag = "+floating-window" })

-- Bitwarden
o.window("^(Bitwarden)$", { no_screen_share = true })
o.window("^(Bitwarden)$", { tag = "+floating-window" })
o.window("chrome-nngceckbapebfimnlniiiahkandclblb-Default", { no_screen_share = true })
o.window("chrome-nngceckbapebfimnlniiiahkandclblb-Default", { tag = "+floating-window" })

-- Browsers
o.window("((google-)?[cC]hrom(e|ium)|[bB]rave-browser|[mM]icrosoft-edge|Vivaldi-stable|helium)", { tag = "+chromium-based-browser" })
o.window("([fF]irefox|zen|librewolf)", { tag = "+firefox-based-browser" })
o.window({ tag = "chromium-based-browser" }, { tag = "-default-opacity" })
o.window({ tag = "firefox-based-browser" }, { tag = "-default-opacity" })

-- Video apps: remove chromium browser tag
o.window("(chrome-youtube.com__-Default|chrome-app.zoom.us__wc_home-Default)", { tag = "-chromium-based-browser" })
o.window("(chrome-youtube.com__-Default|chrome-app.zoom.us__wc_home-Default)", { tag = "-default-opacity" })

-- Force chromium-based browsers into a tile
o.window({ tag = "chromium-based-browser" }, { tile = true })
o.window({ tag = "chromium-based-browser" }, { opacity = "1.0 0.985" })
o.window({ tag = "firefox-based-browser" }, { opacity = "1.0 0.985" })

-- Hide screen-sharing notification bar
hl.window_rule({ name = "browser-share-bar", match = { title = ".*is sharing.*" }, workspace = "special silent" })

-- DaVinci Resolve
o.window(".*[Rr]esolve.*", { float = true, stay_focused = true })

-- GeForce
hl.window_rule({
  name = "geforce",
  match = { class = "GeForceNOW" },
  idle_inhibit = "fullscreen",
})

-- Hyprshot
hl.layer_rule({ name = "hyprshot-selection", match = { namespace = "selection" }, no_anim = true })

-- JetBrains
hl.window_rule({
  name = "jetbrains-focus",
  no_follow_mouse = true,
  match = { class = "^(jetbrains-.*)$" },
})

-- LocalSend
o.window("(Share|localsend)", { float = true })
o.window("(Share|localsend)", { center = true })
o.window("localsend", { size = { 1100, 700 } })

-- Moonlight
hl.window_rule({
  name = "moonlight",
  match = { class = "com.moonlight_stream.Moonlight" },
  fullscreen = 1,
  idle_inhibit = "fullscreen",
})

-- Picture-in-Picture
hl.window_rule({ name = "pip-title", match = { title = "Picture.?in.?[Pp]icture" }, tag = "+pip" })
o.window({ tag = "pip" }, { tag = "-default-opacity" })
o.window({ tag = "pip" }, { float = true })
o.window({ tag = "pip" }, { pin = true })
o.window({ tag = "pip" }, { size = { 600, 338 } })
o.window({ tag = "pip" }, { keep_aspect_ratio = true })
o.window({ tag = "pip" }, { border_size = 0 })
o.window({ tag = "pip" }, { opacity = "1 1" })

-- QEMU
o.window("qemu", { tag = "-default-opacity" })
o.window("qemu", { opacity = "1 1" })

-- RetroArch
o.window("com.libretro.RetroArch", { fullscreen = true })
o.window("com.libretro.RetroArch", { tag = "-default-opacity" })
o.window("com.libretro.RetroArch", { opacity = "1 1" })

-- Steam
o.window("steam", { float = true })
o.window("steam", { center = true })
o.window("steam.*", { tag = "-default-opacity" })
o.window("steam.*", { opacity = "1 1" })
o.window("steam", { size = { 1100, 700 } })
hl.window_rule({ name = "steam-friends", match = { class = "steam", title = "Friends List" }, size = { 460, 800 } })

-- System floating windows
o.window({ tag = "floating-window" }, { float = true })
o.window({ tag = "floating-window" }, { center = true })
o.window({ tag = "floating-window" }, { size = { 875, 600 } })

o.window("(org.omarchy.bluetui|org.omarchy.impala|org.omarchy.wiremix|org.omarchy.btop|org.omarchy.terminal|org.omarchy.bash|org.codeberg.dnkl.foot|org.gnome.NautilusPreviewer|org.gnome.Evince|com.gabm.satty|Omarchy|About|TUI.float|imv|mpv)", { tag = "+floating-window" })
o.window("(xdg-desktop-portal-gtk|sublime_text|DesktopEditors)", { tag = "+floating-window" })

-- Float Nautilus file open/save dialogs only
hl.window_rule({
  name = "nautilus-file-dialogs",
  match = { class = "org.gnome.Nautilus", title = "^(Open.*Files?|Open [F|f]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to [open|save].*|[C|c]hoose.*)" },
  tag = "+floating-window",
})
o.window("org.gnome.Calculator", { float = true })

-- Fullscreen screensaver
o.window("org.omarchy.screensaver", { fullscreen = true })
o.window("org.omarchy.screensaver", { float = true })

-- No transparency on media windows
o.window("^(zoom|vlc|mpv|org.kde.kdenlive|com.obsproject.Studio|com.github.PintaProject.Pinta|imv|org.gnome.NautilusPreviewer)$", { tag = "-default-opacity" })
o.window("^(zoom|vlc|mpv|org.kde.kdenlive|com.obsproject.Studio|com.github.PintaProject.Pinta|imv|org.gnome.NautilusPreviewer)$", { opacity = "1 1" })

-- Telegram
o.window("org.telegram.desktop", { focus_on_activate = false })

-- Terminal tag
o.window("(Alacritty|kitty|com.mitchellh.ghostty|foot)", { tag = "+terminal" })
o.window({ tag = "terminal" }, { tag = "-default-opacity" })
o.window({ tag = "terminal" }, { opacity = "0.985 0.96" })

-- Typora print dialog
hl.window_rule({ name = "typora-print", match = { class = "^Typora$", title = "^Print$" }, float = true, center = true })

-- Walker
hl.layer_rule({ name = "walker-no-anim", match = { namespace = "walker" }, no_anim = true })

-- Webcam overlay
o.window("WebcamOverlay", { float = true })
o.window("WebcamOverlay", { pin = true })
o.window("WebcamOverlay", { no_initial_focus = true })
o.window("WebcamOverlay", { no_dim = true })

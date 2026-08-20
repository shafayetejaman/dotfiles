-- Replica of ~/.local/share/omarchy/default/hypr/envs.conf

-- GUM environment variables for styling purposes
pcall(function() require("omarchy.current.theme.gum_env") end)

-- Cursor size
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Force all apps to use Wayland
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("OZONE_PLATFORM", "wayland")
hl.env("XDG_SESSION_TYPE", "wayland")

-- Allow better support for screen sharing (Google Meet, Discord, etc)
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Use XCompose file
hl.env("XCOMPOSEFILE", os.getenv("HOME") .. "/.XCompose")

-- Don't show update on first launch
hl.config({
  ecosystem = {
    no_update_news = true,
  },

  xwayland = {
    force_zero_scaling = true,
  },
})

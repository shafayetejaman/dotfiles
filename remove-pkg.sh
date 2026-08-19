#!/bin/bash
# Remove omarchy packages that are no longer installed

packages=(
    1password-beta 1password-cli aether alacritty alsa-utils
    apple-bcm-firmware apple-t2-audio-config asusctl autoconf-archive
    bash-completion broadcom-wl claude-code cliamp
    dell-xps-touchpad-haptics dkms egl-wayland imv
    intel-ipu7-camera intel-lpmd
    lib32-nvidia-580xx-utils lib32-nvidia-utils libva-nvidia-driver
    linux-firmware linux-firmware-marvell linux-headers
    linux-ptl linux-ptl-headers linux-t2 linux-t2-headers
    macbook12-spi-driver-dkms nvidia-580xx-dkms nvidia-580xx-utils
    nvidia-dkms nvidia-open-dkms nvidia-utils pinta signal-desktop
    spotify system-config-printer t2fanrd tiny-dfr tobi-try
    tuxedo-drivers-nocompatcheck-dkms typora vulkan-asahi vulkan-radeon
    webp-pixbuf-loader xournalpp yay-debug yt6801-dkms gst-plugins-bad
    omawrite omacut moonlight-qt tensaku herdr ttfx qrencode libvips zbar mpv-mpris
    foot
)

for pkg in "${packages[@]}"; do
    if pacman -Qi "$pkg" &>/dev/null; then
        echo "Removing: $pkg"
        sudo pacman -Rns --noconfirm "$pkg"
    else
        echo "Skipping (not installed): $pkg"
    fi
done

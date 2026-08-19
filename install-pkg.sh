#!/bin/bash
# Install non-omarchy packages

# Official repository packages
sudo pacman -S --needed --noconfirm \
    7zip atuin duf ghostty gsimplecal gsmartcontrol \
    gthumb haruna kanata \
    lsof noto-fonts-extra ntfs-3g omarchy-zsh \
    reflector sshfs stow sudo telegram-desktop terminus-font thefuck \
    trash-cli wl-clip-persist \
    yazi yq zed

# AUR packages
yay -S --needed --noconfirm \
    alarm-clock-applet bibata-cursor-theme-bin cht.sh-git doppler-cli-bin \
    losslesscut-bin mpv-thumbnail-script posting postman-bin ripdrag-git \
    ttf-ms-fonts zen-browser-bin zsh-vi-mode

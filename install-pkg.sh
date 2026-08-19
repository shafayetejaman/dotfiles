#!/bin/bash
# Install non-omarchy packages

# Official repository packages
sudo pacman -S --needed --noconfirm \
  7zip atuin clamav duf ghostty gsimplecal gsmartcontrol \
  gst-libav gst-plugins-good gthumb haruna intel-ucode kanata \
  libdvdcss libmpeg2 libva-utils lsof noto-fonts-extra ntfs-3g \
  ntfsprogs omarchy-chromium omarchy-keyring omarchy-zsh opencode \
  reflector sshfs stow sudo telegram-desktop terminus-font thefuck \
  trash-cli ttf-cascadia-mono-nerd ttf-firacode-nerd wl-clip-persist \
  yazi yq zed

# AUR packages
yay -S --needed --noconfirm \
  alarm-clock-applet bibata-cursor-theme-bin cht.sh-git doppler-cli-bin \
  losslesscut-bin mpv-thumbnail-script posting postman-bin ripdrag-git \
  ttf-ms-fonts zen-browser-bin zsh-vi-mode

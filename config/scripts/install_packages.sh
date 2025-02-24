#!/bin/bash

# Ensure the system is up to date
echo "Updating system..."
sudo pacman -Syu --noconfirm

# List of packages to install
PACKAGES=(
  git
  vim
  neovim
  zsh
  curl
  kitty
  polybar
  rofi
  i3-wm
  python-pip
  feh
)

# AUR packages (if needed)
AUR_PACKAGES=(
  python-i3ipc
)

# Install regular packages with pacman
echo "Installing required packages..."
for PACKAGE in "${PACKAGES[@]}"; do
  if ! pacman -Qi "$PACKAGE" &>/dev/null; then
    echo "Installing $PACKAGE..."
    sudo pacman -S --needed --noconfirm "$PACKAGE"
  else
    echo "$PACKAGE is already installed."
  fi
done

# Check if yay is installed for AUR packages
if ! command -v yay &>/dev/null; then
  echo "Installing yay (AUR helper)..."
  sudo pacman -S --needed --noconfirm git base-devel
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay || exit
  makepkg -si --noconfirm
  cd - || exit
  rm -rf /tmp/yay
fi

# Install AUR packages
echo "Installing AUR packages..."
for PACKAGE in "${AUR_PACKAGES[@]}"; do
  if ! yay -Q "$PACKAGE" &>/dev/null; then
    echo "Installing $PACKAGE from AUR..."
    yay -S --needed --noconfirm "$PACKAGE"
  else
    echo "$PACKAGE is already installed."
  fi
done

echo "Package installation complete!"

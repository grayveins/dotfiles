#!/bin/bash

# Define script paths
INSTALL_SCRIPT="$HOME/.config/scripts/install_packages.sh"
CONFIG_SCRIPT="$HOME/.config/scripts/set_config.sh"
FONTS_SCRIPT="$HOME/.config/scripts/set_fonts.sh"

# Ensure the scripts are executable
chmod +x "$INSTALL_SCRIPT" "$CONFIG_SCRIPT" "$FONTS_SCRIPT"

# Install packages (Arch version)
echo "Installing packages..."
bash "$INSTALL_SCRIPT"

# Set config
echo "Applying configuration settings..."
bash "$CONFIG_SCRIPT"

# Set fonts
echo "Installing fonts..."
bash "$FONTS_SCRIPT"

# Setup rofi (Must be run manually from rofi folder)
echo "Rofi setup must be run manually: cd ~/.config/rofi && ./setup.sh"

echo "Setup complete!"

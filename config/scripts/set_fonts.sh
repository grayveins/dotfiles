#!/bin/bash

# Function to install a Nerd Font
install_nerd_font() {
    font_name="FiraCode"
    font_url="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${font_name}.zip"
    font_dir="$HOME/.local/share/fonts"
    tmp_dir=$(mktemp -d)

    echo "Installing $font_name Nerd Font..."

    # Ensure wget or curl is available
    if ! command -v wget &>/dev/null && ! command -v curl &>/dev/null; then
        echo "Error: wget or curl is required but not found. Install it first."
        exit 1
    fi

    # Create fonts directory if it doesn't exist
    mkdir -p "$font_dir"

    # Download and unzip the font
    if command -v wget &>/dev/null; then
        wget -qO "$tmp_dir/${font_name}.zip" "$font_url"
    else
        curl -L -o "$tmp_dir/${font_name}.zip" "$font_url"
    fi

    unzip -qo "$tmp_dir/${font_name}.zip" -d "$font_dir"
    rm -rf "$tmp_dir"

    # Update font cache
    echo "Updating font cache..."
    fc-cache -fv

    # Verify installation
    if fc-list | grep -iq "$font_name"; then
        echo "✅ $font_name Nerd Font installed successfully!"
    else
        echo "❌ Font installation failed!"
        exit 1
    fi
}

# Function to set font for Kitty
set_kitty_font() {
    kitty_conf="$HOME/.config/kitty/kitty.conf"
    font_setting="font_family FiraCode Nerd Font"

    echo "Setting FiraCode Nerd Font in Kitty configuration..."

    # Ensure the kitty.conf file exists
    mkdir -p "$(dirname "$kitty_conf")"
    touch "$kitty_conf"

    # Add font setting only if it doesn't already exist
    if ! grep -q "$font_setting" "$kitty_conf"; then
        echo "$font_setting" >> "$kitty_conf"
        echo "✅ Kitty font updated. Please restart Kitty."
    else
        echo "ℹ️ Kitty font is already set."
    fi
}

# Install font and configure Kitty
install_nerd_font
set_kitty_font


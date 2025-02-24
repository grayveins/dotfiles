#!/bin/bash

# Function to run a command and check its success
run_command() {
    local cmd="$1"

    echo "Running: $cmd"
    eval "$cmd"

    if [ $? -eq 0 ]; then
        echo "✅ Command succeeded: $cmd"
    else
        echo "❌ Command failed: $cmd"
        exit 1
    fi
}

# Ensure Oh My Zsh custom directory is set
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Commands to set up Zsh config properly
commands=(
    "chsh -s $(which zsh)"  # Set Zsh as default shell
    "ln -sf ~/.config/.zshrc ~/.zshrc"  # Symlink Zsh config
    "sh -c \"\$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""  # Install Oh My Zsh
    "ln -sf ~/.config/.oh-my-zsh ~/.oh-my-zsh"  # Symlink Oh My Zsh config
    "mv ~/.config/.p10k.zsh ~/"  # Move powerlevel10k config to home
    "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k"  # Install Powerlevel10k
    "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting"  # Install Syntax Highlighting
    "git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions"  # Install Autosuggestions
)

echo "Setting up Zsh configuration..."
for cmd in "${commands[@]}"; do
    run_command "$cmd"
done

echo "🎉 Zsh setup complete! Restart your terminal or run 'exec zsh' to apply changes."


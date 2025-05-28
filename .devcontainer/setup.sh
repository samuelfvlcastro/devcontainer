#!/bin/bash

echo "Running post-create setup..."

ZSHRC_SOURCE="/workspaces/$(basename "$PWD")/.devcontainer/zshrc"
ZSHRC_TARGET="$HOME/.zshrc"

# Copy custom .zshrc into place
if [ -f "$ZSHRC_SOURCE" ]; then
    echo "Importing custom .zshrc..."
    cp "$ZSHRC_SOURCE" "$ZSHRC_TARGET"
    chown root:root "$ZSHRC_TARGET"
else
    echo "Custom .zshrc not found at $ZSHRC_SOURCE"
fi

# Install Oh My Zsh if not installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "Setup complete!"

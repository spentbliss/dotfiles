#!/bin/bash

read -p "Enter your username: " USERNAME

# Install Homebrew if it's not already installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Adding Homebrew to your PATH..."

    # Check if the line already exists in .zprofile
    if ! grep -q 'eval "$(/opt/homebrew/bin/brew shellenv)"' /Users/$USERNAME/.zprofile; then
        echo >> /Users/$USERNAME/.zprofile
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$USERNAME/.zprofile
    fi

    source /Users/$USERNAME/.zprofile
else
    echo "Homebrew is already installed."
fi

# Check if Homebrew is callable
if ! command -v brew &> /dev/null; then
    echo "Homebrew installation failed or is not callable."
    echo "Attempting to set up the environment."

    eval "$(/opt/homebrew/bin/brew shellenv)"

    # Checking again if Homebrew is callable
    if ! command -v brew &> /dev/null; then
        echo "Homebrew is still not callable. Please check the installation."
        exit 1
    fi
fi

# Disable Homebrew analytics
brew analytics off

# Install programs and fonts
echo "Installing programs and fonts..."
brew install vscode-langservers-extracted btop bat helix eza clang-format lua-language-server prettier black
brew install --cask kitty alt-tab nikitabobko/tap/aerospace keepassxc raycast

# Installing Rust if it's not already installed
if ! command -v rustc &> /dev/null; then
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source "$HOME/.cargo/env"
else
    echo "Rust is already installed."
fi

# Installing Rust LSP
rustup component add rust-analyzer

echo "Moving specified directories to ~/.config/ & ~/Downloads/"
mkdir -p ~/.config
mv ~/dotfiles/aerospace ~/.config/
mv ~/dotfiles/nvim ~/.config/
mv ~/dotfiles/helix ~/.config/
mv ~/dotfiles/kitty ~/.config/
mv ~/dotfiles/moxide ~/.config/
mv ~/dotfiles/fonts ~/Downloads/
mv ~/dotfiles/wallpapers ~/Downloads/
cd

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Cleaning up..."
rm -rf ~/dotfiles

echo "Setup complete!"

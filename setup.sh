#!/bin/bash

# Check if the user has sudo permissions
# if [ "$(id -u)" -ne 0 ]; then
#     echo "This script must be run with sudo."
#     exit 1  
# fi

read -p "Enter your username: " USERNAME

# # Check if the Command Line Tools are installed
# if ! xcode-select -p &> /dev/null; then
#     echo "CLI Tools for Xcode are not installed. Installing..."
#     xcode-select --install

#     echo "Please complete the installation of Command Line Tools."
    
#     # Wait for the installation to complete
#     while ! xcode-select -p &> /dev/null; do
#         echo "Sleeping for 5 seconds just wait for the install to complete."
#         sleep 5 # Checking every 5 seconds if xcode tools are installed.
#     done

#     echo "Command Line Tools installed successfully."
# fi

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
brew install typescript node typescript-language-server vscode-langservers-extracted
brew install python3 btop bat helix
brew install --cask kitty alt-tab nikitabobko/tap/aerospace

# Installing Rust if it's not already installed
if ! command -v rustc &> /dev/null; then
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source "$HOME/.cargo/env" 
else
    echo "Rust is already installed."
fi

# Installing Rust LSP & Markdown Oxide
rustup component add rust-analyzer
cargo install --locked --git https://github.com/Feel-ix-343/markdown-oxide.git markdown-oxide

# Installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Moving specified directories to ~/.config/..."
mkdir -p ~/.config  
mv ~/dotfiles/aerospace ~/.config/ 2>/dev/null
mv ~/dotfiles/helix ~/.config/ 2>/dev/null
mv ~/dotfiles/kitty ~/.config/ 2>/dev/null
mv ~/dotfiles/moxide ~/.config/ 2>/dev/null
mv ~/dotfiles/fonts ~/ 2>/dev/null
cd 
# Installing oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Cleaning up..."
rm -rf ~/dotfiles

echo "Setup complete!"

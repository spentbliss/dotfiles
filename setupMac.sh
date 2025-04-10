#!/bin/bash

# Check if the user has sudo permissions
if sudo -l &> /dev/null; then
    echo "You have sudo privileges."
else
    echo "You do not have sudo privileges. Please re-run the program with sudo privileges."
    exit 1  # Exit the script if no sudo privileges
fi

read -p "Enter your username: " USERNAME

# Install Homebrew if it's not already installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo "Adding homebrew to your PATH..."
    echo >> /Users/$USERNAME/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$USERNAME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew is already installed."
fi

# Install programs and fonts
echo "Installing programs and fonts..."
brew install python3 btop bat font-input alt-tab kitty helix

# Install Rust if it's not already installed
if ! command -v rustc &> /dev/null; then
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    source "$HOME/.cargo/env" 
else
    echo "Rust is already installed."
fi

# Install NVM
if ! command -v nvm &> /dev/null; then
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
else
    echo "NVM is already installed."
fi

# Installing Node.js
echo "Installing Node.js..."
nvm install 23

# Checking Node.js version
echo "Checking Node.js version..."
node -v  
nvm current 

# Checking npm version
echo "Checking npm version..."
npm -v  # Should print "10.9.2"

# Install global npm packages
echo "Installing global npm packages..."
npm install -g vscode-langservers-extracted typescript typescript-language-server pyright

# Adding nvm to path
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  

# Installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Disable homebrew analytics
brew analytics off

echo "Setup complete!"

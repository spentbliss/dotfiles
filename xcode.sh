#!/bin/bash

# Check if the Command Line Tools are installed
if ! xcode-select -p &> /dev/null; then
    echo "CLI Tools for Xcode are not installed. Installing..."
    xcode-select --install

    echo "Please complete the installation of Command Line Tools."
    
    # Wait for the installation to complete
    while ! xcode-select -p &> /dev/null; do
        echo "Sleeping for 5 seconds just wait for the install to complete."
        sleep 5 # Checking every 5 seconds if xcode tools are installed.
    done

    echo "Command Line Tools installed successfully."
fi


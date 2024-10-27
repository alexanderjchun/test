#!/usr/bin/env sh

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting installation process..."

# Change to the home directory
cd "$HOME"
echo "Changed to home directory"

# Install Homebrew using their official install script
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "Homebrew installation complete"

# Setup .zprofile
echo "Setting up .zprofile..."
echo >>/Users/chun/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>/Users/chun/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Use Homebrew to install Ansible
echo "Installing Ansible..."
brew install ansible
echo "Ansible installation complete"

# Source .zprofile
echo "Sourcing .zprofile..."
. .zprofile
echo "Sourcing .zprofile complete"

# Run ansible-pull to clone the repo and execute the playbook
echo "Running ansible-pull..."
ansible-pull -U "https://github.com/alexanderjchun/test" playbooks/main.yml --ask-become-pass
echo "ansible-pull execution complete"

echo "Installation process finished successfully"

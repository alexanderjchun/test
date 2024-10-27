#!/usr/bin/env sh

# Exit immediately if a command exits with a non-zero status
set -e

# Set the URL for the Ansible repository
ANSIBLE_REPO_URL="https://github.com/alexanderjchun/test.git"

# Change to the home directory
cd "$HOME"

# Install Homebrew using their official install script
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Use Homebrew to install Ansible
brew install ansible

# Run ansible-pull to clone the repo and execute the playbook
ansible-pull -U "$ANSIBLE_REPO_URL" playbooks/main.yml --ask-become-pass

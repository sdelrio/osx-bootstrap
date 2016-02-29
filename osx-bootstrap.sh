#!/bin/bash

# Steps:
#
# Install xcode command line tools if needed
# Install brew
# Install Ansible
# Execute playbook main.yml


# Exit on first error
set -e

# Xcode Command Line Tools
xcode-select -p >/dev/null
if [ $? -ne 0 ]; then
    echo "Xcode not detected. Installing Xcode Command Line Tools ..."
    xcode-select --install
fi

# Check for brew
if [[ ! -x /usr/local/bin/brew  ]]; then
    echo "Brew not detected. Installing homebrew ..."
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

# Download and install Ansible
if [[ ! -x /usr/local/bin/ansible ]]; then
    echo "Ansible not detecd. Installing Ansible ..."
    brew update
    brew install ansible
fi

# Specify your defaults app dir for homebrew cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Execute playbook
ansible-playbook main.yml --become


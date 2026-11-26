#!/usr/bin/env bash

#===============================================================================================
# CAPITAN:        Andrés Bretón, dev@andresbreton.com
# REPO:           https://github.com/bretonics/Setup
# LICENSE:        MIT
# FILE:           container.sh
#===============================================================================================
# Configure dotfiles and system environment in a Dev Container.
# Automates the configuration of shell environments and other development tooling when working
# in remote Dev Containers.
# Use this repo by specifying VS Code's `dotfiles` settings (entry should still be `install.sh`).
#===============================================================================================
if [ "${IS_LINUX}" = "true" ]; then
    echo "Running on Linux container"
    . ${LINUX_SCRIPT}
else
    echo "Not running on Linux, exiting.."
    exit 0
fi

echo -e "\nContainer setup complete.\n"

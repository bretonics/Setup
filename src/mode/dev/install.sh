#!/usr/bin/env bash

#===============================================================================================
# RESOURCES
#===============================================================================================
BASE_PATH="$(dirname ${BASH_SOURCE})"
DEV_BREW_FILE="${BASE_PATH}/Brewfile"
NPM_PACKAGES_FILE="${BASE_PATH}/npm.txt"
VS_CODE_EXTENSIONS_FILE="${BASE_PATH}/vscode.txt"

# Set parent path when executing this mode's install.sh directly
if [ -z $SETUP_TYPE ]; then
    PARENT_PATH="${BASE_PATH}/../../.."
fi
source ${PARENT_PATH}/lib/functions

#-----------------------------------------------------------------------------------------------
# MODE INSTALLATION
# - Install all Formulae, Taps, and Mac Apps specified by $MODE_BREW_FILE
section "Dev Installation"
brew bundle --verbose --file ${MODE_BREW_FILE:-${DEV_BREW_FILE}}
message "DONE Homebrew install for 'Dev' mode using '${MODE_BREW_FILE:-${DEV_BREW_FILE}}'"

#-----------------------------------------------------------------------------------------------
# INSTALL CORE RESOURCES
section "Installing ${MODE} Resources"
installNodePackages ${NPM_PACKAGES_FILE}
installVSCodeExt ${VS_CODE_EXTENSIONS_FILE}
setGitDefaultBranch

# Setup Git Hooks
mkdir -p ~/.git_templates/hooks
cp -r ${BASE_PATH}/files/git/hooks ~/.git_templates/hooks
chmod +x ~/.git_templates/hooks/*

# Instantiate Volta
volta install node

#-----------------------------------------------------------------------------------------------
# SHELL COMPLETIONS

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Docker
mkdir -p ~/.docker/completions && docker completion zsh > ~/.docker/completions/_docker
mkdir -p ~/.local/share/bash-completion/completions && docker completion bash > ~/.local/share/bash-completion/completions/docker
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Kubernetes
kubectl completion zsh > "${fpath[1]}/_kubectl"
kubectl completion zsh > /usr/local/share/zsh/site-functions/kubectl 

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
brew bundle --file ${MODE_BREW_FILE:-${DEV_BREW_FILE}}

#-----------------------------------------------------------------------------------------------
# INSTALL CORE RESOURCES
section "Installing ${MODE} Resources"
installNodePackages ${NPM_PACKAGES_FILE}
installVSCodeExt ${VS_CODE_EXTENSIONS_FILE}
setGitDefaultBranch
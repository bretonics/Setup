#!/usr/bin/env bash

#===============================================================================================
# RESOURCES
#===============================================================================================
NPM_PACKAGES_FILE="./npm.txt"
VS_CODE_EXTENSIONS_FILE="./vscode.txt"

# MODE_BREW_CASKS_FILE="${MODE_SOURCE_PATH}casks.txt"
# MODE_BREW_FORMULAE_FILE="${MODE_SOURCE_PATH}formulae.txt"
# MODE_BREW_TAPS_FILE="${MODE_SOURCE_PATH}taps.txt"
# MODE_MAC_APPS_FILE="${MODE_SOURCE_PATH}apps.txt"
# MODE_NPM_PACKAGES_FILE="${MODE_SOURCE_PATH}npm.txt"
# MODE_VS_CODE_EXTENSIONS_FILE="${MODE_SOURCE_PATH}vscode.txt"

#-----------------------------------------------------------------------------------------------
# MODE INSTALLATION
# - Install all Formulae, Taps, and Mac Apps specified by $MODE_BREW_FILE 
brew bundle --file ${MODE_BREW_FILE}

#-----------------------------------------------------------------------------------------------
# INSTALL CORE RESOURCES
section "Installing ${MODE} Resources"
installNodePackages ${NPM_PACKAGES_FILE}
installVSCodeExt ${VS_CODE_EXTENSIONS_FILE}

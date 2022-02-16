#!/usr/bin/env bash

#===============================================================================================
# RESOURCES
#===============================================================================================
OTHER_BREW_FILE="./Brewfile"

#-----------------------------------------------------------------------------------------------
# Fun INSTALLATION
# - Install all Formulae, Taps, and Mac Apps specified by $OTHER_BREW_FILE
section "Other Installation"
brew bundle --file ${OTHER_BREW_FILE}

#-----------------------------------------------------------------------------------------------
# INSTALL CORE RESOURCES

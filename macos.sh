#!/usr/bin/env bash

#===============================================================================================
# CAPITAN:        Andrés Bretón, dev@andresbreton.com
# REPO:           https://github.com/bretonics/Setup
# LICENSE:        MIT
# FILE:           macos.sh
#===============================================================================================
# Configure macOS specific dotfiles and environment
#===============================================================================================

#-----------------------------------------------------------------------------------------------
# SYSTEM SETUP
#-----------------------------------------------------------------------------------------------
section "Homebrew"
installHomebrew

#-----------------------------------------------------------------------------------------------
# MAIN INSTALL (DEFAULT)
# - Install all Formulae, Taps, and Mac Apps specified by $BREW_FILE 
#-----------------------------------------------------------------------------------------------
if [ "$SETUP_TYPE" = "MAIN" ]; then
    section "Main Installation: '${BREW_FILE}'"
    brew bundle --verbose --file ${BREW_FILE}
    message "DONE Homebrew install for Main using '${BREW_FILE}'"

#-----------------------------------------------------------------------------------------------
# ESSENTIALS INSTALL
# - Install all Formulae, Taps, and Mac Apps specified by $ESSENTIALS_BREW_FILE 
#-----------------------------------------------------------------------------------------------
elif [ "$SETUP_TYPE" = "ESSENTIALS" ]; then
    section "Essentials Installation: '${ESSENTIALS_BREW_FILE}'"
    . "${ESSENTIALS_INSTALL_FILE}"

#-----------------------------------------------------------------------------------------------
# ERROR: INSTALL TYPE NOT SUPPORTED
#-----------------------------------------------------------------------------------------------
else
    msg error "Something is terribly wrong. ${SETUP_TYPE} should have never passed."
    exit 1
fi

#!/usr/bin/env bash

#===============================================================================================
# RESOURCES
#===============================================================================================

#-----------------------------------------------------------------------------------------------
# ESSENTIALS INSTALLATION
# - Install all Formulae, Taps, and Mac Apps specified by $ESSENTIALS_BREW_FILE
brew bundle --verbose --file ${ESSENTIALS_BREW_FILE}
message "DONE Homebrew install for 'Essentials' mode using '${ESSENTIALS_BREW_FILE}'"

#-----------------------------------------------------------------------------------------------
# INSTALL CORE RESOURCES

# TODO: copy config files
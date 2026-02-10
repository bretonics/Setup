#!/usr/bin/env bash

#===============================================================================================
# RESOURCES
#===============================================================================================
BASE_PATH="$(dirname ${BASH_SOURCE})"
FUN_BREW_FILE="${BASE_PATH}/Brewfile"

# Set parent path when executing this mode's install.sh directly
if [ -z $SETUP_TYPE ]; then
    PARENT_PATH="${BASE_PATH}/../../.."
fi
source ${PARENT_PATH}/lib/functions

#-----------------------------------------------------------------------------------------------
# FUN INSTALLATION
# - Install all Formulae, Taps, and Mac Apps specified by $MODE_BREW_FILE
section "Fun Installation"
brew bundle --verbose --file ${MODE_BREW_FILE:-${FUN_BREW_FILE}}
message "DONE Homebrew install for 'Fun' mode using '${MODE_BREW_FILE:-${FUN_BREW_FILE}}'"

#-----------------------------------------------------------------------------------------------
# INSTALL CORE RESOURCES

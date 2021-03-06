#!/usr/bin/env bash

#===============================================================================================
# PRE-LAUNCH SETUP
#===============================================================================================
source ./lib/functions
source ./lib/getopts

preFlightChecks
handle_getopts "$@"
loggers

#===============================================================================================
# START RUNNING SETUP
#===============================================================================================
welcome
header

#-----------------------------------------------------------------------------------------------
# SYSTEM SETUP
section "Homebrew"
installHomebrew

#-----------------------------------------------------------------------------------------------
# FULL INSTALL
# - Install all Formulae, Taps, and Mac Apps specified by $BREW_FILE 
if [ "$SETUP_MODE" = "FULL" ]; then
    section "Installing Everything In '${BREW_FILE}'"
    brew bundle --file ${BREW_FILE}

#-----------------------------------------------------------------------------------------------
# ESSENTIALS INSTALL
# - Homebrew Taps specified by $BREW_TAPS_FILE
# - Homebrew Formulae specified by $BREW_FORMULAE_FILE
# - Homebrew Casks specified by $BREW_CASKS_FILE
# - Mac App Store Applications specified by $MAC_APPS_FILE
elif [ "$SETUP_MODE" = "ESSENTIALS" ]; then
    section "Installing Homebrew Taps, Formulae, And Casks"
    addTaps
    installFormulae
    installCasks
    installApps
#-----------------------------------------------------------------------------------------------
# ERROR: INSTALL MODE NOT SUPPORTED
else
    msg error "Something is terribly wrong. ${SETUP_MODE} should have never passed."
    exit 1
fi

#-----------------------------------------------------------------------------------------------
# INSTALL CORE RESOURCES
section "Installing Core Resources"
installNodePackages
installVSCodeExt

#-----------------------------------------------------------------------------------------------
# CLEANUP
section "Clean Up"
cleanUp

#===============================================================================================
# COMPLETED
#===============================================================================================
footer "Primary"

#-----------------------------------------------------------------------------------------------
# SECONDARY INSTALL
if [ $RUN_SECONDARY = true ]; then 
    section "Running Secondary Install"
    # Execute secondary script in the current shell without forking a sub shell
    . ./secondary.sh
fi

#!/usr/bin/env bash

#===============================================================================================
# PRE-LAUNCH SETUP
#===============================================================================================
PARENT_PATH=$(dirname "${BASH_SOURCE[0]}") # relative script path from execution location, same as "${BASH_SOURCE%/*}" or "${BASH_SOURCE}"
source ${PARENT_PATH}/lib/functions
source ${PARENT_PATH}/lib/getopts

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
# MAIN INSTALL (DEFAULT)
# - Install all Formulae, Taps, and Mac Apps specified by $BREW_FILE 
if [ "$SETUP_TYPE" = "MAIN" ]; then
    section "Main Installing: '${BREW_FILE}'"
    brew bundle --file ${BREW_FILE}

#-----------------------------------------------------------------------------------------------
# ESSENTIALS INSTALL
# - Install all Formulae, Taps, and Mac Apps specified by $ESSENTIALS_BREW_FILE 
elif [ "$SETUP_TYPE" = "ESSENTIALS" ]; then
    section "Essentials Installation: '${ESSENTIALS_BREW_FILE}'"
    . "${ESSENTIALS_INSTALL_FILE}"
#-----------------------------------------------------------------------------------------------
# ERROR: INSTALL TYPE NOT SUPPORTED
else
    msg error "Something is terribly wrong. ${SETUP_TYPE} should have never passed."
    exit 1
fi

#-----------------------------------------------------------------------------------------------
# MODE INSTALL
# - MODE_SOURCE_PATH is a 'MODE' directory name under ./src/mode/MODE
# - MODE is the argument passed to -m option, e.g. 'dev'
if [ -d "${MODE_SOURCE_PATH}" ] && [ -f "${MODE_INSTALL_FILE}" ]; then
    section "${MODE} Installation: '${MODE_BREW_FILE}'"
    . "${MODE_INSTALL_FILE}"
fi

#-----------------------------------------------------------------------------------------------
# CLEANUP
section "Clean Up"
cleanUp

#===============================================================================================
# COMPLETED
#===============================================================================================
footer "Primary"

#===============================================================================================
# ADDITIONAL SETUP
#===============================================================================================

#-----------------------------------------------------------------------------------------------
# SECONDARY INSTALL
if [ $RUN_SECONDARY = true ]; then 
    section "Running Secondary Install"
    # Execute secondary script in the current shell without forking a sub shell
    . "${SECONDARY_FILE}"
fi

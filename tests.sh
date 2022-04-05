#!/bin/bash

abort() {
  errorCode=$?
  echo -e "\n********* ABORTED *********\n"
  echo -e "Error: ${errorCode}"
  echo -e "File: "
  echo -e "Line: ${BASH_LINENO[0]}"
  echo -e "Command: ${BASH_COMMAND}"
  echo -e "Bash: ${BASH_VERSION}"
  echo -e "\n***************************\n"
  exit ${errorCode}
}

trap abort 0

echo -e "\nSTARTING TESTS\n"

#  Exit on any error
set -emu -o pipefail

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
echo -e "\nSourcing Libs\n"
PARENT_PATH=$(dirname "${BASH_SOURCE[0]}")
source ${PARENT_PATH}/lib/functions
source ${PARENT_PATH}/lib/getopts
message "Passed!"
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
message "info" "Initiating Logging"
loggers
message "Passed!"
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
message "info" "Pre-flight Checks"
preFlightChecks
message "Passed!"
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
message "info" "Handling Options"
handle_getopts "$@"
message "Passed!"
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
message "info" "Welcome & Header"
welcome
header
message "Passed!"
#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
message "info" "Global Variables"
echo "ADMIN=${ADMIN}"
echo "BASH_PROFILE_FILE=${BASH_PROFILE_FILE}"
echo "BASH_PROFILE_PATH=${BASH_PROFILE_PATH}"
echo "BASH_RC_FILE=${BASH_RC_FILE}"
echo "BASH_RC_PATH=${BASH_RC_PATH}"
echo "BREW_CASKS_FILE=${BREW_CASKS_FILE}"
echo "BREW_FILE=${BREW_FILE}"
echo "BREW_FORMULAE_FILE=${BREW_FORMULAE_FILE}"
echo "BREW_TAPS_FILE=${BREW_TAPS_FILE}"
echo "CURRENT_SHELL=${CURRENT_SHELL}"
echo "DEFAULT_SHELL=${DEFAULT_SHELL}"
echo "DEFAULTS=${DEFAULTS}"
echo "ESSENTIALS_BREW_FILE=${ESSENTIALS_BREW_FILE}"
echo "ESSENTIALS_INSTALL_FILE=${ESSENTIALS_INSTALL_FILE}"
echo "ICLOUD_HOME_PATH=${ICLOUD_HOME_PATH}"
echo "IS_APPLE_CPU=${IS_APPLE_CPU}"
echo "IS_BIG_SUR=${IS_BIG_SUR}"
echo "IS_CATALINA=${IS_CATALINA}"
echo "LIBS_PATH=${LIBS_PATH}"
echo "MAC_APPS_FILE=${MAC_APPS_FILE}"
echo "MAC_OS_VERSION=${MAC_OS_VERSION}"
echo "MODE_DIR_PATH=${MODE_DIR_PATH}"
echo "OS_MAJOR_VERSION=${OS_MAJOR_VERSION}"
echo "OS_MINOR_VERSION=${OS_MINOR_VERSION}"
echo "OS_UNSUPPORTED=${OS_UNSUPPORTED}"
echo "RESTORE_BACKUP=${RESTORE_BACKUP}"
echo "RUN_SECONDARY=${RUN_SECONDARY}"
echo "SECONDARY_FILE=${SECONDARY_FILE}"
echo "SET_DEFAULT_SYSTEM_PREFERENCES=${SET_DEFAULT_SYSTEM_PREFERENCES}"
echo "SETUP_TYPE=${SETUP_TYPE}"
echo "SHELL_PROFILE_FILE=${SHELL_PROFILE_FILE}"
echo "SHELL_RC_FILE=${SHELL_RC_FILE}"
echo "SOURCE_PATH=${SOURCE_PATH}"
echo "USER_NAME=${USER_NAME}"
echo "ZSH_PROFILE_FILE=${ZSH_PROFILE_FILE}"
echo "ZSH_PROFILE_PATH=${ZSH_PROFILE_PATH}"
echo "ZSH_RC_FILE=${ZSH_RC_FILE}"
echo "ZSH_RC_PATH=${ZSH_RC_PATH}"
message "Passed!"

#-----------------------------------------------------------------------------------------------
# Install Help
bash ./install.sh -h

#-----------------------------------------------------------------------------------------------
# Install (No Options)
bash ./install.sh

message "~~~~~ ALL TESTS PASSED ~~~~~"
trap : 0

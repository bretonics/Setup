#!/usr/bin/env bash

#===============================================================================================
# CAPITAN:        Andrés Bretón, dev@andresbreton.com
# REPO:           https://github.com/bretonics/Setup
# LICENSE:        MIT
# FILE:           install.sh
# USAGE:          bash ./install.sh <options>
#===============================================================================================
# Automates the configuration of shell environments and other development tooling.
# This is especially useful when setting up a new Mac or working in remote Dev Containers.
#===============================================================================================



#-----------------------------------------------------------------------------------------------
# PRE-LAUNCH SETUP
#-----------------------------------------------------------------------------------------------

# Determine relative script path from execution location, same as "${BASH_SOURCE%/*}" or "${BASH_SOURCE}"
# Example: Three levels up from `src/mode/dev/install.sh` to `src/`
# ~/Dev/Setup/src/mode/dev ❯ bash ../../../install.sh
# PARENT_PATH === "../../.."
PARENT_PATH=$(dirname "${BASH_SOURCE[0]}")
source ${PARENT_PATH}/lib/functions
source ${PARENT_PATH}/lib/getopts

preFlightChecks
handle_getopts "$@"
if [ "${LOGGING}" = "true" ]; then loggers; fi

#===============================================================================================
# START RUNNING SETUP
#===============================================================================================
welcome
header

#-----------------------------------------------------------------------------------------------
# SYSTEM SETUP
#-----------------------------------------------------------------------------------------------
if [ "${REMOTE_CONTAINERS}" = "true" ]; then
    . ${PARENT_PATH}/container.sh
    exit 0
fi

case "${OS}" in
    Darwin*|darwin*)
        . ./macos.sh
        ;;
    Linux*|linux*)
        . ./linux.sh
        ;;
esac


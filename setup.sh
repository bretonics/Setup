#!/usr/bin/env bash

# ===============================================================================================
#
#`  CAPITAN:        Andrés Bretón, dev@andresbreton.me
#`  REPO:           https://github.com/bretonics/Setup
#`  LICENSE:        MIT (https://bretonics.mit-license.org/)
#`  FILE:           setup.sh
#`  USAGE:          /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/bretonics/Setup/HEAD/setup)"
#
# ===============================================================================================
#   Running the setup without any options below will run a MAIN setup by default. Use the following to accommodate your needs.
#
#   Options:
#
#       -B                      Sync backups from latest Time Machine backup
#       -D                      Use defaults (skip confirmation when applying secondary settings)
#       -E                      Essentials only installations
#       -F                      Run full main install with defaults (Sets -B, -D, -S, and -s)
#       -M                      Main install setup (-s=true)
#       -S                      Set Mac setting system preference defaults (Default: false)
#       -i [main|essentials]    Explicit install type declaration, i.e. -M or -E)
#       -m <mode>               Run additional specified mode installation
#       -s                      Run secondary installation (Default: false)
#       -h                      Prints this usage message
#
#   Most likely you will want to pass your own Brewfile as followed:
#   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/bretonics/Setup/HEAD/setup.sh)" "" ~/absolute/path/to/Brewfile
#
#   You can also pass any of the available options:
#   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/bretonics/Setup/HEAD/setup.sh)" "" -s
#
#   Alternatively, you can download also download the repo (https://github.com/bretonics/Setup/archive/main.zip) and
#   customize the setup to your specifications. See https://github.com/bretonics/Setup#customizable-setup

#   Automatically download repo and NOT start any setup process, allowing you to customize the setup before running it:
#   /bin/bash -c "DOWNLOAD_ONLY_SETUP=true $(curl -fsSL https://raw.githubusercontent.com/bretonics/Setup/HEAD/setup.sh)"
# ===============================================================================================

# Download latest release and start setup process
URL=$(curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/bretonics/Setup/releases/latest \
    | grep "zipball_url" \
    | cut -d '"' -f 4)

curl -L -H "Accept: application/vnd.github.v3+json" --url ${URL} -o Setup.zip

unzip Setup.zip -d Setup
cd Setup/bretonics-Setup*
DOWNLOAD_ONLY_SETUP=${DOWNLOAD_ONLY_SETUP:-false} caffeinate bash ./install.sh "$@"

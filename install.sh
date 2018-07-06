#!/usr/bin/env bash

echo ""
echo "INFO: This script will automate a lot of processes."
echo "Though not recommended to interrupt, exit this script at any time with Ctrl-C."
echo "Press Ctrl-C to STOP now."
sleep 5
echo "Starting automation...."

echo ""
echo ""
echo "================================================================================"
echo "| Script:    $0"
echo "| Run by:    `whoami`"
echo "| On:        `date`"
echo "| PWD:       `pwd`"
echo "| PID:        $$"
echo "================================================================================"
echo ""
echo ""
echo ""

#--------------------------------------------------------------------------------
# SYSTEM SETUP
echo "Installing Homebrew"
printf "================================================================================\n\n"

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null

printf "\n\nAdding taps...\n\n"
brew_taps=(brewsci/bio brewsci/science homebrew/bundle)
for tap in ${brew_taps[@]}; do
    brew tap $tap
done

printf "\n\nDone installing Homebrew.\n\n\n"
sleep 2

echo "Installing Xcode developer tools"
printf "================================================================================\n\n"

xcode-select --install

printf "\n\nDone installing Xcode developer tools.\n\n\n"
sleep 2

#--------------------------------------------------------------------------------
# INSTALL ALL DESIRED FORMULAE
echo "Installing formulae"
printf "================================================================================\n\n"

formulae="src/formulae.txt"
while read -r formula; do
    echo "Installing $formula"
    brew install $formula
    echo ""
done < "$formulae"

printf "\n\nDone installing formulas.\n\n\n"
sleep 2

#--------------------------------------------------------------------------------
# INSTALL ALL DESIRED CASKS (3RD PARTY APPS)
echo "Installing casks"
printf "================================================================================\n\n"

casks="src/casks.txt"
while read -r cask; do
    echo "Installing $cask"
    brew cask install $cask
    echo ""
done < "$casks"

printf "\n\nDone installing casks.\n\n\n"
sleep 2

#--------------------------------------------------------------------------------
# CLEANUP
echo "Cleaning up"
printf "================================================================================\n\n"

echo "Turning OFF sending brew analytics"
brew analytics off

echo "Cleaning up Homebrew downloads and caches"
brew cleanup -s # remove older versions in cellar + old downloads-cache
rm -rf $(brew --cache) # delete all

printf "\n\nDone cleaning up.\n\n\n"
sleep 2

#--------------------------------------------------------------------------------
# INSTALL MAC APPS
echo "Installing apps from Mac App Store"
printf "================================================================================\n\n"

apps="src/apps.txt"
while read -r line; do
    app=$(echo $line | cut -f1 -d" ")
    echo "Installing $app"
    mas install $app
    echo ""
done < "$apps"

printf "\n\nDone installing Mac App Store apps.\n\n\n"
sleep 2


echo "Now go login to accounts (Dropbox, emails, etc...) and then run secondary installs, `sh secondary.sh`."
echo ""
echo ""
echo "================================================================================"
echo "Setup has FINISHED"
echo "================================================================================"
echo ""

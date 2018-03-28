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
echo "Script: $0"
echo "Run by: `whoami`"
echo "On: `date`"
echo "PWD: `pwd`"
echo "PID: $$"
echo "================================================================================"
echo ""
echo ""
echo ""

#--------------------------------------------------------------------------------
# SYSTEM SETUP
echo "Installing Homebrew"
printf "================================================================================\n\n"

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null

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

formulae="asciinema bcftools blast bowtie2 dos2unix gcc git-lfs glances htop hugo imagemagick mas mongodb mysql neofetch openssl rename ssh-copy-id pandoc pandoc-citeproc pkg-config python3 r rbenv readline rename ruby samtools seqtk speedtest-cli sratoolkit tree vcftools xz"

for formula in $formulae
do
    printf "\nInstalling $formula\n"
    brew install $formula
done

printf "\n\nDone installing formulas.\n\n\n"
sleep 2

#--------------------------------------------------------------------------------
# INSTALL ALL DESIRED CASKS (3RD PARTY APPS)
echo "Installing casks"
printf "================================================================================\n\n"

casks="atom alfred dropbox rstudio flux brackets mactex java gitify google-backup-and-sync google-chrome google-drive-file-stream igv spotify virtualbox xquartz"

for cask in $casks
do
    printf "\nInstalling $cask\n"
    brew cask install $cask
    # Handle apps requiring authentication step
    if [ "$cask" == "virtualbox" ]; then
        echo "HOLDING to handle $cask prompt...."
        sleep 30
        echo "30 seconds to act on prompt for $cask..."
        sleep 30
        echo "Trying `brew cask install $cask` again..."
        brew cask install $cask
    fi
done

printf "\n\nDone installing casks.\n\n\n"
sleep 2

#--------------------------------------------------------------------------------
# CLEANUP
echo "Cleaning up"
printf "================================================================================\n\n"

echo "Turn OFF sending brew analytics"
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

apps=""
for app in $apps
do
    printf "\nInstalling $app\n"
    mas install $app
done

printf "\n\nDone installing Mac App Store apps.\n\n\n"
sleep 2


echo "Now go login to accounts (Dropbox, emails, etc...) and then run secondary installs, `sh secondary.sh`."
echo ""
echo ""
echo "================================================================================"
echo "Setup has FINISHED"
echo "================================================================================"
echo ""

#!/usr/bin/env bash

printf "\nINFO: This script will automate a lot of processes.\n"
echo "Press ctrl-c to stop now. "
sleep 5
echo "Though not recommended to interrupt, exit this script at any time with ctrl-c."
sleep 5
echo "Starting automation...."


#-------------------------------------------------------------------------------
# System Setup
printf "\n\nInstalling Homebrew\n"
printf "================================================================================\n\n"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null
printf "\n\nDone installing Homebrew.\n\n\n"
sleep 2

echo "Installing Xcode developer tools"
printf "================================================================================\n\n"
xcode-select --install
printf "\n\nDone installing Xcode developer tools.\n\n\n"
sleep 2

#-------------------------------------------------------------------------------
# Install All Desired Formulae
echo "Installing formulas"
printf "================================================================================\n\n"

formulae="asciinema bcftools blast bowtie2 dos2unix gcc git-lfs glances htop hugo imagemagick mas mongodb mysql neofetch openssl rename ssh-copy-id pandoc pandoc-citeproc pkg-config python3 r rbenv readline rename ruby samtools seqtk speedtest-cli sratoolkit tree vcftools xz"

for formula in $formulae
do
    brew install $formula
done

printf "\n\nDone installing formulas.\n\n\n"
sleep 2

#-------------------------------------------------------------------------------
# Install All Desired Casks (3rd Party Apps)
echo "Installing casks"
printf "================================================================================\n\n"

casks="atom alfred dropbox rstudio flux brackets mactext java gitify google-backup-and-sync google-chrome google-drive-file-stream igv spotify virtualbox xquartz"

for cask in $casks
do
    brew cask install $cask
done

printf "\n\nDone installing casks.\n\n\n"
sleep 2

#-------------------------------------------------------------------------------
# Personalized Setup
# echo "Symlinking Atom config directory"
# ln -sf ~/Dropbox/Apps/Atom/ ~/.atom

#-------------------------------------------------------------------------------
# Updates
echo "Running updates"
printf "================================================================================\n\n"
echo "Updating Atom"
apm upgrade -c false

printf "\n\nDone running updates.\n\n\n"
sleep 2

#-------------------------------------------------------------------------------
# Cleanup
echo "Cleaning up"
printf "================================================================================\n\n"
echo "Cleaning up Homebrew downloads and caches"
brew cleanup -s # remove older versions in cellar + old downloads-cache
rm -rf $(brew --cache) # delete all

printf "\n\nDone cleaning up.\n\n\n"
sleep 2

#-------------------------------------------------------------------------------
# Install Mac Apps
echo "Installing apps from Mac App Store"
printf "================================================================================\n\n"
apps=""
# 414528154 ScreenFloat
# 530461386 Yummy FTP Watcher
# 1044630224 Calendar 366 Plus
# 915542151 Monity
# 492068728 Yummy FTP
# 409183694 Keynote
# 465965038 Markdown Pro
# 456609775 Window Tidy
# 1278508951 Trello
# 524373870 Due
# 418073146 Snap
# 695406827 Dropzone 3
# 409789998 Twitter
# 937984704 Amphetamine
# 443987910 1Password
# 1035237815 Commander One PRO
# 409203825 Numbers
# 412448059 ForkLift
# 409201541 Pages
# 1130254674 CloudMounter
# 919797974 PullRequestMenu
# 803453959 Slack
# 457622435 Yoink
# 445189367 PopClip
# 928494006 PopHub
# 507257563 Sip

for app in $apps
do
    echo "Installing $app\n"
    mas install $app
done

printf "\n\nDone installing Mac App Store apps.\n\n\n"
sleep 2

# progress bar
# chars="/-\|"
#
# while :; do
#   for (( i=0; i<${#chars}; i++ )); do
#     sleep 0.5
#     echo -en "${chars:$i:1}" "\r"
#   done
# done

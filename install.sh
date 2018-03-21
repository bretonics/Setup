#!/usr/bin/env bash

#-------------------------------------------------------------------------------
# System Setup
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" # Install Homebrew
xcode-select --install # Install Xcode dev tools
sleep 2

#-------------------------------------------------------------------------------
# Install All Desired Formulae
echo "Installing formulas..."

fomulae="asciinema mas python3 ruby git-lfs tree rename glances hugo imagemagick openssl ssh-copy-id sratoolkit pandoc pandoc-citeproc r seqtk speedtest-cli xz"

for formula in $formulae
do
    brew install $formula
done

echo "Done installing formulas."
sleep 2

#-------------------------------------------------------------------------------
# Install All Desired Casks (3rd Party Apps)
echo "Installing casks..."

casks="dropbox atom alfred rstudio flux brackets mactext java gitify google-chrome google-drive-file-stream igv spotify virtualbox xquartz"

for cask in $casks
do
    brew install $cask
done

echo "Done installing casks."
sleep 2

#-------------------------------------------------------------------------------
# Updates
echo "Updating Atom..."
apm upgrade -c false


echo "Done with updates."
sleep 2
#-------------------------------------------------------------------------------
# Cleanup
echo "Cleaning up Homebrew downloads and caches..."
brew cleanup -s
rm -rf $(brew --cache)

# Symlink Atom config directory
# ln -sf ~/Dropbox/Apps/Atom/ ~/.atom

echo "Done cleanup."
sleep 2

#-------------------------------------------------------------------------------
# Install Mac Apps
echo "Installing apps from Mac App Store..."
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

echo "Done installing Mac App Store apps..."
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

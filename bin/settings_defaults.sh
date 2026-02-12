#!/usr/bin/env bash

PARENT_PATH=$(cd -- "$(dirname $(dirname -- "${BASH_SOURCE[0]}"))" &>/dev/null && pwd)
source ${PARENT_PATH}/lib/functions

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# SETTINGS
ask "Adjust Keyboard settings"
if [ "$RESPONSE" = true ]; then
    echo "Setting a blazingly fast keyboard repeat rate"
    defaults write -g KeyRepeat -int 2 # normal minimum is 2 (30 ms)
    defaults write -g InitialKeyRepeat -int 15 # normal minimum is 15 (225 ms)
fi

ask "Make scroll direction non-natural"
if [ "$RESPONSE" = true ]; then
    defaults write -g com.apple.swipescrolldirection -bool false
fi

ask "Mouse Right-Click"
if [ "$RESPONSE" = true ]; then
    defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode TwoButton
fi

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# DOCK
ask "Activate Dock Auto Hide"
if [ "$RESPONSE" = true ]; then
    defaults write com.apple.dock autohide -float 1
fi

ask "Reduce Dock Auto Hide Animation"
if [ "$RESPONSE" = true ]; then
    defaults write com.apple.dock autohide-time-modifier -float 0.25
fi

ask "Remove Dock Delay for Auto Hide & Auto-Show"
if [ "$RESPONSE" = true ]; then
    defaults write com.apple.dock autohide-delay -float 0
fi

ask "Change minimize/maximize window effect"
if [ "$RESPONSE" = true ]; then
    defaults write com.apple.dock mineffect -string "scale"
fi

ask "Don’t automatically rearrange Spaces based on most recent use"
if [ "$RESPONSE" = true ]; then
    defaults write com.apple.dock mru-spaces -bool false
fi

ask "Set the icon size of Dock items to 63 pixels (Ideal for Macbook)"
if [ "$RESPONSE" = true ]; then
    defaults write com.apple.dock tilesize -int 63 # 77 for non-laptop
fi

ask "Set the icon size of Dock items to 77 pixels (Ideal for External Monitor)"
if [ "$RESPONSE" = true ]; then
    defaults write com.apple.dock tilesize -int 77
fi

killall Dock

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# FINDER
ask "Show Path bar"
if [ "$RESPONSE" = true ]; then
    defaults write com.apple.finder ShowPathbar -bool true
fi

ask "Show the ~/Library folder"
if [ "$RESPONSE" = true ]; then
    chflags nohidden ~/Library
fi

ask "Show the /Volumes folder"
if [ "$RESPONSE" = true ]; then
    sudo chflags nohidden /Volumes
fi

ask "When performing a search, search the current folder by default"
if [ "$RESPONSE" = true ]; then
    defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
fi

ask "Use list view in all Finder windows"
if [ "$RESPONSE" = true ]; then
    # Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
    defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
fi

ask "Expand the following File Info panes: General, Open with, and Sharing & Permissions"
if [ "$RESPONSE" = true ]; then
    defaults write com.apple.finder FXInfoPanesExpanded -dict \
        General -bool true \
        OpenWith -bool true \
        Privileges -bool true
fi

killall Finder

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# OTHER
ask "Create iCloud shortcut"
if [ "$RESPONSE" = true ]; then
    ln -s "${ICLOUD_HOME_PATH}" ~/iCloud
fi

ask "Create Dropbox shortcut"
if [ "$RESPONSE" = true ]; then
    ln -s "${DROPBOX_BASE_PATH}" ~/Dropbox
fi

if [ ${OS_MAJOR_VERSION} -lt 15 ]; then
    ask "Disable local Time Machine backups"
    if [ "$RESPONSE" = true ]; then
        hash tmutil &> /dev/null && sudo tmutil disablelocal
    fi
fi

ask "Disable auto-correct"
if [ "$RESPONSE" = true ]; then
    defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
fi

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# TEXTEDIT
ask "Use plain text mode for new TextEdit documents"
if [ "$RESPONSE" = true ]; then
    defaults write com.apple.TextEdit RichText -int 0
fi

ask "Open and save files as UTF-8 in TextEdit"
if [ "$RESPONSE" = true ]; then
    defaults write com.apple.TextEdit PlainTextEncoding -int 4
    defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
fi

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# ENERGY SAVING
sudo pmset -a displaysleep 15

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# SETTINGS
ask "Adjust Keyboard settings"
if [ "$RESPONSE" = true ]; then
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

ask "Set the icon size of Dock items to 63 pixels"
defaults write com.apple.dock tilesize -int 63

killall Dock

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# FINDER
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

ask "Use list view in all Finder windows "
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

ask "Expand the following File Info panes: General, Open with, and Sharing & Permissions"
defaults write com.apple.finder FXInfoPanesExpanded -dict \
    General -bool true \
    OpenWith -bool true \
    Privileges -bool true

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# OTHER
ask "Create iCloud shortcut"
if [ "$RESPONSE" = true ]; then
    ln -s "${ICLOUD_HOME_PATH}" ~/iCloud
fi

ask "Disable local Time Machine backups"
if [ "$RESPONSE" = true ]; then
    hash tmutil &> /dev/null && sudo tmutil disablelocal
fi

ask "Disable auto-correct"
if [ "$RESPONSE" = true ]; then
    defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
fi

ask "Set a fast keyboard repeat rate"
if [ "$RESPONSE" = true ]; then
    defaults write NSGlobalDomain KeyRepeat -int 2
fi

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# TEXTEDIT
ask "Use plain text mode for new TextEdit documents"
defaults write com.apple.TextEdit RichText -int 0

ask "Open and save files as UTF-8 in TextEdit"
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# ENERGY SAVING
sudo pmset -a displaysleep 15

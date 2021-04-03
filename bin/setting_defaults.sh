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

killall Dock

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# FINDER
ask "When performing a search, search the current folder by default"
if [ "$RESPONSE" = true ]; then
    defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
fi

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# OTHER
ask "Disable auto-correct"
if [ "$RESPONSE" = true ]; then
    defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
fi

ask "Set a blazingly fast keyboard repeat rate"
if [ "$RESPONSE" = true ]; then
    defaults write NSGlobalDomain KeyRepeat -float 0.000000000001
fi

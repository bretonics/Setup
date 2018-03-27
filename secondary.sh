#!/usr/bin/env bash

echo "================================================================================"
echo "Script: $0"
echo "Run by: `whoami`"
echo "On: `date`"
echo "PID: $$"
echo "================================================================================"
echo ""
echo ""
echo ""


#--------------------------------------------------------------------------------
# PERSONALIZE SETUP
echo "Running personalizations"
printf "================================================================================\n\n"

cd ~
printf "\nCurrently at `pwd`\n"

printf "\nDownloading .bash_profile\n"
curl -O https://gist.githubusercontent.com/bretonics/5176d35739a0f4e7acfd/raw/f0b885a6a9e6058a0946bb36b52fd8f8ee4fb12c/.bash_profile

printf "\nDownloading .bashrc\n"
curl -O https://gist.githubusercontent.com/bretonics/f3b61fcd1fa946df6dac/raw/3698046d8e2c36f5856daf9a08f9e88aa00d16aa/.bashrc
printf "\nDownloading .bash_functions\n"
curl -O https://gist.githubusercontent.com/bretonics/894d8c2d1d4813c36b7d36e9a97aedd6/raw/110f0816c89d778d021dc4d50dc331a03773bf02/.bash_functions

printf "\nDownloading crontab\n"
curl -O https://gist.githubusercontent.com/bretonics/9a48a3b9ef32d93d15f45c3f007550b4/raw/c2bf72ac7007dd90bc54106a0138eb0026297664/crontab

printf "\nSourcing .bash_profile\n"
source ~/.bash_profile

printf "\nInitiating crontab\n"
crontab ./crontab

printf "\nSymlinking Atom config directory\n"
rm -rf ~/.atom
ln -sf ~/Dropbox/Apps/Atom ~/.atom

printf "\n\nDone running personalizations.\n\n\n"
sleep 2

#--------------------------------------------------------------------------------
# UPDATES
echo "Running updates"
printf "================================================================================\n\n"

echo "Updating macOS"
softwareupdate -ia --verbose

echo "Updating Atom"
apm upgrade -c false

printf "\n\nDone running updates.\n\n\n"
sleep 2


echo "================================================================================"
echo "Setup has FINISHED"
echo "================================================================================"
echo ""
#===============================================================================================
# USER BASH FUNCTIONS
#===============================================================================================
# FILE:           .bash_functions
# USAGE:          source .bash_functions
#===============================================================================================
# CAPITAN:        Andrés Bretón ~ https://www.andresbreton.com
# REPO:           https://github.com/bretonics/Setup
# LICENSE:        MIT
#===============================================================================================

#===============================================================================================
# SYSTEM
#===============================================================================================
drpx-ignore() {
    xattr -w com.dropbox.ignored 1 $@
}

get-git-branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

mkcd() { 
    mkdir $1; cd $1 
}
#===============================================================================================
# ENVIRONMENT
#===============================================================================================

#-----------------------------------------------------------------------------------------------
# STARSHIP PROMPT
#-----------------------------------------------------------------------------------------------
# Explicit default to the regular format on startup
export STARSHIP_CONFIG="$HOME/.config/starship.toml"

# Functions to switch formats instantly
function prompt-default() {
    export STARSHIP_CONFIG="$HOME/.config/starship.toml"
}

function prompt-select() {
    export STARSHIP_CONFIG="$HOME/.config/starship-${1}.toml"
}

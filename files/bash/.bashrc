# ===============================================================================================
# BOURNE AGAIN SHELL (BASH) CONFIGURATION - Interactive, non-login shells
# ===============================================================================================
# FILE:           .bashrc
# USAGE:          source .bashrc
# ===============================================================================================
# CAPITAN:        Andrés Bretón ~ dev@andresbreton.com
# REPO:           https://github.com/bretonics/Setup
# LICENSE:        MIT
# ===============================================================================================

#-----------------------------------------------------------------------------------------------
# DEFINITIONS
#-----------------------------------------------------------------------------------------------
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

if [ -f ~/.alias ]; then
    source ~/.alias
fi

#-----------------------------------------------------------------------------------------------
# FUNCTIONS
#-----------------------------------------------------------------------------------------------
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

#-----------------------------------------------------------------------------------------------
# COMPLETIONS
#-----------------------------------------------------------------------------------------------
case "${OSTYPE}" in
    Darwin*|darwin*)
        # All Bash Completions
        [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

        # Uncomment if Bash completions not installed
        # for file in /usr/local/etc/bash_completion.d/*; do source $file; done
        # source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
        ;;
    Linux*|linux*)
        ;;
esac

#-----------------------------------------------------------------------------------------------
# PROMPT
#-----------------------------------------------------------------------------------------------
eval "$(starship init bash)"

#-----------------------------------------------------------------------------------------------
# HISTORY
#-----------------------------------------------------------------------------------------------
HISTSIZE=99999999
HISTFILESIZE=99999999
# HISTCONTROL=ignorespace             # ignore spaced-refix commands => do not store in history
# HISTCONTROL=ignoredups              # ignore successive duplicate entries
HISTCONTROL=ignoreboth              # both ignorespace and ignoredups
HISTTIMEFORMAT="[%m/%d/%y %T] "     # timestamp format

#===============================================================================================
# ADDONS
#===============================================================================================

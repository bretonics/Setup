# ===============================================================================================
# BOURNE AGAIN SHELL (BASH) CONFIGURATION - Login shells
# ===============================================================================================
# FILE:           .bash_profile
# USAGE:          source .bash_profile
# ===============================================================================================
# CAPITAN:        Andrés Bretón ~ dev@andresbreton.com
# REPO:           https://github.com/bretonics/Setup
# LICENSE:        MIT
# ===============================================================================================

#-----------------------------------------------------------------------------------------------
# SOURCE
#-----------------------------------------------------------------------------------------------
# Get Aliases and Functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Prompt Color Variables
if [ -f ~/.shell_colors ]; then
    . ~/.shell_colors
fi
#-----------------------------------------------------------------------------------------------
# VARIABLES
#-----------------------------------------------------------------------------------------------
export GITHUB_OAUTH_TOKEN=""

#-----------------------------------------------------------------------------------------------
# PROMPT
#-----------------------------------------------------------------------------------------------
# PS1="\u [\W] \$"   # Compact

# OS Dependent
case "${OSTYPE}" in
    Darwin*|darwin*)
        PS1="\[$BLUE\]\u\[$NC\]\[$RED\] [\[$NC\]\W\[$RED\]]\[$YELLOW\]\$(get-git-branch)\[$NC\] $ "
        ;;
    Linux*|linux*)
        PS1="\[$BLUE\]\u\[$NC\]@\[$GREEN\]\h\[$NC\]\[$RED\] [\[$NC\]\W\[$RED\]]\[$YELLOW\]\$(get-git-branch)\[$NC\] $ "
        ;;
esac

#-----------------------------------------------------------------------------------------------
# EXPORTS
#-----------------------------------------------------------------------------------------------
export GPG_TTY=$(tty)
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND" # Add commands to history immediately (terminal resolution)
export GIT_PS1_SHOWDIRTYSTATE=1                     # Git prompt status
export MANPAGER="vim -M +MANPAGER -"                # Vim man pager syntax highlighting

# OS Dependent
case "${OSTYPE}" in
    Darwin*|darwin*)
        # export  PATH=$PATH:
        export LSCOLORS="cxgxcxdxbxegedabagacab"
        export HOMEBREW_NO_ANALYTICS=1
        ;;
    Linux*|linux*)
        export PATH=$PATH:$HOME/bin:$HOME/.local/bin:
        export LS_COLORS=""
        ;;
esac

#===============================================================================================
# ADDONS
#===============================================================================================

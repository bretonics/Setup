# .bash_profile - login shells

# Template from https://gist.github.com/bretonics/5176d35739a0f4e7acfd

#-----------------------------------------------------------------------------------------------
# SOURCE

# Get Aliases and Functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# Prompt Color Variables
if [ -f ~/.shell_colors ]; then
    . ~/.shell_colors
fi

#-----------------------------------------------------------------------------------------------
# GENERAL

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# VARIABLES
export GITHUB_OAUTH_TOKEN=""

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# PROMPT
# PS1="\u [\W] \$"   # Compact

# OS Dependent
case "${OSTYPE}" in
    darwin*)
        PS1="\[$BLUE\]\u\[$NC\]\[$RED\] [\[$NC\]\W\[$RED\]]\[$YELLOW\]\$(get-git-branch)\[$NC\] $ "
        ;;
    linux*)
        PS1="\[$BLUE\]\u\[$NC\]@\[$GREEN\]\h\[$NC\]\[$RED\] [\[$NC\]\W\[$RED\]]\[$YELLOW\]\$(get-git-branch)\[$NC\] $ "
        ;;
esac

eval "$(starship init bash)" # Starship Prompt

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# EXPORTS
export GPG_TTY=$(tty)
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND" # Add commands to history immediately (terminal resolution)
export GIT_PS1_SHOWDIRTYSTATE=1                     # Git prompt status
export MANPAGER="vim -M +MANPAGER -"                # Vim man pager syntax highlighting

# OS Dependent
case "${OSTYPE}" in
darwin*)
    # export  PATH=$PATH:
    export LSCOLORS="cxgxcxdxbxegedabagacab"
    export HOMEBREW_NO_ANALYTICS=1
    ;;
linux*)
    export PATH=$PATH:$HOME/bin:$HOME/.local/bin:
    export LS_COLORS=""
    ;;
esac

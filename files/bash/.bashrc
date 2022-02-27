# .bashrc - interactive, non-login shells

# Template from https://gist.github.com/bretonics/f3b61fcd1fa946df6dac

#-----------------------------------------------------------------------------------------------
# GLOBAL SOURCE

# Global Definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Functions
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

case "${OSTYPE}" in
    darwin*)
        # All Bash Completions
        [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

        # Uncomment if Bash completions not installed
        # for file in /usr/local/etc/bash_completion.d/*; do source $file; done
        # source /Library/Developer/CommandLineTools/usr/share/git-core/git-prompt.sh
        ;;
    linux*)
        ;;
esac

#-----------------------------------------------------------------------------------------------
# USER SPECIFIC

# Starship Prompt
eval "$(starship init bash)"

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# HISTORY
HISTSIZE=99999999
HISTFILESIZE=99999999
# HISTCONTROL=ignorespace          # ignore spaced-refix commands => do not store in history
# HISTCONTROL=ignoredups           # ignore successive duplicate entries
HISTCONTROL=ignoreboth           # both ignorespace and ignoredups
HISTTIMEFORMAT="[%m/%d/%y %T] "  # timestamp format

#- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# ALIASES
case "${OSTYPE}" in
    darwin*)
        alias  ls="ls -GFh"
        alias  ll="ls -laGFh"
        ;;
    linux*)
        alias  ls="ls -GFh --color=yes"
        alias  ll="ls -GFhla --color=yes"
        ;;
esac

alias  cp="cp -i"
alias  rm="rm -i"
alias  mv="mv -i"
alias  vi="vim"

# Beautify $PATH
alias path='echo $PATH | tr -s ":" "\n"'

# Git
alias  gs="git status"
alias  gc="git commit"

# Remote Access
alias  mini=""
alias  server=""
alias  macbook=""
alias  bretonics=""
alias  node0=""
alias  node1=""
alias  node2=""
alias  node3=""

#-------------------------------------------------------------------------------
# GLOBAL

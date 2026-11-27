#===============================================================================================
# Z SHELL (ZSH) CONFIGURATION - interactive, non-login shells
#===============================================================================================
# FILE:           .zshrc
# USAGE:          source .zshrc
#===============================================================================================
# CAPITAN:        Andrés Bretón ~ dev@andresbreton.com
# REPO:           https://github.com/bretonics/
# LICENSE:        MIT
#===============================================================================================

#===============================================================================================
# ENVIRONMENT
#===============================================================================================
case "${OSTYPE}" in
    Darwin*|darwin*)
        eval "$(ssh-agent -s)"
        ssh-add ~/.ssh/github_rsa
        ;;
    Linux*|linux*)
        
        ;;
esac

export GPG_TTY=$(tty)
export VOLTA_HOME="$HOME/.volta"

if [ -f ~/.alias ]; then
    source ~/.alias
fi

#-----------------------------------------------------------------------------------------------
# VARIABLES
#-----------------------------------------------------------------------------------------------
case "${OSTYPE}" in
    Darwin*|darwin*)
        FPATH=$(brew --prefix)/share/zsh-completions:$HOME/.docker/completions:$FPATH
        PATH="/usr/local/sbin:/opt/homebrew/opt/gnu-sed/libexec/gnubin:$VOLTA_HOME/bin:$PATH"
        ;;
    Linux*|linux*)
        FPATH=/workspace/.moon/cli:$FPATH
        ;;
esac

HISTSIZE=10000000
SAVEHIST=10000000
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS

#===============================================================================================
# ENHANCEMENTS
#===============================================================================================
case "${OSTYPE}" in
    Darwin*|darwin*)
        source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
        source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        eval "$(jump shell)"
        ;;
    Linux*|linux*)
        source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
        ;;
esac

# Oh My Zsh Installation
if [ -d "${HOME}/.oh-my-zsh" ]; then
    source "${HOME}/.omzsh"
    source ~/.oh-my-zsh/lib/completion.zsh
    unset LESS
fi

#-----------------------------------------------------------------------------------------------
# PROMPT
#-----------------------------------------------------------------------------------------------
eval "$(starship init zsh)"

# Completions
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
compdef _moon_dynamic_targets moon

#===============================================================================================
# AUTONOMOUS ADDONS
#===============================================================================================

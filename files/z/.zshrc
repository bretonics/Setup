#===============================================================================================
# ZSH

# Oh My Zsh Installation
if [ -d "${HOME}/.oh-my-zsh" ]; then
    source "${HOME}/.omzsh"
    source ~/.oh-my-zsh/lib/completion.zsh
    unset LESS
fi

# History
# https://unix.stackexchange.com/a/670027/37094
HISTSIZE=10000000
SAVEHIST=10000000
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS

# Completions
FPATH=$(brew --prefix)/share/zsh-completions:$HOME/.docker/completions:$FPATH
autoload -Uz compinit && compinit

# Aliases
source ~/.alias

# Auto Shell Enhancements: suggestions, highlighting
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#===============================================================================================
# PROMPT
autoload -Uz promptinit && promptinit

# Starship
eval "$(starship init zsh)"

#===============================================================================================
# ENVIRONMENT
PATH="/usr/local/sbin:$PATH"
export GPG_TTY=$(tty)
eval "$(jump shell)"

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

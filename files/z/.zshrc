#===============================================================================================
# ZSH

# Oh My Zsh Installation
if [ -d "${HOME}/.oh-my-zsh" ]; then
    source "${HOME}/.omzsh"
    unset LESS
fi

# Completions
autoload -Uz compinit && compinit

# Aliases
source ~/.alias

# Auto Shell Enhancements: suggestions, highlighting
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#===============================================================================================
# PROMPT
autoload -U promptinit && promptinit

# Starship
eval "$(starship init zsh)"

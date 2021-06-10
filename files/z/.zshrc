# Zsh Completions
autoload -Uz compinit && compinit

# Starship
if [ $TERM_PROGRAM != 'vscode' ]; then eval "$(starship init zsh)"; fi

# Oh My Zsh Installation
if [ -d "/Users/${USER}/.oh-my-zsh" ]; then
    source "/Users/${USER}/.omzsh"
fi
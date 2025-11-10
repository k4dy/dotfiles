# -----------------------------------------
# Modern Zsh setup for Ghostty
# -----------------------------------------

# Path to Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Load Oh My Zsh core
source $ZSH/oh-my-zsh.sh

# Plugins (oh-my-zsh)
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search dirhistory macos)

# -----------------------------------------
# PROMPT: Starship (Tokyo Night theme)
# -----------------------------------------
eval "$(starship init zsh)"

# -----------------------------------------
# AUTOCOMPLETE + COMPLETION
# -----------------------------------------
# Clean previous completion cache if corrupted
if [[ ! -f ~/.zcompdump || ~/.zcompdump -nt ~/.zshrc ]]; then
  autoload -Uz compinit && compinit
else
  autoload -Uz compinit && compinit -C
fi

# -----------------------------------------
# AUTOSUGGESTIONS + SYNTAX HIGHLIGHTING
# -----------------------------------------
# Ensure plugins are loaded after compinit
if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# -----------------------------------------
# FUZZY FINDER (FZF) for history and files
# -----------------------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Ctrl + R → fuzzy history search
bindkey '^R' fzf-history-widget

# Tab → file/folder completion
bindkey '^I' expand-or-complete

# -----------------------------------------
# SMART FOLDER SWITCHING (zoxide)
# -----------------------------------------
eval "$(zoxide init zsh)"

# Jump faster between dirs: `z <folder>`
alias cd='z'

# -----------------------------------------
# PATH SETTINGS
# -----------------------------------------
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"

# -----------------------------------------
# CLEANUP: disable Powerlevel10k (we use Starship)
# -----------------------------------------
# Comment out any Powerlevel10k lines if they exist
# source ~/powerlevel10k/powerlevel10k.zsh-theme
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# -----------------------------------------
# END OF FILE
# -----------------------------------------


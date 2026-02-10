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
if [[ ! -f ~/.zcompdump || ~/.zcompdump -nt ${ZDOTDIR:-$HOME}/.zshrc ]]; then
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
[ -f ~/.config/zsh/.fzf.zsh ] && source ~/.config/zsh/.fzf.zsh

# Ctrl + R → fuzzy history search
bindkey '^R' fzf-history-widget

# Tab → file/folder completion
bindkey '^I' expand-or-complete

# -----------------------------------------
# VIM MODE (like Neovim!)
# -----------------------------------------
# Enable vi mode in terminal
bindkey -v

# ESC → normal mode (just like Neovim)
# In insert mode by default, ESC takes you to normal mode

# Change cursor shape based on vi mode (visual feedback)
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'  # Block cursor for normal mode
  elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'  # Beam cursor for insert mode
  fi
}
zle -N zle-keymap-select

# Start with beam cursor (insert mode)
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q' ;}

# Reduce delay when switching modes (fast like Neovim)
export KEYTIMEOUT=1

# Keep important shortcuts in insert mode
bindkey -M viins '^R' fzf-history-widget  # Ctrl+R for history
bindkey -M viins '^A' beginning-of-line   # Ctrl+A to go to start
bindkey -M viins '^E' end-of-line         # Ctrl+E to go to end
bindkey -M viins '^K' kill-line           # Ctrl+K to delete to end

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
# Java 21 for OCP certification study
# -----------------------------------------
export JAVA_HOME=$(/usr/libexec/java_home -v 21)
export PATH="$JAVA_HOME/bin:$PATH"

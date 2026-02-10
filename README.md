# Dotfiles

My terminal setup for macOS. Optimized for development with Neovim, Tmux, and Zsh.

## What's Inside

| Tool | Config | Description |
|---|---|---|
| **Ghostty** | `.config/ghostty/config` | Terminal emulator (Catppuccin Mocha theme) |
| **Zsh** | `.config/zsh/.zshrc` | Shell with Oh My Zsh, vi mode, cursor shape switching |
| **Starship** | `.config/starship.toml` | Prompt (Tokyo Night Powerline theme) |
| **Tmux** | `.config/tmux/tmux.conf` | Multiplexer (prefix `Ctrl+A`, vim nav, which-key, session restore) |
| **Neovim** | `.config/nvim/` | LazyVim + Catppuccin, Harpoon, Telescope, Java/Spring Boot |
| **Git** | `.config/git/config` | Global git config |
| **GitHub CLI** | `.config/gh/config.yml` | `gh` aliases and settings |
| **IdeaVim** | `.ideavimrc` | IntelliJ vim bindings with which-key |

## Structure

```
~/dotfiles/
├── .zshenv                      # Points Zsh to ~/.config/zsh/
├── .ideavimrc                   # IntelliJ IdeaVim (must live in $HOME)
└── .config/
    ├── zsh/
    │   ├── .zshrc               # Main shell config
    │   ├── .zprofile            # Homebrew & Python PATH
    │   └── .fzf.zsh            # FZF initialization
    ├── tmux/
    │   └── tmux.conf            # Tmux config (plugins auto-installed by TPM)
    ├── nvim/
    │   ├── init.lua             # LazyVim bootstrap
    │   ├── lazy-lock.json       # Plugin version lock
    │   └── lua/
    │       ├── config/          # keymaps, lazy, autocmds, options
    │       └── plugins/         # 10 plugin configs
    ├── git/
    │   ├── config               # user, email, credential helper
    │   └── ignore               # Global gitignore
    ├── starship.toml            # Prompt theme
    ├── ghostty/
    │   └── config               # Terminal theme
    └── gh/
        └── config.yml           # GitHub CLI
```

---

## Fresh Machine Setup

Run these commands in order on a clean macOS install.

### 1. Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### 2. Install Ghostty

Download and install from [ghostty.org](https://ghostty.org).

### 3. Install tools via Homebrew

```bash
brew install git neovim tmux starship fzf zoxide ripgrep gh node
brew install zsh-autosuggestions zsh-syntax-highlighting
```

### 4. Install Java 21 (for development)

```bash
brew install openjdk@21
sudo ln -sfn $(brew --prefix openjdk@21)/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-21.jdk
```

### 5. Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install custom plugins into Oh My Zsh:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### 6. Clone dotfiles

```bash
git clone https://github.com/k4dy/dotfiles.git ~/dotfiles
```

### 7. Create symlinks

```bash
# Home directory
ln -sf ~/dotfiles/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc

# Zsh
mkdir -p ~/.config/zsh
ln -sf ~/dotfiles/.config/zsh/.zshrc ~/.config/zsh/.zshrc
ln -sf ~/dotfiles/.config/zsh/.zprofile ~/.config/zsh/.zprofile
ln -sf ~/dotfiles/.config/zsh/.fzf.zsh ~/.config/zsh/.fzf.zsh

# Tmux
mkdir -p ~/.config/tmux
ln -sf ~/dotfiles/.config/tmux/tmux.conf ~/.config/tmux/tmux.conf

# Neovim
ln -sf ~/dotfiles/.config/nvim ~/.config/nvim

# Git
mkdir -p ~/.config/git
ln -sf ~/dotfiles/.config/git/config ~/.config/git/config
ln -sf ~/dotfiles/.config/git/ignore ~/.config/git/ignore

# Starship
ln -sf ~/dotfiles/.config/starship.toml ~/.config/starship.toml

# Ghostty
mkdir -p ~/.config/ghostty
ln -sf ~/dotfiles/.config/ghostty/config ~/.config/ghostty/config

# GitHub CLI
mkdir -p ~/.config/gh
ln -sf ~/dotfiles/.config/gh/config.yml ~/.config/gh/config.yml
```

### 8. Install Tmux Plugin Manager (TPM)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

Then open tmux and press `Ctrl+A` then `I` (capital i) to install all plugins.

### 9. Open Neovim

```bash
nvim
```

Lazy.nvim will auto-install all plugins on first launch. Wait for it to finish, then restart nvim.

### 10. Restart your shell

```bash
exec zsh
```

---

## Keybindings Cheat Sheet

### Tmux (prefix: `Ctrl+A`)

| Key | Action |
|---|---|
| `\|` | Split horizontal |
| `-` | Split vertical |
| `h/j/k/l` | Resize panes |
| `m` | Zoom pane |
| `r` | Reload config |
| `Space` | Which-key (show all bindings) |

### Neovim (leader: `Space`)

| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Find buffers |
| `<leader>gd` | Go to definition |
| `<leader>gi` | Go to implementation |
| `<leader>gr` | Go to references |
| `<leader>gg` | Git submenu |
| `<leader>ha` | Harpoon add file |
| `<leader>hm` | Harpoon menu |
| `<leader>rj` | Run Java file |

### Zsh

| Key | Action |
|---|---|
| `Ctrl+R` | Fuzzy history search (FZF) |
| `ESC` | Normal mode (vi mode) |
| `z <folder>` | Jump to directory (zoxide) |

# Dotfiles

My macOS terminal development environment. One repo to set up a new machine from scratch.

## Summary

This repo contains all the configuration files for my terminal workflow. The setup is built around **Neovim** as the editor, **Tmux** as the multiplexer, and **Zsh** as the shell — all running inside **Ghostty** terminal with a consistent **Catppuccin/Tokyo Night** color scheme.

All configs follow the XDG standard and live under `~/.config/`. The dotfiles repo is symlinked to the actual config locations so changes are tracked by git automatically.

### What gets installed

- 👻 **Ghostty** — GPU-accelerated terminal emulator
- 🐚 **Zsh + Oh My Zsh** — Shell with autosuggestions, syntax highlighting, and vi mode
- 🚀 **Starship** — Fast prompt with Tokyo Night Powerline theme
- 🔍 **FZF** — Fuzzy finder for files and command history
- 📂 **Zoxide** — Smart directory jumping (replaces `cd`)
- 🪟 **Tmux** — Terminal multiplexer with vim navigation, session restore, and which-key
- ✏️ **Neovim (LazyVim)** — Editor with Telescope, Harpoon, Gitsigns, Java/Spring Boot support
- ⚡ **Ripgrep** — Fast search (used by Telescope)
- 🌐 **Git + GitHub CLI** — Version control
- ☕ **Java 21 (OpenJDK)** — JDK for development
- 📦 **Node.js** — Required by some Neovim plugins

### Repo structure

```
~/dotfiles/
├── .zshenv                      # Points Zsh to ~/.config/zsh/
├── .ideavimrc                   # IntelliJ IdeaVim (must live in $HOME)
├── README.md
└── .config/
    ├── zsh/
    │   ├── .zshrc               # Main shell config
    │   ├── .zprofile            # Homebrew & Python PATH
    │   └── .fzf.zsh            # FZF initialization
    ├── tmux/
    │   └── tmux.conf            # Tmux config
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
    │   └── config               # Terminal theme (Catppuccin Mocha)
    └── gh/
        └── config.yml           # GitHub CLI
```

---

## Installation Guide

Run these steps **in order** on a fresh macOS install.

### 1. Install Homebrew

> ⚠️ Run these **one at a time** — wait for Homebrew to finish installing before running the second command.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

```bash
eval "$(/opt/homebrew/bin/brew shellenv)"
```

### 2. Install Ghostty

> 📋 Single command — paste and run.

```bash
brew install --cask ghostty
```

Open Ghostty and use it for the remaining steps.

### 3. Install tools via Homebrew

> 📋 Paste the whole block — both lines will run together.

```bash
brew install git neovim tmux starship fzf zoxide ripgrep gh node
brew install zsh-autosuggestions zsh-syntax-highlighting
```

### 4. Install Java 21

> ⚠️ Run these **one at a time** — the second command requires `sudo` (you'll be prompted for your password).

```bash
brew install openjdk@21
```

```bash
sudo ln -sfn $(brew --prefix openjdk@21)/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-21.jdk
```

### 5. Install Oh My Zsh

> ⚠️ Run these **one at a time** — Oh My Zsh install is interactive and will prompt you. After it finishes, run the two git clone commands.

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### 6. Clone this repo

> 📋 Single command — paste and run.

```bash
git clone https://github.com/k4dy/dotfiles.git ~/dotfiles
```

### 7. Create symlinks

> 📋 **Copy and paste this entire block at once** — all symlinks will be created in one go.

```bash
ln -sf ~/dotfiles/.zshenv ~/.zshenv
ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc
mkdir -p ~/.config/zsh
ln -sf ~/dotfiles/.config/zsh/.zshrc ~/.config/zsh/.zshrc
ln -sf ~/dotfiles/.config/zsh/.zprofile ~/.config/zsh/.zprofile
ln -sf ~/dotfiles/.config/zsh/.fzf.zsh ~/.config/zsh/.fzf.zsh
mkdir -p ~/.config/tmux
ln -sf ~/dotfiles/.config/tmux/tmux.conf ~/.config/tmux/tmux.conf
ln -sf ~/dotfiles/.config/nvim ~/.config/nvim
mkdir -p ~/.config/git
ln -sf ~/dotfiles/.config/git/config ~/.config/git/config
ln -sf ~/dotfiles/.config/git/ignore ~/.config/git/ignore
ln -sf ~/dotfiles/.config/starship.toml ~/.config/starship.toml
mkdir -p ~/.config/ghostty
ln -sf ~/dotfiles/.config/ghostty/config ~/.config/ghostty/config
mkdir -p ~/.config/gh
ln -sf ~/dotfiles/.config/gh/config.yml ~/.config/gh/config.yml
```

### 8. Set up Tmux plugins

> ⚠️ Run these **one at a time** and follow the instructions between commands.

Clone TPM (Tmux Plugin Manager):

```bash
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
```

Start tmux:

```bash
tmux
```

Inside tmux, install all plugins by pressing **`Ctrl+A`** then **`I`** (capital i).
Wait for the install to finish (you'll see a success message at the bottom).

Then reload the config by pressing **`Ctrl+A`** then **`r`**.

Verify plugins are installed:

```bash
ls ~/.config/tmux/plugins/
# Should show: tpm  vim-tmux-navigator  tmux-themepack
#   tmux-resurrect  tmux-continuum  tmux-which-key
```

### 9. Set up Neovim

> 📋 Single command — paste and run.

```bash
nvim
```

On first launch, Lazy.nvim will auto-install all plugins. Wait for the progress window to finish, then quit and reopen:

```
:qa
nvim
```

### 10. Restart your shell

Close and reopen Ghostty, or run:

```bash
exec zsh
```

Everything should now be working — Starship prompt, autosuggestions, syntax highlighting, FZF, zoxide, and vi mode. 🎉

---

## Cheat Sheet

### Tmux

Prefix key is **Ctrl+A** (press Ctrl+A first, then the key).

**Windows & Panes**

| Keys | Action |
|---|---|
| `Ctrl+A \|` | Split pane horizontally |
| `Ctrl+A -` | Split pane vertically |
| `Ctrl+A h/j/k/l` | Resize pane left/down/up/right |
| `Ctrl+A m` | Zoom (maximize/restore) current pane |
| `Ctrl+H/J/K/L` | Navigate between tmux panes and nvim splits |
| `Ctrl+A r` | Reload tmux config |
| `Ctrl+A Space` | Which-key (show all available bindings) |

**Copy Mode (vi-style)**

| Keys | Action |
|---|---|
| `Ctrl+A [` | Enter copy mode |
| `v` | Start selection |
| `y` | Copy selection |

**Plugins**

| Keys | Action |
|---|---|
| `Ctrl+A I` | Install plugins (TPM) |
| `Ctrl+A U` | Update plugins (TPM) |

### Neovim

Leader key is **Space**.

**Find (Telescope)**

| Keys | Action |
|---|---|
| `Space ff` | Find files |
| `Space fg` | Live grep (search text) |
| `Space fb` | Find buffers |
| `Space fr` | Find recent files |
| `Space fs` | Find symbols (document) |
| `Space fk` | Find keymaps |
| `Space fh` | Find help |
| `Space fc` | Find git commits |

**Go To**

| Keys | Action |
|---|---|
| `Space gd` | Go to definition |
| `Space gD` | Go to declaration |
| `Space gi` | Go to implementation |
| `Space gt` | Go to type definition |
| `Space gr` | Go to references |
| `Space gb` | Go back |
| `Space gf` | Go forward |

**Git**

| Keys | Action |
|---|---|
| `Space gg l` | Git log |
| `Space gg s` | Git status |
| `Space gg f` | Git file history |
| `Space gg b` | Git blame line |
| `Space gg a` | Git add (current file) |
| `Space gg c` | Git commit |
| `Space gg p` | Git push |
| `Space gg P` | Git pull |

**Harpoon (quick file switching)**

| Keys | Action |
|---|---|
| `Space ha` | Add file to Harpoon |
| `Space hr` | Remove file from Harpoon |
| `Space hm` | Open Harpoon menu |
| `Space h1-4` | Jump to Harpoon file 1-4 |
| `Space hn/hp` | Next/previous Harpoon file |

**Buffers**

| Keys | Action |
|---|---|
| `Space bn` | Next buffer |
| `Space bp` | Previous buffer |
| `Space b1-5` | Jump to buffer 1-5 |
| `Space bx` | Close buffer and window |
| `Tab / Shift+Tab` | Next/previous buffer |

**Run**

| Keys | Action |
|---|---|
| `Space rj` | Run Java file (Maven) |
| `Space rt` | Open terminal split |

**Navigation between tmux and nvim**

| Keys | Action |
|---|---|
| `Ctrl+h` | Move to left pane/split |
| `Ctrl+j` | Move to pane/split below |
| `Ctrl+k` | Move to pane/split above |
| `Ctrl+l` | Move to right pane/split |

### Zsh

| Keys / Command | Action |
|---|---|
| `Ctrl+R` | Fuzzy search command history (FZF) |
| `ESC` | Switch to vi normal mode |
| `z <folder>` | Smart jump to directory (zoxide) |
| `cd <folder>` | Same as `z` (aliased to zoxide) |
| `Ctrl+A` | Go to start of line |
| `Ctrl+E` | Go to end of line |

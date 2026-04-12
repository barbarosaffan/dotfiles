#!/usr/bin/env bash
# install.sh — macOS dotfiles bootstrap

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

info()    { echo "[info] $*"; }
success() { echo "[ok]   $*"; }
warn()    { echo "[warn] $*"; }

# ── Homebrew ────────────────────────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
  info "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  success "Homebrew already installed"
fi

# ── Homebrew packages ────────────────────────────────────────────────────────
info "Installing Homebrew packages..."
brew install \
  starship \
  zoxide \
  zsh-autosuggestions \
  zsh-syntax-highlighting

success "Homebrew packages installed"

# ── Symlinks ─────────────────────────────────────────────────────────────────
symlink() {
  local src="$1"
  local dst="$2"

  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    warn "Backing up existing $dst → ${dst}.bak"
    mv "$dst" "${dst}.bak"
  fi

  ln -sf "$src" "$dst"
  success "Linked $dst → $src"
}

symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"

# ── Git ───────────────────────────────────────────────────────────────────────
symlink "$DOTFILES_DIR/git/.gitconfig"        "$HOME/.gitconfig"
symlink "$DOTFILES_DIR/git/.gitignore_global" "$HOME/.gitignore_global"

# ── VSCode ────────────────────────────────────────────────────────────────────
VSCODE_DIR="$HOME/Library/Application Support/Code/User"
if [ -d "$VSCODE_DIR" ]; then
  symlink "$DOTFILES_DIR/vscode/settings.json"   "$VSCODE_DIR/settings.json"
  symlink "$DOTFILES_DIR/vscode/keybindings.json" "$VSCODE_DIR/keybindings.json"
else
  warn "VSCode not found — skipping VSCode symlinks"
fi

# ── Ghostty ───────────────────────────────────────────────────────────────────
if [ -d "$HOME/.config/ghostty" ]; then
  symlink "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/config"
else
  mkdir -p "$HOME/.config/ghostty"
  symlink "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/config"
fi

# ── Zed ───────────────────────────────────────────────────────────────────────
if [ -d "$HOME/.config/zed" ]; then
  symlink "$DOTFILES_DIR/zed/settings.json" "$HOME/.config/zed/settings.json"
else
  warn "Zed not found — skipping Zed symlinks"
fi

# ── Done ──────────────────────────────────────────────────────────────────────
echo ""
echo "✓ Done! Reload your shell: source ~/.zshrc"
echo ""
echo "Optional next steps:"
echo "  • Install all Homebrew packages from Brewfile: brew bundle"
echo "  • Pick a Starship theme: starship preset pastel-powerline -o ~/.config/starship.toml"
echo "  • Browse presets: https://starship.rs/presets/"
echo "  • Add your Context7 API key to zed/settings.json"

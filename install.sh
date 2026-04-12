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

# ── Done ──────────────────────────────────────────────────────────────────────
echo ""
echo "✓ Done! Reload your shell: source ~/.zshrc"
echo ""
echo "Optional next steps:"
echo "  • Pick a Starship theme: starship preset pastel-powerline -o ~/.config/starship.toml"
echo "  • Browse presets: https://starship.rs/presets/"

# dotfiles

Personal macOS dotfiles — zsh configuration without Oh My Zsh.

## What's included

| File | Description |
|------|-------------|
| `zsh/.zshrc` | Zsh config: PATH exports, git aliases, plugin sources |
| `git/.gitconfig` | Git identity, aliases, sensible defaults |
| `git/.gitignore_global` | Global gitignore (macOS, editors, secrets, build output) |
| `ghostty/config` | Ghostty terminal emulator config |
| `zed/settings.json` | Zed editor settings |
| `vscode/settings.json` | VSCode editor settings |
| `vscode/keybindings.json` | VSCode custom keybindings |
| `Brewfile` | All Homebrew packages — restore with `brew bundle` |

### Shell stack

| Tool | Role |
|------|------|
| [zsh](https://zsh.sourceforge.io/) | Shell |
| [Starship](https://starship.rs/) | Prompt |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smart `z` directory jumping |
| [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) | Fish-style inline suggestions |
| [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) | Command syntax highlighting |

### Git

`git/.gitconfig` includes:
- Auto-setup remote on push
- Default branch `main`
- `core.autocrlf = input` (safe for macOS/Linux)
- Points to `~/.gitignore_global`
- Useful aliases: `lg` (pretty graph log), `undo` (soft reset last commit)

`git/.gitignore_global` ignores globally: `.DS_Store`, `.env`, `node_modules`, editor files, build artifacts.

> **Note:** After cloning, set your git identity in `git/.gitconfig` if different from the defaults.

### Ghostty

`ghostty/config` — Font: GeistMono Nerd Font Mono 16px, Theme: Catppuccin Frappe, block cursor.

### Zed

`zed/settings.json` — Font: MonoLisa, vim mode, VSCode keymap, Copilot edit predictions, Ayu theme.

> **Note:** Add your Context7 API key to `zed/settings.json` under `context_servers.mcp-server-context7.settings.context7_api_key` — it is intentionally left blank in this repo.

### VSCode

`vscode/settings.json` notable settings:

| Setting | Value |
|---------|-------|
| Font | MonoLisa |
| Terminal font | GeistMono Nerd Font Mono |
| Format on save | ✓ (Prettier for JS/TS/CSS/HTML/Vue) |
| ESLint fix on save | ✓ |
| Organize imports on save | ✓ |
| Inline suggestions (Copilot) | ✓ |
| Cursor style | Block |
| Tab style | Single tab |

`vscode/keybindings.json` — `Ctrl+Enter` / `Shift+Enter` in terminal sends a line continuation (`\`).

### Git aliases (zsh)

| Alias | Command |
|-------|---------|
| `g` | `git` |
| `ga` / `gaa` | `git add` / `git add --all` |
| `gc` / `gcm` | `git commit` / `git commit -m` |
| `gca` | `git commit --amend` |
| `gs` / `gst` | `git status` |
| `gd` / `gds` | `git diff` / `git diff --staged` |
| `gp` / `gpf` | `git push` / `git push --force-with-lease` |
| `gl` / `gf` | `git pull` / `git fetch` |
| `gco` / `gcb` | `git checkout` / `git checkout -b` |
| `gb` / `gbd` / `gbD` | `git branch` / delete (safe) / delete (force) |
| `glog` / `gloga` | Pretty graph log (current / all branches) |
| `grb` / `grbi` | `git rebase` / `git rebase -i` |
| `grbc` / `grba` | `git rebase --continue` / `--abort` |
| `gsh` / `gshp` / `gshl` | `git stash` / `stash pop` / `stash list` |
| `grst` / `grsts` | `git restore` / `git restore --staged` |
| `grs` / `grsh` | `git reset` / `git reset --hard` |
| `gcp` | `git cherry-pick` |

## Installation

```sh
git clone https://github.com/barbarosaffan/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

The install script will:

1. Install **Homebrew** if not already present
2. Install required shell packages via `brew install`
3. Symlink all config files (backs up any existing file as `.bak`):
   - `zsh/.zshrc` → `~/.zshrc`
   - `git/.gitconfig` → `~/.gitconfig`
   - `git/.gitignore_global` → `~/.gitignore_global`
   - `ghostty/config` → `~/.config/ghostty/config`
   - `zed/settings.json` → `~/.config/zed/settings.json`
   - `vscode/settings.json` → `~/Library/Application Support/Code/User/settings.json`
   - `vscode/keybindings.json` → `~/Library/Application Support/Code/User/keybindings.json`

### Restore all Homebrew packages

```sh
brew bundle
```

## Customising the prompt

Starship uses `~/.config/starship.toml`. To apply a preset:

```sh
# Browse presets at https://starship.rs/presets/
starship preset pastel-powerline -o ~/.config/starship.toml
```

To reset to the default prompt, delete the file:

```sh
rm ~/.config/starship.toml
```

## Adding your own config

Edit the relevant file in this repo — since everything is symlinked, changes take effect immediately. To track a new dotfile, copy it into the repo, then add a `symlink` call in `install.sh`:

```sh
symlink "$DOTFILES_DIR/path/to/config" "$HOME/.config/tool/config"
```


# dotfiles

Personal macOS dotfiles — zsh configuration without Oh My Zsh.

## What's included

| File | Description |
|------|-------------|
| `zsh/.zshrc` | Zsh config: PATH exports, git aliases, plugin sources |

### Shell stack

| Tool | Role |
|------|------|
| [zsh](https://zsh.sourceforge.io/) | Shell |
| [Starship](https://starship.rs/) | Prompt |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smart `z` directory jumping |
| [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) | Fish-style inline suggestions |
| [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) | Command syntax highlighting |

### Git aliases

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
git clone https://github.com/<your-username>/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

The install script will:

1. Install **Homebrew** if not already present
2. Install required packages via `brew install`
3. Symlink `zsh/.zshrc` → `~/.zshrc` (backs up any existing file as `.bak`)

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

Edit `zsh/.zshrc` and re-run `./install.sh` (symlink is already in place, so changes take effect immediately after `source ~/.zshrc`).

To track additional dotfiles, add a new `symlink` call in `install.sh`:

```sh
symlink "$DOTFILES_DIR/path/to/config" "$HOME/.config/tool/config"
```

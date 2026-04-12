# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Antigravity
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

# Java
export PATH="/opt/homebrew/opt/openjdk@21/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home -v 21)
export PATH="$JAVA_HOME/bin:$PATH"

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Docker CLI completions
fpath=($HOME/.docker/completions $fpath)
autoload -Uz compinit
compinit

# Git aliases
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gs='git status'
alias gst='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gl='git pull'
alias gf='git fetch'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias glog='git log --oneline --graph --decorate'
alias gloga='git log --oneline --graph --decorate --all'
alias grb='git rebase'
alias grbi='git rebase -i'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias gsh='git stash'
alias gshp='git stash pop'
alias gshl='git stash list'
alias grst='git restore'
alias grsts='git restore --staged'
alias grs='git reset'
alias grsh='git reset --hard'
alias gcp='git cherry-pick'

# Plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

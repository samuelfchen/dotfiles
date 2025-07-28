# Start total time measurement
TIMER=$(($(date +%s%N)/1000000))
echo "Starting zsh initialization..."

# Enable Powerlevel10k instant prompt
t0=$(($(date +%s%N)/1000000))
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
t1=$(($(date +%s%N)/1000000))
echo "p10k instant prompt took $((t1-t0))ms"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"

# Auto-update behavior
zstyle ':omz:update' mode auto

# Plugin loading
t0=$(($(date +%s%N)/1000000))
plugins=(
  git
  z
  fzf
  zsh-autosuggestions
  zsh-vi-mode
  fast-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh
t1=$(($(date +%s%N)/1000000))
echo "oh-my-zsh and plugins took $((t1-t0))ms"

# p10k configuration
t0=$(($(date +%s%N)/1000000))
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
t1=$(($(date +%s%N)/1000000))
echo "p10k configuration took $((t1-t0))ms"

export ZVM_VI_INSERT_ESCAPE_BINDKEY=kj

# PATH modifications
t0=$(($(date +%s%N)/1000000))
path_additions=(
  "$HOME/.pyenv/shims"
  "$HOME/bin/nvim/bin"
)
export PATH="${(j.:.)path_additions}:$PATH"

# Cache yarn global bin path - adjust this path if different
YARN_GLOBAL_BIN="$HOME/.yarn/bin"
[[ -d $YARN_GLOBAL_BIN ]] && export PATH="$YARN_GLOBAL_BIN:$PATH"
t1=$(($(date +%s%N)/1000000))
echo "PATH modifications took $((t1-t0))ms"

# NVM setup and config
t0=$(($(date +%s%N)/1000000))
export NVM_DIR="$HOME/.nvm"

# Lazy load nvm
nvm() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    nvm "$@"
}

# Lazy load node-related commands
node() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    node "$@"
}

npm() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    npm "$@"
}

npx() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
    npx "$@"
}
t1=$(($(date +%s%N)/1000000))
echo "NVM setup took $((t1-t0))ms"

# Source additional files
t0=$(($(date +%s%N)/1000000))
source ~/.alias
test -f ~/.private && source ~/.private
t1=$(($(date +%s%N)/1000000))
echo "Loading additional files took $((t1-t0))ms"

# NVM autoload setup
t0=$(($(date +%s%N)/1000000))
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc 2>/dev/null)"
  if [ -n "$nvmrc_path" ]; then
    local node_version="$(nvm version)"
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use --silent
    fi
  fi
}
add-zsh-hook chpwd load-nvmrc
t1=$(($(date +%s%N)/1000000))
echo "NVM autoload setup took $((t1-t0))ms"

# FZF
t0=$(($(date +%s%N)/1000000))
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
t1=$(($(date +%s%N)/1000000))
echo "FZF loading took $((t1-t0))ms"

# JENV lazy loading
t0=$(($(date +%s%N)/1000000))
export PATH="$HOME/.jenv/bin:$PATH"

jenv() {
    unset -f jenv
    eval "$(command jenv init -)"
    jenv "$@"
}

java() {
    unset -f java
    eval "$(command jenv init -)"
    java "$@"
}

javac() {
    unset -f javac
    eval "$(command jenv init -)"
    javac "$@"
}
t1=$(($(date +%s%N)/1000000))
echo "JENV setup took $((t1-t0))ms"

# Load environment
t0=$(($(date +%s%N)/1000000))
[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"
t1=$(($(date +%s%N)/1000000))
echo "Loading environment took $((t1-t0))ms"

# Total time
TIMER_END=$(($(date +%s%N)/1000000))
echo "Total loading time: $((TIMER_END-TIMER))ms"

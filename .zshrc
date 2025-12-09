# ============================================================================
# ZSH CONFIGURATION
# ============================================================================

# ----------------------------------------------------------------------------
# Performance Profiling (set to true to debug slow startup)
# ----------------------------------------------------------------------------
PROFILE_STARTUP=false
if [[ "$PROFILE_STARTUP" == true ]]; then
    zmodload zsh/zprof
    PS4=$'%D{%M%S%.} %N:%i> '
    exec 3>&2 2>/tmp/zsh_profile.$$
    setopt xtrace prompt_subst
fi

# ----------------------------------------------------------------------------
# Powerlevel10k Instant Prompt
# ----------------------------------------------------------------------------
# Must stay at the top for instant prompt to work properly
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ----------------------------------------------------------------------------
# Oh-My-Zsh Configuration
# ----------------------------------------------------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
zstyle ':omz:update' mode auto

# Note: Removed 'nvm' plugin to avoid duplicate NVM loading (was causing 3x load)
# NVM is initialized manually below for better control and performance
plugins=(
  git
  z
  fzf
  zsh-autosuggestions
  zsh-vi-mode
  fast-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Load Powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ----------------------------------------------------------------------------
# Vi Mode Configuration
# ----------------------------------------------------------------------------
export ZVM_VI_INSERT_ESCAPE_BINDKEY=kj

# Custom vi-mode yank function (copy to system clipboard)
zvm_vi_yank() {
    zvm_yank
    if [[ -n "$SSH_CONNECTION" ]]; then
        (printf %s "${CUTBUFFER}" | it2copy)
    else
        (printf %s "${CUTBUFFER}" | pbcopy)
    fi
    zvm_exit_visual_mode
}

# ----------------------------------------------------------------------------
# PATH Configuration
# ----------------------------------------------------------------------------
# Consolidate all PATH modifications in one place for clarity
export PATH="$HOME/.pyenv/shims:$PATH"
export PATH="$HOME/bin/nvim/bin:$PATH"
export PATH="$HOME/bin/nvim-linux-x86_64/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"

# Yarn global binaries
[[ -d "$HOME/.yarn/bin" ]] && export PATH="$HOME/.yarn/bin:$PATH"

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ----------------------------------------------------------------------------
# NVM (Node Version Manager) Configuration - LAZY LOADED
# ----------------------------------------------------------------------------
# NVM is lazy-loaded to improve startup time (saves ~2 seconds)
# It will initialize automatically when:
#   1. You run node, npm, npx, or nvm commands
#   2. You cd into a directory with .nvmrc file

export NVM_DIR="$HOME/.nvm"
_NVM_LOADED=false

# Function to initialize NVM (called by lazy-load wrappers)
_init_nvm() {
  if [ "$_NVM_LOADED" = false ]; then
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    
    # Temporary fix for devbox compatibility
    nvm deactivate --silent 2>/dev/null
    
    _NVM_LOADED=true
    
    # After loading, check current directory for .nvmrc
    _load_nvmrc_if_present
  fi
}

# Lazy-load wrappers for common commands
nvm() {
  unset -f nvm
  _init_nvm
  nvm "$@"
}

node() {
  unset -f node
  _init_nvm
  node "$@"
}

npm() {
  unset -f npm
  _init_nvm
  npm "$@"
}

npx() {
  unset -f npx
  _init_nvm
  npx "$@"
}

# Helper function to find .nvmrc without NVM loaded
_find_nvmrc() {
  local dir="$PWD"
  while [ "$dir" != "/" ]; do
    if [ -f "$dir/.nvmrc" ]; then
      echo "$dir/.nvmrc"
      return
    fi
    dir="$(dirname "$dir")"
  done
}

# Auto-switch Node version based on .nvmrc files
_load_nvmrc_if_present() {
  if [ "$_NVM_LOADED" = false ]; then
    return
  fi
  
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

# Hook that runs when changing directories
_nvm_auto_switch() {
  if [ -n "$(_find_nvmrc)" ]; then
    # Found .nvmrc, initialize NVM if not loaded
    if [ "$_NVM_LOADED" = false ]; then
      _init_nvm
    else
      # NVM already loaded, just switch version
      _load_nvmrc_if_present
    fi
  fi
}

# Set up the directory change hook
autoload -U add-zsh-hook
add-zsh-hook chpwd _nvm_auto_switch

# ----------------------------------------------------------------------------
# FZF (Fuzzy Finder) Configuration
# ----------------------------------------------------------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ----------------------------------------------------------------------------
# JENV (Java Environment Manager) - Lazy Loading
# ----------------------------------------------------------------------------
# Lazy load jenv to improve startup time (only initializes when first used)
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

export JAVA_HOME=/usr/lib/jvm/java-21-amazon-corretto
export PATH=$JAVA_HOME/bin:$PATH

# ----------------------------------------------------------------------------
# Additional Sources
# ----------------------------------------------------------------------------
# Aliases
source ~/.alias

# Private configuration (not version controlled)
test -f ~/.private && source ~/.private

# Custom environment variables
[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Bun completions
[ -s "/home/ubuntu/.bun/_bun" ] && source "/home/ubuntu/.bun/_bun"

# ----------------------------------------------------------------------------
# Performance Profiling Output
# ----------------------------------------------------------------------------
if [[ "$PROFILE_STARTUP" == true ]]; then
    unsetopt xtrace
    exec 2>&3 3>&-
    echo "\n=== ZSH Startup Profile ==="
    echo "Detailed trace written to: /tmp/zsh_profile.$$"
    echo "\n=== Top 20 Slowest Functions ==="
    zprof | head -n 20
fi
export PATH="$HOME/bin/nvim-linux-x86_64/bin:$PATH"

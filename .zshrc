# Set to true to enable timing logs
ENABLE_TIMING_LOGS=false

# Timing function
function log_time() {
    if [ "$ENABLE_TIMING_LOGS" = true ]; then
        echo "$@"
    fi
}

# Start total time measurement
if [ "$ENABLE_TIMING_LOGS" = true ]; then
    TIMER=$(($(date +%s%N)/1000000))
    log_time "Starting zsh initialization..."
fi

# Enable Powerlevel10k instant prompt
if [ "$ENABLE_TIMING_LOGS" = true ]; then t0=$(($(date +%s%N)/1000000)); fi
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
if [ "$ENABLE_TIMING_LOGS" = true ]; then
    t1=$(($(date +%s%N)/1000000))
    log_time "p10k instant prompt took $((t1-t0))ms"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"

# Auto-update behavior
zstyle ':omz:update' mode auto

# Plugin loading
if [ "$ENABLE_TIMING_LOGS" = true ]; then t0=$(($(date +%s%N)/1000000)); fi
plugins=(
  git
  z
  fzf
  zsh-autosuggestions
  zsh-vi-mode
  fast-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh
if [ "$ENABLE_TIMING_LOGS" = true ]; then
    t1=$(($(date +%s%N)/1000000))
    log_time "oh-my-zsh and plugins took $((t1-t0))ms"
fi

# p10k configuration
if [ "$ENABLE_TIMING_LOGS" = true ]; then t0=$(($(date +%s%N)/1000000)); fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
if [ "$ENABLE_TIMING_LOGS" = true ]; then
    t1=$(($(date +%s%N)/1000000))
    log_time "p10k configuration took $((t1-t0))ms"
fi

export ZVM_VI_INSERT_ESCAPE_BINDKEY=kj

# PATH modifications
if [ "$ENABLE_TIMING_LOGS" = true ]; then t0=$(($(date +%s%N)/1000000)); fi
path_additions=(
  "$HOME/.pyenv/shims"
  "$HOME/bin/nvim/bin"
)
export PATH="${(j.:.)path_additions}:$PATH"

# Cache yarn global bin path - adjust this path if different
YARN_GLOBAL_BIN="$HOME/.yarn/bin"
[[ -d $YARN_GLOBAL_BIN ]] && export PATH="$YARN_GLOBAL_BIN:$PATH"
if [ "$ENABLE_TIMING_LOGS" = true ]; then
    t1=$(($(date +%s%N)/1000000))
    log_time "PATH modifications took $((t1-t0))ms"
fi

# NVM setup and config
if [ "$ENABLE_TIMING_LOGS" = true ]; then t0=$(($(date +%s%N)/1000000)); fi
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
if [ "$ENABLE_TIMING_LOGS" = true ]; then
    t1=$(($(date +%s%N)/1000000))
    log_time "NVM setup took $((t1-t0))ms"
fi

# Source additional files
if [ "$ENABLE_TIMING_LOGS" = true ]; then t0=$(($(date +%s%N)/1000000)); fi
source ~/.alias
test -f ~/.private && source ~/.private
if [ "$ENABLE_TIMING_LOGS" = true ]; then
    t1=$(($(date +%s%N)/1000000))
    log_time "Loading additional files took $((t1-t0))ms"
fi

# NVM autoload setup
if [ "$ENABLE_TIMING_LOGS" = true ]; then t0=$(($(date +%s%N)/1000000)); fi
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
if [ "$ENABLE_TIMING_LOGS" = true ]; then
    t1=$(($(date +%s%N)/1000000))
    log_time "NVM autoload setup took $((t1-t0))ms"
fi

# FZF
if [ "$ENABLE_TIMING_LOGS" = true ]; then t0=$(($(date +%s%N)/1000000)); fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [ "$ENABLE_TIMING_LOGS" = true ]; then
    t1=$(($(date +%s%N)/1000000))
    log_time "FZF loading took $((t1-t0))ms"
fi

# JENV lazy loading
if [ "$ENABLE_TIMING_LOGS" = true ]; then t0=$(($(date +%s%N)/1000000)); fi
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
if [ "$ENABLE_TIMING_LOGS" = true ]; then
    t1=$(($(date +%s%N)/1000000))
    log_time "JENV setup took $((t1-t0))ms"
fi

# Load environment
if [ "$ENABLE_TIMING_LOGS" = true ]; then t0=$(($(date +%s%N)/1000000)); fi
[[ -f "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"
if [ "$ENABLE_TIMING_LOGS" = true ]; then
    t1=$(($(date +%s%N)/1000000))
    log_time "Loading environment took $((t1-t0))ms"
fi

# Total time
if [ "$ENABLE_TIMING_LOGS" = true ]; then
    TIMER_END=$(($(date +%s%N)/1000000))
    log_time "Total loading time: $((TIMER_END-TIMER))ms"
fi

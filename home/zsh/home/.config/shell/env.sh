# Source Home Manager session variables
. ~/.local/state/nix/profile/etc/profile.d/hm-session-vars.sh

# XDG directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Home decluttering
# .config/
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"        # .docker/
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npmrc" # .npmrc
export OMNISHARPHOME="$XDG_CONFIG_HOME/omnisharp"     # .omnisharp/
export XINITRC="$XDG_CONFIG_HOME/xinitrc"             # .xinitrc
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"                 # .zlogin, .zshrc, ...
# .cache/
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"    # .nv
export XAUTHORITY="$XDG_CACHE_HOME/Xauthority" # .Xauthority
# .local/share/
export CARGO_HOME="$XDG_DATA_HOME/cargo"        # .cargo/
export DOTNET_CLI_HOME="$XDG_DATA_HOME/dotnet"  # .dotnet/, .nuget/, .templateengine/
export GOPATH="$XDG_DATA_HOME/go"               # go/
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle" # .gradle/
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"      # .rustup/
export WINEPREFIX="$XDG_DATA_HOME/wine"         # .wine/
# .local/state/
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node_repl_history" # .node_repl_history
export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"       # .python_history

# Bash and Zsh history
export HISTFILE="$XDG_STATE_HOME/histfile"
export HISTSIZE=1000
export SAVEHIST="$HISTSIZE"
export HISTCONTROL='ignoreboth:erasedups'

# Theming
export BAT_THEME='base16-256'
eval "$(dircolors)"

# Cache Rust builds globally
export RUSTC_WRAPPER='sccache'

# Add paths to $PATH if they're not already present
add_path() {
    [[ ":$PATH:" != *":$1:"* ]] && PATH="$PATH:$1"
}

add_path "$CARGO_HOME/bin"
add_path "$GOPATH/bin"

unset -f add_path

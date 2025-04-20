#!/usr/bin/env bash

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# .cache/
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv" # .nv

# .config/
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"        # .docker/
export INPUTRC="$XDG_CONFIG_HOME/inputrc"             # .inputrc
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npmrc" # .npmrc
export OMNISHARPHOME="$XDG_CONFIG_HOME/omnisharp"     # .omnisharp/
export XINITRC="$XDG_CONFIG_HOME/xinitrc"             # .xinitrc

# .local/share/
export CARGO_HOME="$XDG_DATA_HOME/cargo"                    # .cargo/
export DOTNET_CLI_HOME="$XDG_DATA_HOME/dotnet"              # .dotnet/, .nuget/, .templateengine/
# export GNUPGHOME="$XDG_DATA_HOME/gnupg"                     # .gnupg/
export GOPATH="$XDG_DATA_HOME/go"                           # go/
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"             # .gradle/
export HISTFILE="$XDG_DATA_HOME/bash_history"               # .bash_history
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history" # .node_repl_history
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"   # .password-store/
export PYTHON_HISTORY="$XDG_DATA_HOME/python_history"       # .python_history
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"                  # .rustup/
export WINEPREFIX="$XDG_DATA_HOME/wine"                     # .wine/

# /run/user/$UID
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # .Xauthority

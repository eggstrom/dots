# Source Home Manager session variables
if [[ -r ~/.nix-profile/etc/profile.d/hm-session-vars.sh ]]; then
  . ~/.nix-profile/etc/profile.d/hm-session-vars.sh
elif [[ -r ~/.local/state/nix/profile/etc/profile.d/hm-session-vars.sh ]]; then
  . ~/.local/state/nix/profile/etc/profile.d/hm-session-vars.sh
fi

. ~/.config/bash/xdg.sh

# Colors
eval "$(dircolors)"
export BAT_THEME=base16-256

# Cache Rust builds globally
export RUSTC_WRAPPER=sccache

# Add paths to $PATH if they're not already present
add_path() {
  [[ ":$PATH:" != *":$1:"* ]] && PATH="${PATH:+$PATH:}$1"
}
add_path ~/.local/bin
add_path "$CARGO_HOME/bin"
add_path "$GOPATH/bin"
unset -f add_path

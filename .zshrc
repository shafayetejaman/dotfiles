
# ~/.zshrc - Full Ghostty/Omerchy + minimal tmux setup

# ------------------------------------------
# Only run in interactive shells
[[ $- != *i* ]] && return

# Load environment (your existing env file)
. "$HOME/.local/share/../bin/env"

# Load omarchy-zsh configuration
if [[ -d /usr/share/omarchy-zsh/conf.d ]]; then
  for config in /usr/share/omarchy-zsh/conf.d/*.zsh; do
    [[ -f "$config" ]] && source "$config"
  done
fi

# Load omarchy-zsh functions and aliases
if [[ -d /usr/share/omarchy-zsh/functions ]]; then
  for func in /usr/share/omarchy-zsh/functions/*.zsh; do
    [[ -f "$func" ]] && source "$func"
  done
fi

if [[ "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select" || \
      "${widgets[zle-keymap-select]#user:}" == "starship_zle-keymap-select-wrapped" ]]; then
    zle -N zle-keymap-select "";
fi


# ------------------------------------------
# Exports
# export GDK_SCALE=1
# export GDK_DPI_SCALE=0.5
# export QT_AUTO_SCREEN_SCALE_FACTOR=1
# export QT_SCALE_FACTOR=1
# export QT_FONT_DPI=192
# export XCURSOR_SIZE=48
# export MOZ_ENABLE_WAYLAND=1
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
export EDITOR=nvim

# ------------------------------------------
# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
autoload -U compinit; compinit
source ~/.somewhere/fzf-tab.plugin.zsh
source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval $(thefuck --alias fk)
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
ZSH_FZF_HISTORY_SEARCH_BIND='^R'
source ~/.zsh/zsh-fzf-history-search/zsh-fzf-history-search.zsh
eval "$(starship init zsh)"



# ------------------------------------------
# Bindings
bindkey '^H' backward-kill-word
bindkey -M vicmd '_' vi-digit-or-beginning-of-line
# Accept autosuggestion with Ctrl+N
bindkey -M viins '^N' autosuggest-accept

# ------------------------------------------
# Aliases
alias reload="source ~/.zshrc"
alias vi="nvim"
alias vim="nvim"
alias nano="nvim"
alias rm="trash-put"
alias py="python3.13"
alias python="python3.13"
alias cat=bat
alias gw="$HOME/Work"
alias sudo='sudo '
alias ch='cht.sh'

# ------------------------------------------
# Functions

fs() {
    eval "sudo $(fc -ln -1)"
}

# yazi move to current dir function
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
 
# ------------------------------------------
# -----------End-----------------------
# --- Minimal tmux session ---

if [[ -n $PS1 ]] && [[ -z $TMUX ]]; then
    tmux has-session -t main 2>/dev/null || tmux new-session -d -s main
    # No exec attach — attach manually if you want
fi

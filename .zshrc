
# ~/.zshrc - Full Ghostty/Omerchy + minimal tmux setup

# ------------------------------------------
# Only run in interactive shells
[[ $- != *i* ]] && return

# Load shared shell configuration (aliases, functions, environment, tool init)
[[ -f /usr/share/omarchy-zsh/shell/all ]] && source /usr/share/omarchy-zsh/shell/all

# Add your own customizations below

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
export EDITOR=nvim
export VISUAL=nvim

# ------------------------------------------
# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
autoload -U compinit; compinit
source ~/.somewhere/fzf-tab.plugin.zsh
source ~/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval $(thefuck --alias fk)
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
eval "$(starship init zsh)"
eval "$(atuin init zsh)"
eval "$(zoxide init zsh)"


# ------------------------------------------
# Aliases
alias reload="source ~/.zshrc"
alias vi="nvim"
alias vim="nvim"
alias nano="nvim"
alias rm="trash-put"
alias py="python3.13"
alias python="python3.13"
alias cat="bat"
alias sudo='sudo '
alias ch='cht.sh'
alias grep="rg"
alias find="fd"
alias zed="zeditor"
alias python=python3
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias c='opencode'
alias cd='z'
alias eff='$EDITOR $(ff)'
alias ff='fzf --preview '\''bat --style=numbers --color=always {}'\'''
alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lzd='lazydocker'
alias t='tmux attach || tmux new -s Work'


# ------------------------------------------
# Functions

function gcm() {
  if [ $# -eq 0 ]; then
    echo "Usage: gac <commit message>"
    return 1
  fi
  git add .
  git commit -m "$*"
}

# fzf ZLE widgets
if command -v fzf &>/dev/null; then
  # fzf file/directory search widget (Ctrl+Alt+F)
  fzf-file-widget() {
    local fd_cmd=$(command -v fdfind || command -v fd || echo "fd")
    local current_token="${LBUFFER##* }"
    local expanded_token=""
    if [[ -n "$current_token" ]]; then
      expanded_token=$(eval echo "$current_token" 2>/dev/null || echo "$current_token")
    fi

    local selected
    if [[ "$expanded_token" == */ ]] && [[ -d "$expanded_token" ]]; then
      selected=$($fd_cmd --color=always --base-directory="$expanded_token" 2>/dev/null | \
        fzf --multi --ansi --prompt="Directory $expanded_token> " \
          --preview="[[ -d $expanded_token{} ]] && ls -lah $expanded_token{} || bat --color=always --style=numbers $expanded_token{} 2>/dev/null || cat $expanded_token{}")
      [[ -n "$selected" ]] && selected="${expanded_token}${selected}"
    else
      selected=$($fd_cmd --color=always 2>/dev/null | \
        fzf --multi --ansi --prompt="Directory> " --query="$expanded_token" \
          --preview="[[ -d {} ]] && ls -lah {} || bat --color=always --style=numbers {} 2>/dev/null || cat {}")
    fi

    if [[ -n "$selected" ]]; then
      selected=$(printf '%q' "$selected")
      LBUFFER="${LBUFFER%$current_token}${selected} "
    fi
    zle reset-prompt
  }
  zle -N fzf-file-widget
  bindkey '^[^F' fzf-file-widget  # Ctrl+Alt+F

  # fzf git log search widget (Ctrl+Alt+L)
  fzf-git-log-widget() {
    if ! git rev-parse --git-dir >/dev/null 2>&1; then
      echo "Not in a git repository." >&2
      return 1
    fi

    local selected
    selected=$(git log --no-show-signature --color=always \
      --format='%C(bold blue)%h%C(reset) - %C(cyan)%ad%C(reset) %C(yellow)%d%C(reset) %C(normal)%s%C(reset)  %C(dim normal)[%an]%C(reset)' \
      --date=short | \
      fzf --ansi --multi --scheme=history --prompt="Git Log> " \
        --preview='git show --color=always --stat --patch {1}' \
        --preview-window=right:50%:wrap | \
      awk '{print $1}' | \
      xargs -I {} git rev-parse {} 2>/dev/null | \
      tr '\n' ' ')

    if [[ -n "$selected" ]]; then
      LBUFFER="${LBUFFER}${selected}"
    fi
    zle reset-prompt
  }
  zle -N fzf-git-log-widget
  bindkey '^[^L' fzf-git-log-widget  # Ctrl+Alt+L

  # fzf variables search widget (Ctrl+V)
  fzf-variables-widget() {
    local current_token="${LBUFFER##* }"
    local cleaned_token="${current_token#\$}"

    local selected
    selected=$(typeset -p | awk '{print $1, $2}' | sort -u | awk '{print $2}' | \
      fzf --multi --prompt="Variables> " --preview-window=wrap \
        --preview='echo {} && typeset -p {} 2>/dev/null || echo "No details available"' \
        --query="$cleaned_token")

    if [[ -n "$selected" ]]; then
      if [[ "$current_token" == \$* ]]; then
        selected="\$${selected}"
      fi
      LBUFFER="${LBUFFER%$current_token}${selected} "
    fi
    zle reset-prompt
  }
  zle -N fzf-variables-widget
  bindkey '^V' fzf-variables-widget  # Ctrl+V
fi
function man() {
    command man "$@" | bat --language=man
}

function fs() {
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
# Bindings
bindkey '^H' backward-kill-word
bindkey -M vicmd '_' vi-digit-or-beginning-of-line
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^[i" edit-command-line
bindkey -r '^T'

# Separate function just for Y (yank to end-of-line)
function clipboard_vi_yank_eol() {
  zle beginning-of-line
  zle vi-yank-eol      # Built-in: yank from cursor to EOL
  echo -n "$CUTBUFFER" | wl-copy
}
zle -N clipboard_vi_yank_eol
bindkey -M vicmd 'Y' clipboard_vi_yank_eol

function clipboard_vi_yank() {
  zle vi-yank
  echo -n "$CUTBUFFER" | wl-copy
}
zle -N clipboard_vi_yank
bindkey -M visual 'Y' clipboard_vi_yank

autoload -Uz add-zsh-hook
add-zsh-hook precmd bind_custom_key
# Delayed binding (after compinit and prompt)
bind_custom_key() {
  # Accept autosuggestion with Ctrl+N
  bindkey -M viins '^N' autosuggest-accept
  bindkey '^R' atuin-search
  bindkey -M vicmd '^R' atuin-search
  bindkey -M viins '^R' atuin-search

}


# ----------------------- End ----------------------- 
# --- Create tmux session if not already running  ---
if [[ -n $PS1 ]] && [[ -z $TMUX ]] && [[ -z $SSH_CONNECTION ]]; then
    tmux has-session 2>/dev/null || tmux new -s Work
fi


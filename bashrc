alias py=python3
alias del='gio trash' # move to trash
# alias cl='PS1="\[\033[01;31m\]HELL\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]: "'
# small w is full path and Capital W is pwd
alias cl='PS1="\[\033[01;31m\]HELL\[\033[00m\] \[\033[01;34m\]\W\[\033[00m\]: "'

PS1='\[\033[01;31m\]HELL\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]: '

# Started using zsh (kitty) after this.
# Also checkout [Omarchy-like setup](https://github.com/basecamp/omaterm/blob/master/install.sh)

# PROMPT='%F{red}%BAPPLE%b%f %F{blue}%~%f: '

alias y='yazi'
alias v='nvim' #lazyvim
alias lq='lazysql'
# eza -> replacement for ls
alias ls="eza -l --icons --group-directories-first"
alias ll="eza -l --icons --group-directories-first"
alias la="eza -la --icons --group-directories-first"
alias lt="eza --tree --icons"

mk() {
  if [ -z "$1" ]; then
    echo "Usage: mk <dir>"
    return 1
  fi
  mkdir -p "$1" && cd "$1"
}

export LS_COLORS="$(vivid generate tokyonight-night)"

eval "$(/usr/local/bin/brew shellenv)"
eval "$(starship init zsh)"


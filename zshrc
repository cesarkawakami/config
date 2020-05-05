HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
bindkey -e
setopt share_history

zstyle :compinstall filename '/home/cesar/.zshrc'
autoload -Uz compinit
compinit

# SSH Agent
# TODO: Maybe add option to disable this if needed
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent > "$HOME/.ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    eval "$(<"$HOME/.ssh-agent.env")"
fi

# Bash-like word jumping
# WORDCHARS=
autoload -U select-word-style
select-word-style bash

# Bash-like CLI comments
setopt interactivecomments

# Bash-like C-u
bindkey \^U backward-kill-line

alias ls='ls --color=auto'

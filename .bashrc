#!/bin/bash
# ===== GENERAL

# sudo completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# # add local bin to PATH
# if [ -d "$HOME/.local/bin" ] ; then
# 	# export recursively
# 	export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
# fi
export PATH="$PATH:$HOME/.local/bin/flutter/bin";
export PATH="$PATH:/usr/lib/dart/bin";

# source files
for file in ~/.bash_{aliases,prompt,completion}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

unset file;

# ===== EXPORTS
export EDITOR=code
export NOTES_PATH=~/.notes

# ===== ALIASES
alias up='sudo apt update && sudo apt upgrade -y && sudo apt install -f && sudo apt autoremove -y'
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -A'
alias c='clear'
alias q='exit'
alias ip='ip -c'
alias grep='grep --color=auto'
alias v='vim'
alias nt="vim $NOTES_PATH/remote/index.md"
alias g='git'

complete -F _complete_alias g
complete -F _complete_alias glog
complete -F _complete_alias gpud
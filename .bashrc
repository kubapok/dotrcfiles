EDITOR=vi

PATH="$HOME/.cabal/bin:$PATH"


alias ccc="xclip -selection clipboard"
alias lt="ls -lt"

set -o vi

alias prompt='PS1="\[$(tput setaf 2)\]"\$"\[$(tput sgr0)\]"'

alias new='tmux neww -c "$PWD"'
alias sp='tmux split-window -c "$PWD"'
alias vsp='tmux split-window -h'


export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib32

# added by Miniconda3 4.3.14 installer


CUDA_ROOT=/usr/local/cuda-8.0/bin
export PATH="/home/kuba/miniconda3/bin:$PATH"




PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '

alias ll='ls -al'

alias "pip3.6"="python3.6 -m pip $1"


function mkdire { mkdir $1 ; cd $1 ;}

export VISUAL=vim
export EDITOR="$VISUAL"

alias mc='mc -d'

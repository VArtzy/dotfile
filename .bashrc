#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias sd='d=$(fd --type d | fzf) && tmux new-session -c "$d" -s nvim nvim .'
alias GH='cat .GH | wl-copy'
eval "$(oh-my-posh init bash --config ~/.config/vartz.omp.json)"
source ~/.local/share/blesh/out/ble.sh

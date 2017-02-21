#! /bin/bash
[[ $- != *i* ]]  && return
if command -v tmux>/dev/null; then
	if [ -z "$TMUX" ]; then	
		#tmux -f ~/.tmux.conf attach -t main
		tmux -f ~/.tmux.conf
	fi
fi


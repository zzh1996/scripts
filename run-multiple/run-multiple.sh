#!/bin/bash

session="mysession"

tmux new -d -s "$session" || exit 1

tmux set-option mouse on
tmux set-option remain-on-exit on

for i in `seq 1 $1`
do
    tmux split-window -f -h -t "$session" "${@:2}"
    tmux select-layout -t "$session" tiled && echo $i succeed
done

tmux kill-pane -t "$session":0.0
tmux select-layout -t "$session" tiled

tmux attach -t "$session"
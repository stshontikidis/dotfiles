#!/bin/sh

vpn_up=$(ifconfig | grep 172.16)
session='Work'

cd $HOME

tmux start-server
tmux new-session -d -s $session

tmux selectp -t 0
tmux send "cd ~/de-sandbox && [[ -z '$vpn_up' ]] && vagrant up && vagrant ssh || echo 'Vagrant not started while VPN up'" C-m
tmux splitw -v -p 42

tmux selectp -t 1
tmux send "cd ~/de-sandbox/apps/edde && source venv/bin/activate" C-m
tmux splitw -h

tmux selectp -t 2
tmux send "cd ~/de-sandbox/apps/core.discoveryeducation.com/" C-m

tmux a -t $session


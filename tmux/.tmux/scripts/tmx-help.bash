#!/bin/bash

# tmux split-window -h -l 40 "clear; cat ~/.tmux/scripts/tmux-help.txt; echo ''; echo 'Premi INVIO per chiudere'; read"
tmux split-window -h -l 50 "bash ~/.tmux/scripts/tmux-help-text-colored.sh"


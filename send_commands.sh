#!/bin/bash

filename=$(basename "\$1")
classname="${filename%.*}"
package=$(dirname "\$1" | sed 's/\//./g')

tmux select-pane -t :.+ # Switch to the next pane
tmux send-keys "javac -d . $filename" Enter
tmux send-keys "java $package.$classname" Enter

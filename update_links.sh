#!/bin/bash

# This script is used to:
#1. Diff these rc files with those in your $HOME directory and if they differ - create a backup of your files
#2. Create symbolic links in your $HOME directory pointing to these files

FILES="bash_aliases bashrc screenrc vimrc vrapperrc"

echo "Your home directory is: $HOME"
for f in $FILES; do
    exit_status=$?
    diff $f "$HOME/.$f" -q
    if [ "$exit_status" -eq 1 ]; then
        echo "DBG: Files differ. Name: $f"
    else if [ "$exit_status" -eq 2 ]; then
        echo "DBG: No such file $HOME/.$f"
    fi
    fi
done

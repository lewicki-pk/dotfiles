#!/bin/bash

# This script is used to:
#1. Diff these rc files with those in your $HOME directory and if they differ - create a backup of your files
#2. Create symbolic links in your $HOME directory pointing to these files

FILES="bash_aliases bashrc screenrc vimrc vrapperrc tmux.conf nvimrc clang-format ideavimrc"

echo "Your home directory is: $HOME"
for f in $FILES; do
    diff $f "$HOME/.$f" -q
    exit_status=$?
    if [ "$exit_status" -eq 1 ]; then
        echo "DBG: Files differ. Name: $f"
        echo "Created backup in $PWD/backup and original will be overwritten"
        # backup file
        mkdir -p backup;
        cp "$HOME/.$f" ./backup;
    elif [ "$exit_status" -eq 2 ]; then
        echo "No such file $HOME/.$f About to create a symlink there"
    elif [ "$exit_status" -eq 0 ]; then
        # notify that files are the same
        echo "Files $HOME/.$f and $f are the same. Original will be overwritten."
    fi

    # create a symlink
    ln -fs $PWD/$f "$HOME/.$f"
    echo ""
done

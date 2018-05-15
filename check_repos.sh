#!/bin/sh

cd "$HOME/repos"

REPOS="$(find * -path '*/*/*/*' -prune -o -name '.git' -type d -printf '%h\n')"
for REPO in $REPOS; do
    (
        echo "$REPO"
        cd "$REPO"
        # git status --porcelain --untracked-files=no -b | sed 's/^/\t/'
        git status | sed 's/^/\t/'
    )
done

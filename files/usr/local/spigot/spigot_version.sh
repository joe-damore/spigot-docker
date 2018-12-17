#!/usr/bin/env bash

# Echo the current installed Spigot version, or "NONE" if not installed
for f in "$SPIGOT_HOME/spigot-*";
do
    [ -e "$f" ] && echo "$f";
    exit 0
done

echo "NONE"
exit 1

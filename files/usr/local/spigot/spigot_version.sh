#!/usr/bin/env bash

# Echo the current installed Spigot version, or "NONE" if not installed

spigot_file=$(find "$SPIGOT_HOME"/spigot -maxdepth 1 -iname 'spigot-*' -print -quit)
if [ -n "$spigot_file" ]
then
    echo "$spigot_file"
    exit 0
fi

echo "NONE"
exit 1

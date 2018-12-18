#!/usr/bin/env bash

# Echo the current installed Spigot version, or "NONE" if not installed
echo "Spigot version"

for f in "$SPIGOT_HOME"/spigot-*;
do
    echo "Found"
    echo "$f"

    if [ -e "$f" ]
    then
        echo "BINGO!"
        echo "$f"
    fi
    exit 0
done

echo "NONE"
exit 1

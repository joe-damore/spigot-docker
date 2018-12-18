#!/usr/bin/env bash

# Echo the current installed Spigot version, or "NONE" if not installed

spigot_file=$(find "$SPIGOT_HOME"/spigot -maxdepth 1 -iname 'spigot-*' -print)
if [ -n "$spigot_file" ]
then
    if [ $version =~ \\"$SPIGOT_HOME"\/spigot-(*.).jar ]
    then
        echo "$version"
        exit 0
    fi
fi

echo "NONE"
exit 1

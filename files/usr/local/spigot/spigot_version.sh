#!/usr/bin/env bash

# Echo the current installed Spigot version, or "NONE" if not installed

# Make sure home directory exists
if [ ! -d "$SPIGOT_HOME" ]
then
    mkdir "$SPIGOT_HOME"
fi

# Find spigot-*.jar in $SPIGOT_HOME
spigot_file=$(find "$SPIGOT_HOME" -maxdepth 1 -iname 'spigot-*' -print)
if [ -n "$spigot_file" ]
then
    version=${spigot_file#"$SPIGOT_HOME"/spigot-}
    version=${version%.jar}

    if [ -n "$version" ]
    then
        echo "$version"
        exit 0
    fi
fi

echo "NONE"
exit 1

#!/usr/bin/env bash

# Echo the current installed Spigot version, or "NONE" if not installed

# Confirm that home directory exists.
if [ ! -d "$SPIGOT_HOME" ]
then
    # Create home directory if it does not.
    mkdir "$SPIGOT_HOME"
fi

# Find any file in $SPIGOT_HOME whose filename begins with "spigot-"
spigot_file=$(find "$SPIGOT_HOME" -maxdepth 1 -iname 'spigot-*' -print)
if [ -n "$spigot_file" ]
then
    # Determine Spigot's version using the filename.
    version=${spigot_file#"$SPIGOT_HOME"/spigot-}
    version=${version%.jar}

    # Output the result, if applicable.
    if [ -n "$version" ]
    then
        echo "$version"
        exit 0
    fi
fi

# No Spigot file was found.
# Echo "NONE" to indicate that Spigot is not installed.
echo "NONE"
exit 1

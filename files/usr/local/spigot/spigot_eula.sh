#!/usr/bin/env bash

eula_path="$SPIGOT_HOME/eula.txt"

cd "$SPIGOT_HOME" || exit 1

# Returns 1 if the EULA file exists,
# returns 0 otherwise.
function eula_exists {
    if [ ! -f "$eula_path" ]
    then
        # false
        return 1
    fi
    # true
    return 0
}

# Creates a blank file at $eula_path
function eula_create {
    touch "$eula_path"

    return 0
}

# Deletes the file at $eula_path
function eula_delete {
    rm -f "$eula_path"
}

# If a file exists at $eula_path, it is deleted and replaced with a blank file
function eula_reset {
    if eula_exists
    then
        eula_delete
        eula_create
    fi
}

# Sets the eula property of the eula file to the given value.
function eula_set {
    eula_value="$1"

    echo "# EULA file generated automatically by Spigot Docker container" > "$eula_path"
    echo "eula=$eula_value" >> "$eula_path"

    return 0
}

# Returns true (0) if eula has been accepted, false (1) otherwise.
function eula_get {
    if ! eula_exists
    then
        return 1
    fi

    eula_line=$(tail -n 1 "$eula_path")
    eula_line=${eula_line#"eula="}

    case $eula_line in

        "true")
            return 0
        ;;

        "false")
            return 1
        ;;

        *)
            return 1
        ;;
    esac
}

case $1 in

    "set")
        eula_reset
        eula_set "$2"
    ;;

    "get")
        if eula_get
        then
            echo "true"
            exit 0
        fi

        echo "false"
        exit 0
    ;;

    *)
        echo "Unrecognized command"
    ;;

esac

exit 0

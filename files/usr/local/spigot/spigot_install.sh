#!/usr/bin/env bash

cd "$SPIGOT_HOME" || exit 1

# Creates the /spigot_build directory if it does
# not already exist
function prepare_build_directory {
    if [ ! -d /spigot_build ]
    then
        mkdir -p /spigot_build
    fi
}

# Unset git core.autocrlf property, as per Spigot's build documentation
function configure_git_crlf {
    echo "Configuring git..."
    git config --global --unset core.autocrlf
    echo "Done!"

    exit 0
}

# Downloads the Spigot build tools to /spigot_build
function download_build_tools {
    # Latest buildtools URL comes from https://www.spigotmc.org/wiki/buildtools/
    echo "Downloading BuildTools.jar..."
    wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar -O /spigot_build/BuildTools.jar
    echo "Done!"

    exit 0
}

# Runs Spigot build tools
function execute_build_tools {
    echo "Running BuildTools.jar..."
    cd /spigot_build || exit 2
    java -Xmx1024m -jar BuildTools.jar
    echo "Done!"

    exit 0
}

# Moves built Spigot jar to $SPIGOT_HOME
function move_spigot {
    echo "Moving Spigot server jar..."
    mv /spigot_build/spigot-*.jar "$SPIGOT_HOME"
    echo "Done!"

    exit 0
}

# Deletes leftover Spigot build tools and files
function delete_build_directory {
    echo "Deleting Build Tools directory..."
    rm -r /spigot_build
    echo "Done!"

    exit 0
}

prepare_build_directory
configure_git_crlf
download_build_tools
execute_build_tools
move_spigot
delete_build_directory

exit 0

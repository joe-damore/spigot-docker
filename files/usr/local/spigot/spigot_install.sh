#!/usr/bin/env bash

cd "$SPIGOT_HOME" || exit 1

# Creates the /spigot_build directory if it does
# not already exist
function prepare_build_directory {
    echo "Preparing build directory..."
    if [ ! -d /spigot_build ]
    then
        mkdir -p /spigot_build
    fi
    echo "Done!"
}

# Unset git core.autocrlf property, as per Spigot's build documentation
function configure_git_crlf {
    echo "Configuring git..."
    git config --global --unset core.autocrlf
    echo "Done!"
}

# Downloads the Spigot build tools to /spigot_build
function download_build_tools {
    # Latest buildtools URL comes from https://www.spigotmc.org/wiki/buildtools/
    build_tools_url="https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar"

    echo "Downloading BuildTools.jar..."
    wget "$build_tools_url" -O /spigot_build/BuildTools.jar
    echo "Done!"
}

# Runs Spigot build tools
function execute_build_tools {
    echo "Running BuildTools.jar..."
    cd /spigot_build || exit 2
    java -Xmx1024m -jar BuildTools.jar --rev "$SPIGOT_VER"
    echo "Done!"
}

# Moves built Spigot jar to $SPIGOT_HOME
function move_spigot {
    echo "Moving Spigot server jar..."
    mv /spigot_build/spigot-*.jar "$SPIGOT_HOME"
    echo "Done!"
}

# Deletes leftover Spigot build tools and files
function delete_build_directory {
    echo "Deleting Build Tools directory..."
    rm -r /spigot_build
    echo "Done!"
}

prepare_build_directory
configure_git_crlf
download_build_tools
execute_build_tools
move_spigot
delete_build_directory

exit 0

#!/usr/bin/env bash

cd "$SPIGOT_HOME"

function download_build_tools {

    # Create build directory if it does not already exist
    if [ ! -d /spigot_build ]
    then
        mkdir -p /spigot_build
    fi

    # Latest buildtools URL comes from https://www.spigotmc.org/wiki/buildtools/
    wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar -O /spigot_build/BuildTools.jar

    cd /spigot_build
    java -jar BuildTools.jar

    mv /spigot_build/spigot-*.jar "$SPIGOT_HOME"
}

function delete_build_tools {

}

echo "Downloading and building..."

download_build_tools
delete_build_tools

exit 0

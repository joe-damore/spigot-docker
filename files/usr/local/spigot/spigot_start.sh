#!/usr/bin/env bash

cd "$SPIGOT_HOME" || exit 1

spigot_version=$(/bin/bash /usr/local/spigot/spigot_version.sh)

if [ "$spigot_version" = "NONE" ]
then
    echo "Unable to start Spigot: Spigot is not installed."
    exit 2
fi

spigot_jar="spigot-$spigot_version.jar"

java -Xms1G -Xmx2G -XX:+UseConcMarkSweepGC -jar "$spigot_jar"
wait

exit 0

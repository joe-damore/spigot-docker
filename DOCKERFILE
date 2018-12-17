# OpenJDK on Debian Stretch
FROM openjdk:8-jdk

# Copy files
COPY files /

# Update apt-get cache, upgrade OS,
# install wget and git, and add a Minecraft
# user account, and enable Spigot service
RUN apt-get update && \
    apt-get -y dist-upgrade && \
    apt-get install -y wget git && \
    /usr/sbin/useradd -s /bin/bash -d /minecraft -m minecraft && \
    apt-get clean all && \
    systemctl enable spigot

# Expose Minecraft server port
EXPOSE 25565

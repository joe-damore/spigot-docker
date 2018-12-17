# OpenJDK on Alpine Linux
FROM openjdk:8-jdk-alpine

# Copy files
COPY files /

# Update apt-get cache, upgrade OS,
# install wget and git, and add a Minecraft
# user account
RUN apt-get update && \
    apt-get -y dist-upgrade && \
    apt-get install -y wget git && \
    /usr/sbin/useradd -s /bin/bash -d /minecraft -m minecraft && \
    apt-get clean all

# Expose Minecraft server port
EXPOSE 25565

# OpenJDK on Alpine Linux
FROM openjdk:8-jdk-alpine

# Copy files
COPY files /

# Install wget and git
RUN apk add --no-cache wget git

# Add user
RUN adduser -D -h /spigot spigot

# Expose Minecraft server port
EXPOSE 25565

FROM alpine:3.8

# Copy files
COPY files /

# Set environment variables
ENV SPIGOT_HOME=/spigot \
    SPIGOT_WORLD=/spigot_world \
    SPIGOT_WORLD_INSTALL=/spigot_world_install \
    SPIGOT_CONFIG=/spigot_config \
    SPIGOT_VER=latest \
    SPIGOT_EULA=true

# Install dependencies
# TODO Analyze and delete unnecessary dependencies.
RUN apk upgrade --update && \
    apk add --no-cache wget curl ca-certificates openssl git && \
    apk add --no-cache dumb-init util-linux bash screen && \
    update-ca-certificates

# Install Java
RUN apk add --no-cache openjdk8-jre

# Add user
RUN adduser -D -h /spigot spigot

# Make scripts executable
RUN chmod +x /usr/local/bin/spigot-server
RUN chmod -R +x /usr/local/spigot

# Expose Minecraft server port
EXPOSE 25565

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["/usr/local/bin/spigot-server", "start"]

FROM alpine:3.8

# Copy files
COPY files /

# Install dependencies
RUN apk upgrade --update && \
    apk add --no-cache wget curl ca-certificates openssl git && \
    apk add --no-cache dumb-init util-linux bash screen && \
    update-ca-certificates

# Install Java
RUN apk add --no-cache openjdk8-jre

# Add user
RUN adduser -D -h /spigot spigot

# Expose Minecraft server port
EXPOSE 25565

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["/usr/local/bin/spigot-server", "start"]

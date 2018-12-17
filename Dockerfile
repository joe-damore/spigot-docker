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

# Make scripts executable
RUN ["chmod", "+x", "/usr/local/bin/spigot-server"]
RUN ["chmod", "+x", "/usr/local/spigot/spigot_eula.sh"]
RUN ["chmod", "+x", "/usr/local/spigot/spigot_install.sh"]
RUN ["chmod", "+x", "/usr/local/spigot/spigot_install_status.sh"]
RUN ["chmod", "+x", "/usr/local/spigot/spigot_log.sh"]
RUN ["chmod", "+x", "/usr/local/spigot/spigot_pid.sh"]
RUN ["chmod", "+x", "/usr/local/spigot/spigot_restart.sh"]
RUN ["chmod", "+x", "/usr/local/spigot/spigot_send.sh"]
RUN ["chmod", "+x", "/usr/local/spigot/spigot_start.sh"]
RUN ["chmod", "+x", "/usr/local/spigot/spigot_status.sh"]
RUN ["chmod", "+x", "/usr/local/spigot/spigot_stop.sh"]
RUN ["chmod", "+x", "/usr/local/spigot/spigot_uninstall.sh"]
RUN ["chmod", "+x", "/usr/local/spigot/spigot_update.sh"]

# Expose Minecraft server port
EXPOSE 25565

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["/usr/local/bin/spigot-server", "start"]

FROM        --platform=$TARGETOS/$TARGETARCH node:20-bookworm-slim

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

# Install necessary packages
RUN         apt update \
            && apt -y install ffmpeg iproute2 git sqlite3 libsqlite3-dev python3 python3-dev ca-certificates dnsutils tzdata zip tar curl build-essential libtool iputils-ping libnss3 tini \
            && useradd -m -d /home/container container

# Install Bun and set PATH for all users
RUN         curl -fsSL https://bun.sh/install | bash \
            && echo 'export PATH="/root/.bun/bin:$PATH"' >> /etc/profile \
            && echo 'export PATH="/root/.bun/bin:$PATH"' >> /home/container/.bashrc

# Verify Bun installation
RUN         /root/.bun/bin/bun --version

# Install npm and other global packages
RUN         npm install npm@latest typescript ts-node @types/node --location=global

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

STOPSIGNAL SIGINT

# Copy and set permissions for the entrypoint script
COPY        --chown=container:container ./../entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh

ENTRYPOINT  ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]


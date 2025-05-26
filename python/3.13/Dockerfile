FROM        --platform=$TARGETOS/$TARGETARCH python:3.13-slim-bookworm

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

RUN         apt update \
            && apt -y install git gcc g++ ca-certificates dnsutils curl iproute2 ffmpeg procps tini \
            && curl -fsSL https://pkgs.tailscale.com/stable/debian/bookworm.gpg | tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null \
            && curl -fsSL https://pkgs.tailscale.com/stable/debian/bookworm.list | tee /etc/apt/sources.list.d/tailscale.list \
            && apt update \
            && apt -y install tailscale \
            && useradd -m -d /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

STOPSIGNAL SIGINT

COPY        --chown=container:container ./../entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]

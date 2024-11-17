FROM        --platform=$TARGETOS/$TARGETARCH  python:3.11-slim-bookworm

LABEL       author="Michael A" maintainer="parker@pterodactyl.io"

RUN apt update && apt install -y wget apt-transport-https gpg
RUN wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | gpg --dearmor | tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null
RUN echo "deb https://packages.adoptium.net/artifactory/deb $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | tee /etc/apt/sources.list.d/adoptium.list
RUN         apt update \
            && apt -y install git gcc g++ temurin-21-jdk ca-certificates dnsutils curl iproute2 ffmpeg procps tini \
            && useradd -m -d /home/container container

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install requests certifi install-jdk

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

STOPSIGNAL SIGINT

COPY        --chown=container:container ./../entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]

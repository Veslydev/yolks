FROM        --platform=$TARGETOS/$TARGETARCH eclipse-temurin:21-jdk-jammy

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

LABEL       org.opencontainers.image.source="https://github.com/pterodactyl/yolks"
LABEL       org.opencontainers.image.licenses=MIT

RUN         apt update -y \
            && apt install -y \
                curl \
                lsof \
                ca-certificates \
                openssl \
                git \
                tar \
                sqlite3 \
                fontconfig \
                tzdata \
                iproute2 \
                libfreetype6 \
                tini \
				zip \
				unzip \
	            masscan \
			    sudo \
	            libpcap-dev 

RUN wget -O /usr/local/bin/su-exec https://github.com/ncopa/su-exec/releases/download/v0.2/su-exec

# Make it executable
RUN chmod +x /usr/local/bin/su-exec


## Setup user and working directory
RUN useradd -m -d /home/container -s /bin/bash container \
    && echo 'container ALL=(ALL) NOPASSWD: /usr/bin/masscan' >> /etc/sudoers
USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

STOPSIGNAL SIGINT

COPY        --chown=container:container ./../entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]

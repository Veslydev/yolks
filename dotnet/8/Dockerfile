FROM        --platform=$TARGETOS/$TARGETARCH ghcr.io/parkervcp/yolks:debian

LABEL       author="Torsten Widmann" maintainer="info@goover.de"

ENV         DEBIAN_FRONTEND=noninteractive

# Added chromium and fonts to the apt install list
RUN         apt update -y \
            && apt upgrade -y \
            && apt install -y apt-transport-https wget curl iproute2 libgdiplus tini python3 python3-pip python3-venv \
            # CHROMIUM ADDITIONS START
            chromium fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 \
            libnspr4 libnss3 lsb-release xdg-utils libxss1 libgbm1 \
            # CHROMIUM ADDITIONS END
            && wget https://dot.net/v1/dotnet-install.sh \
            && D_V="$(curl -sSL https://dotnet.microsoft.com/en-us/download/dotnet/8.0 | grep -i  '<h3 id="sdk-8.*">SDK 8.*.*</h3>'  | head -1 | awk -F\" '{print $3}' | awk '{print $2;}' | sed 's/<\/h3>//g')" \ 
            && chmod +x dotnet-install.sh \
			&& ./dotnet-install.sh -i /usr/share -v $D_V \
            && ln -s /usr/share/dotnet /usr/bin/dotnet

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

# Tell Puppeteer to use the installed Chromium instead of downloading its own
ENV         PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV         PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

STOPSIGNAL SIGINT

COPY        --chown=container:container ./../entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]

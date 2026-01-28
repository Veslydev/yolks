FROM        --platform=$TARGETOS/$TARGETARCH ghcr.io/parkervcp/yolks:debian

LABEL       author="Torsten Widmann" maintainer="info@goover.de"

ENV         DEBIAN_FRONTEND=noninteractive

# 1. Install Python, Basic Tools, and Playwright Dependencies
RUN         apt update -y \
            && apt upgrade -y \
            && apt install -y apt-transport-https wget curl iproute2 libgdiplus tini python3 python3-pip python3-venv \
            && wget https://dot.net/v1/dotnet-install.sh \
            # --- DOTNET 9 UPDATE START ---
            # Updated URL to /dotnet/9.0 and grep pattern to sdk-9.*
            && D_V="$(curl -sSL https://dotnet.microsoft.com/en-us/download/dotnet/9.0 | grep -i  '<h3 id="sdk-9.*">SDK 9.*.*</h3>'  | head -1 | awk -F\" '{print $3}' | awk '{print $2;}' | sed 's/<\/h3>//g')" \ 
            # --- DOTNET 9 UPDATE END ---
            && chmod +x dotnet-install.sh \
			&& ./dotnet-install.sh -i /usr/share -v $D_V \
            && ln -s /usr/share/dotnet /usr/bin/dotnet

# 2. Set Playwright Environment Variables
# This ensures browsers are installed globally in /usr/local/share
ENV         PLAYWRIGHT_BROWSERS_PATH=/usr/local/share/playwright

# 3. Install Playwright and Browsers
# We install the library, then download the browsers, then install OS dependencies
RUN         pip3 install playwright --break-system-packages \
            && playwright install chromium \
            && playwright install-deps chromium

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

STOPSIGNAL SIGINT

COPY        --chown=container:container ./../entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT    ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]

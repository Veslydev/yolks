FROM        --platform=$TARGETOS/$TARGETARCH ghcr.io/parkervcp/yolks:debian
LABEL       author="Torsten Widmann" maintainer="info@goover.de"
ENV         DEBIAN_FRONTEND=noninteractive

# 1. Install Python, Basic Tools, and Playwright Dependencies
RUN         apt update -y \
            && apt upgrade -y \
            && apt install -y apt-transport-https wget curl unzip iproute2 libgdiplus tini python3 python3-pip python3-venv \
            # Download the installer script
            && wget https://dot.net/v1/dotnet-install.sh \
            && chmod +x dotnet-install.sh \
            # --- INSTALL DOTNET 9 ---
            && ./dotnet-install.sh --channel 9.0 --install-dir /usr/share/dotnet \
            # --- INSTALL DOTNET 8 ---
            && ./dotnet-install.sh --channel 8.0 --install-dir /usr/share/dotnet \
            # Create the symlink (only needed once)
            && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet

# 2. Install Bun globally (as root, so it's available system-wide)
ENV         BUN_INSTALL=/usr/local
RUN         curl -fsSL https://bun.sh/install | bash \
            && ln -sf /usr/local/bin/bun /usr/bin/bun

# 3. Set Playwright Environment Variables
ENV         PLAYWRIGHT_BROWSERS_PATH=/usr/local/share/playwright

# 4. Install Playwright and Browsers
RUN         pip3 install playwright --break-system-packages \
            && playwright install chromium \
            && playwright install-deps chromium

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container
STOPSIGNAL  SIGINT
COPY        --chown=container:container ./../entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT  ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]

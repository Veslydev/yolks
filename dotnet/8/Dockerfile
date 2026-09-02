ARG         TARGETOS
ARG         TARGETARCH

FROM        --platform=$TARGETOS/$TARGETARCH ghcr.io/luau-lang/lute:bin-1.0.0 AS lute

FROM        --platform=$TARGETOS/$TARGETARCH ghcr.io/parkervcp/yolks:debian
LABEL       author="Torsten Widmann" maintainer="info@goover.de"
ENV         DEBIAN_FRONTEND=noninteractive
ARG         TARGETARCH
ARG         LUNE_VERSION=0.10.4
ARG         PLAYWRIGHT_VERSION=1.62.0

# 1. Install Python, Lua 5.1, and base dependencies.
RUN         apt update -y \
            && apt install -y --no-install-recommends apt-transport-https ca-certificates wget curl unzip iproute2 libgdiplus tini python3 python3-pip python3-venv lua5.1 \
            # Download the installer script
            && wget https://dot.net/v1/dotnet-install.sh \
            && chmod +x dotnet-install.sh \
            # --- INSTALL DOTNET 9 ---
            && ./dotnet-install.sh --channel 9.0 --install-dir /usr/share/dotnet \
            # --- INSTALL DOTNET 8 ---
            && ./dotnet-install.sh --channel 8.0 --install-dir /usr/share/dotnet \
            # Create the symlink (only needed once)
            && ln -sf /usr/share/dotnet/dotnet /usr/bin/dotnet \
            && rm -f dotnet-install.sh

ENV         DOTNET_ROOT=/usr/share/dotnet

# 2. Install Bun globally (as root, so it's available system-wide)
ENV         BUN_INSTALL=/usr/local
RUN         curl -fsSL https://bun.sh/install | bash \
            && ln -sf /usr/local/bin/bun /usr/bin/bun

# 3. Install the Luau runtimes required by the Linux logenv wrappers.
COPY        --from=lute /lute /usr/local/bin/lute
RUN         set -eux; \
            case "${TARGETARCH}" in \
                amd64) LUNE_ARCH=x86_64 ;; \
                arm64) LUNE_ARCH=aarch64 ;; \
                *) echo "Unsupported Lune architecture: ${TARGETARCH}" >&2; exit 1 ;; \
            esac; \
            curl -fsSL "https://github.com/lune-org/lune/releases/download/v${LUNE_VERSION}/lune-${LUNE_VERSION}-linux-${LUNE_ARCH}.zip" -o /tmp/lune.zip; \
            unzip -q /tmp/lune.zip -d /tmp/lune; \
            install -m 0755 /tmp/lune/lune /usr/local/bin/lune; \
            rm -rf /tmp/lune /tmp/lune.zip; \
            lune --version; \
            lute --version

# 4. Install a Playwright release and its matching Chromium cache together.
ENV         PLAYWRIGHT_BROWSERS_PATH=/usr/local/share/playwright
RUN         pip3 install --no-cache-dir "playwright==${PLAYWRIGHT_VERSION}" --break-system-packages \
            && python3 -m playwright install --with-deps chromium \
            && chown -R container:container "${PLAYWRIGHT_BROWSERS_PATH}"

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container
STOPSIGNAL  SIGINT
COPY        --chown=container:container ./../entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh
ENTRYPOINT  ["/usr/bin/tini", "-g", "--"]
CMD         ["/entrypoint.sh"]

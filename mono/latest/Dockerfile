FROM        --platform=$TARGETOS/$TARGETARCH ghcr.io/parkervcp/yolks:debian

LABEL       author="Torsten Widmann" maintainer="support@goover.de"

# Base updates
RUN         apt update \
            && apt -y upgrade
RUN         apt install -y fontconfig dirmngr tzdata iptables nftables ipset sudo tar ffmpeg net-tools iproute2 libcap2-bin
# Install ICU libraries for better internationalization support
RUN         apt install -y libicu-dev
RUN         apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN         sh -c 'echo "deb https://download.mono-project.com/repo/debian stable-buster main" > /etc/apt/sources.list.d/mono-official-stable.list'
RUN         apt update
RUN         apt install -y mono-complete

# Set timezone to Turkey/Istanbul (equivalent to Turkey Standard Time)
RUN         ln -sf /usr/share/zoneinfo/Europe/Istanbul /etc/localtime \
            && echo "Europe/Istanbul" > /etc/timezone

# Allow non-root to manage nft/iptables when container has NET_ADMIN capability
# Note: Docker/Wings must still grant --cap-add=NET_ADMIN or these will be masked by the bounding set.
RUN         for b in \
                /usr/sbin/nft \
                /usr/sbin/iptables \
                /usr/sbin/iptables-nft \
                /usr/sbin/xtables-nft-multi \
                /usr/sbin/iptables-legacy \
                /usr/sbin/xtables-legacy-multi \
                /usr/sbin/ip6tables \
                /usr/sbin/ip6tables-nft \
                /usr/sbin/ip6tables-legacy \
                /usr/sbin/iptables-restore \
                /usr/sbin/ip6tables-restore \
                /usr/sbin/ebtables \
                /usr/sbin/arptables; do \
                if [ -x "$b" ]; then setcap cap_net_admin,cap_net_raw+ep "$b" || true; fi; \
            done

# Create timezone mapping for Mono/.NET to handle Windows timezone names
RUN         cp /usr/share/zoneinfo/Europe/Istanbul "/usr/share/zoneinfo/Turkey Standard Time" \
            && chmod 644 "/usr/share/zoneinfo/Turkey Standard Time" \
            && chown root:root "/usr/share/zoneinfo/Turkey Standard Time" \
            && chmod 755 /usr/share/zoneinfo

# Only install the needed steamcmd packages on the AMD64 build
RUN         if [ "$(uname -m)" = "x86_64" ]; then \
                dpkg --add-architecture i386 && \
                apt update && \
                apt -y install lib32gcc-s1 libsdl2-2.0-0:i386; \
            fi

# Runtime environment
ENV         USER=container HOME=/home/container
ENV         TZ=Europe/Istanbul
ENV         ICU_DATA=/usr/share/icu
ENV         DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false
ENV         MONO_TZ_DATA=/usr/share/zoneinfo

# Sudo shim: avoid failures when no-new-privileges blocks sudo
# This script ignores sudo flags and runs the command as-is.
RUN         printf '%s\n' '#!/bin/sh' \
            '# no-new-privileges is set; run command without elevation' \
            'while [ "${1#-}" != "$1" ]; do' \
            '  case "$1" in' \
            '    -n|-E|-S|-k|-b|-H|-P|-v|-s) shift ;;' \
            '    -u) shift 2 ;;' \
            '    --) shift; break ;;' \
            '    *) shift ;;' \
            '  esac' \
            'done' \
            'exec "$@"' \
            > /usr/local/bin/sudo && chmod +x /usr/local/bin/sudo

# Use root during build/copy; switch to unprivileged user for runtime
USER        root

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh

USER        container

CMD         [ "/bin/bash", "/entrypoint.sh" ]

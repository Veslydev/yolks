FROM        --platform=$TARGETOS/$TARGETARCH ghcr.io/parkervcp/yolks:debian

LABEL       author="Torsten Widmann" maintainer="support@goover.de"

# Base updates
RUN         apt update \
            && apt -y upgrade
RUN         apt install -y fontconfig dirmngr tzdata iptables sudo tar ffmpeg net-tools
# Install ICU libraries for better internationalization support
RUN         apt install -y libicu-dev
RUN         apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN         sh -c 'echo "deb https://download.mono-project.com/repo/debian stable-buster main" > /etc/apt/sources.list.d/mono-official-stable.list'
RUN         apt update
RUN         apt install -y mono-complete

# Set timezone to Turkey/Istanbul (equivalent to Turkey Standard Time)
RUN         ln -sf /usr/share/zoneinfo/Europe/Istanbul /etc/localtime \
            && echo "Europe/Istanbul" > /etc/timezone

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

# Ensure we run entrypoint as root to perform any privileged setup,
# then entrypoint will drop to the unprivileged "container" user.
USER        root

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
RUN         chmod +x /entrypoint.sh

CMD         [ "/bin/bash", "/entrypoint.sh" ]

FROM        --platform=$TARGETOS/$TARGETARCH ghcr.io/parkervcp/yolks:debian

LABEL       author="Torsten Widmann" maintainer="support@goover.de"

RUN         apt update \
            && apt -y upgrade
RUN         apt install -y fontconfig dirmngr tzdata
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
RUN         mkdir -p /usr/share/zoneinfo/Turkey\ Standard\ Time \
            && cp /usr/share/zoneinfo/Europe/Istanbul /usr/share/zoneinfo/Turkey\ Standard\ Time/Turkey\ Standard\ Time

# Alternative: Create a symbolic link for the Windows timezone name
RUN         ln -sf /usr/share/zoneinfo/Europe/Istanbul "/usr/share/zoneinfo/Turkey Standard Time"

# Only install the needed steamcmd packages on the AMD64 build
RUN         if [ "$(uname -m)" = "x86_64" ]; then \
                dpkg --add-architecture i386 && \
                apt update && \
                apt -y install lib32gcc-s1 libsdl2-2.0-0:i386; \
            fi


USER        container
ENV         USER=container HOME=/home/container
ENV         TZ=Europe/Istanbul
# Set ICU timezone data location for better .NET timezone support
ENV         ICU_DATA=/usr/share/icu
ENV         DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]

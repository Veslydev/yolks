#!/bin/bash
cd /home/container

# Set environment variable that holds the Internal Docker IP
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# set this variable, dotnet needs it.
export DOTNET_ROOT=/usr/share/

# --- BUN ADDITIONS START ---
# Print Bun version
printf "\033[1m\033[33mcontainer@pelican~ \033[0mbun --version\n"
bun --version

# Check for package.json and install dependencies if it exists
if [ -f "./package.json" ]; then
    printf "\033[1m\033[33mcontainer@pelican~ \033[0mbun install\n"
    bun install
fi
# --- BUN ADDITIONS END ---

# --- PYTHON ADDITIONS START ---
# Print python version
printf "\033[1m\033[33mcontainer@pelican~ \033[0mpython3 --version\n"
python3 --version

# Check for requirements.txt and install dependencies if it exists
if [ -f "./requirements.txt" ]; then
    printf "\033[1m\033[33mcontainer@pelican~ \033[0mpip install -r requirements.txt\n"
    pip install --user -r requirements.txt
fi
# --- PYTHON ADDITIONS END ---

# Print the dotnet version on startup
printf "\033[1m\033[33mcontainer@pelican~ \033[0mdotnet --version\n"
dotnet --version

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}

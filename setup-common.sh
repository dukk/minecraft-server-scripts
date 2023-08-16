#!/usr/bin/bash

TEMPLATE_DIR="./templates"

# Update Software
apt update
apt upgrade

# Install Software
apt install software-properties-common
apt install openjdk-19-jre-headless

# Setup User + Group
groupadd -r minecraft
useradd -r -g minecraft -d "/home/minecraft" -m -s "/bin/bash" minecraft

# Create Directories
mkdir -p /home/minecraft/downloads
mkdir -p /opt/{minecraft,minecraft-proxy}
#mkdir -p /opt/{minecraft,minecraft-proxy,minecraft-bedrock}

# Copy Template Files
cp -R $TEMPLATE_DIR/etc/systemd/system/* /etc/systemd/system
cp -R $TEMPLATE_DIR/home/minecraft/* /home/minecraft
cp -R $TEMPLATE_DIR/opt/*.sh /opt/

# Execute Scripts
/opt/fix-all.sh
/home/minecraft/downloads/download-servers.sh
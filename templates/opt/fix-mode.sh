#!/usr/bin/sh

find /opt/minecraft -type d -exec chmod 775 '{}' \;
find /opt/minecraft -type f -exec chmod 664 '{}' \;
find /opt/minecraft/*/server/*.sh -type f -exec chmod +x '{}' \;

find /opt/minecraft-proxy -type d -exec chmod 775 '{}' \;
find /opt/minecraft-proxy -type f -exec chmod 664 '{}' \;
find /opt/minecraft-proxy/server/*.sh -type f -exec chmod +x '{}' \;
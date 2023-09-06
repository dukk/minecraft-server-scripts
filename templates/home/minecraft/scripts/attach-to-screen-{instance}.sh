#!/usr/bin/bash
# Replace {instance} with the instance name

sudo su minecraft

echo Attaching to screen, press 'ctrl + a + d' to detach
sleep 3s
screen -r minecraft-{instance}
exit
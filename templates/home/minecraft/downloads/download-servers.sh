#!/usr/bin/bash

DOWNLOAD_DIR="/home/minecraft/downloads"

wget https://api.papermc.io/v2/projects/paper/versions/1.20.1/builds/125/downloads/paper-1.20.1-125.jar $DOWNLOAD_DIR
wget https://api.papermc.io/v2/projects/velocity/versions/3.2.0-SNAPSHOT/builds/263/downloads/velocity-3.2.0-SNAPSHOT-263.jar $DOWNLOAD_DIR
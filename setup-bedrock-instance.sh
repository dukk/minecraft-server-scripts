#!/usr/bin/bash

INSTANCE_NAME=$1
TEMPLATE_DIR="./templates"

mkdir -p /opt/minecraft-bedrock/$INSTANCE_NAME/{server,backup}
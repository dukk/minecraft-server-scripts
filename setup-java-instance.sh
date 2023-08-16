#!/usr/bin/bash

INSTANCE_NAME=$1
TEMPLATE_DIR="./templates"

mkdir -p /opt/minecraft/$INSTANCE_NAME/{server,backup}
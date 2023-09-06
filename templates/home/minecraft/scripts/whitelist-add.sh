#!/usr/bin/bash

echo Adding to lobby
screen -p 0 -S minecraft-lobby -X eval 'stuff "whitelist add $1"\\015'
echo Adding to survival
screen -p 0 -S minecraft-survival -X eval 'stuff "whitelist add $1"\\015'
echo Adding to creative
screen -p 0 -S minecraft-creative -X eval 'stuff "whitelist add $1"\\015'
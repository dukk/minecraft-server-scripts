# Minecraft Server Scripts

## Summary

I finally got tired of re-writing these scripts every time I setup a Minecraft server.

I'm sure there are better ways to do a lot of this, but this is what's working for me at the moment.

## How to setup a new server

1. Install Ubuntu server.
2. Download the scripts: `wget ...TBD... ~/`
3. Extract the scripts to your home directory: `tar zxvf dukk-mcss_*_tgz -C ~/dukk-mcss`
4. Run `./dukk-mcss/setup.sh`
5. Follow the prompts.

## Script Details

### Setup

### Backup

#### Backup all minecraft instances

`/opt/minecraft/backup-all.sh`

#### Backup a single instance

`/opt/minecraft/%i/server/backup.sh`

### Troubleshooting

These scripts are for solving some of the common problems that can come up if you start messing with things.

#### Fix file modes for all Minecraft instances

`/opt/minecraft/fix-mode.sh`

#### Fix file owner for all Minecraft instances

`/opt/minecraft/fix-owner.sh`

#### Fix file modes and owner for all minecraft instances

`/opt/minecraft/fix-all.sh`

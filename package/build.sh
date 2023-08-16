#!/usr/bin/bash

SOURCE_PATH="$(dirname "`pwd`")"
PACKAGE_FILE="dukk-mcss_${`date "+%Y-%m-%d_%s"`}}.tgz"

tar -C "$SOURCE_PATH" \
    --exclude="package" \
    --exclude="*.md" \
    --exclude=".*" \
    -zcf "$PACKAGE_FILE" .
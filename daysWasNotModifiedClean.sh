#!/usr/bin/env bash

BUILDS_DIR_ROOT="/builds"
DAYS_WAS_NOT_MODIFIED=30

echo "[x] Cleaning started at $(date)"


for BUILD_DIR in $(ls $BUILDS_DIR_ROOT);
do
        find "$BUILDS_DIR_ROOT/$BUILD_DIR" -mindepth 1 -maxdepth 1 -type d -mtime +"$DAYS_WAS_NOT_MODIFIED" -exec rm -rvf {} \;
done

echo "[x] Cleaning stopped"
echo ""

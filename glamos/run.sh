#!/usr/bin/env bash
set -e
CONFIG_PATH=/data/options.json

HA_PORT=$(jq --raw-output '.ha_port // empty' $CONFIG_PATH)

rm -rf ./build/env-config.js
touch ./build/env-config.js
echo "window._env_ = { port: ${HA_PORT} }" >> ./build/env-config.js

nginx -g 'daemon off;'
error_log '/dev/stdout debug;'
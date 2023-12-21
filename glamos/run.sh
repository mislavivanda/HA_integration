#!/usr/bin/env bash
set -e

# lshw -class cpu
# lshw -class processor
# cat /proc/cpuinfo
# echo "Command 2"
# echo "Command 3"
# lshw | grep "uuid"
# lshw | grep "serial"
# # echo "Command 4"
# cat /proc/cpuinfo | grep "Serial"
# # echo "Command1"
# cpuid | grep "processor serial number:"

# cat /sys/class/dmi/id/product_uuid
# ls
# ls /var/lib
# ls /etc
# cat /var/lib/dbus/machine-id
# hostnamectl

whoami

ls -la /var/lib/nginx/tmp /var/lib/nginx/logs

CONFIG_PATH=/data/options.json

HA_PORT=$(jq --raw-output '.ha_port // empty' $CONFIG_PATH)

rm -rf ./build/env-config.js
touch ./build/env-config.js
echo "window._env_ = { port: ${HA_PORT} }" >> ./build/env-config.js

# chmod -R u=rwx /var/lib/nginx
# chmod -R g=rwx /var/lib/nginx
# chmod -R o=rwx /var/lib/nginx
# setenforce 0
nginx -g 'daemon off;'
error_log '/dev/stdout debug;'
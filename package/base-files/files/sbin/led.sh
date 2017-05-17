#!/bin/sh
# (C) 2008 openwrt.org

. /lib/functions.sh
ACTION=$1
NAME="$2"
do_led() {
        local name
        local sysfs
        config_get name $1 name
        config_get sysfs $1 sysfs

    if [ -z "$NAME" -o "$name" == "$NAME" -o "$sysfs" = "$NAME" ] && [ -n "${sysfs}" -a -e "/sys/class/leds/${sysfs}" ];then
        [ "$ACTION" == "set" ] &&
                echo 1 >/sys/class/leds/${sysfs}/brightness \
                || echo 0 >/sys/class/leds/${sysfs}/brightness
        [ -z "$NAME" ] && return || exit 0
    fi
}

usage() {

    echo "-- usage : $1 <set|clear> [name]"
    exit 2
}

if [ "$1" == "clear" -o "$1" == "set" ];then
        config_load system
        config_foreach do_led
        exit 1
else
    usage
fi

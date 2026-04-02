#!/usr/bin/env bash

# Script for monitoring system resources
CPU=$(awk '/^cpu / {u=$2+$4; t=$2+$4+$5; if (p) {printf "%.0f", (u-pu)*100/(t-pt)} pu=u; pt=t; p=1 }' <(grep '^cpu ' /proc/stat) <(sleep 0.5; grep '^cpu ' /proc/stat))
RAM=$(free -m | awk '/Mem:/ {printf "%d", $3*100/$2 }')
DISK=$(df / | awk 'NR==2 {gsub("%",""); print $5}')

BRIGHTNESS=$(brightnessctl get)
MAXBRIGHTNESS=$(brightnessctl max)
BRIGHTNESSVALUE=$((BRIGHTNESS * 100 / MAXBRIGHTNESS))

TOOLTIP="  <b><i>CPU usage</i>:</b> <span color='#a8c5da'>${CPU}%</span>\n  <b><i>RAM usage</i>:</b> <span color='#a8c5da'>${RAM}%</span>\n  <b><i>Disk usage</i>:</b> <span color='#a8c5da'>${DISK}%</span>\n  <b><i>Brightness</i>:</b> <span color='#a8c5da'>${BRIGHTNESSVALUE}%</span>"
printf '{"tooltip":"%s"}\n' "$TOOLTIP"
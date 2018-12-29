#!/bin/sh

PVPN_STATUS=$(sudo pvpn status)
OPENVPN_STATUS=$(echo "$PVPN_STATUS" | egrep '\[OpenVPN Status\]:\s[A-Za-z]+' | awk -F ':' '{print $2}')
INTERNET_STATUS=$(echo "$PVPN_STATUS" | egrep '\[Internet Status\]:\s[A-Za-z]+' | awk -F ':' '{print $2}')

if [[ "$OPENVPN_STATUS" == *"Not"* || "$INTERNET_STATUS" == *"Offline"* ]]; then
  echo "%{F#ff5555}"
else
  echo "%{F#20c20e}"
fi


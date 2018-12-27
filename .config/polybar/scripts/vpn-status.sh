#!/bin/sh

PVPN_STATUS=$(sudo pvpn status)
OPENVPN_STATUS=$(echo "$PVPN_STATUS" | egrep '\[OpenVPN Status\]:\s[A-Za-z]+' | awk '{print $NF}')
INTERNET_STATUS=$(echo "$PVPN_STATUS" | egrep '\[Internet Status\]:\s[A-Za-z]+' | awk '{print $NF}')

if [ "$OPENVPN_STATUS" = "Running" -a "$INTERNET_STATUS" = "Online" ]; then
  echo "%{F#20c20e}"
else
  echo "%{F#ff5555}"
fi


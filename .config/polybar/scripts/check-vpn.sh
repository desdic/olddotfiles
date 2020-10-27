#!/sbin/bash

MIRROR=$(dig +short mirror.one.com|egrep -v '\.$')
DEV=$(ip -j r get ${MIRROR} | jq -r  '.[].dev')

if [ "${DEV}" == "tun0" ]; then
  if nc -vz -w2 mirror.one.com 80  2>/dev/null
  then
    if ping -c1 aptproxy1.prv.webpod5-cph3.one.com 2>/dev/null >&2 || ping -c1 aptproxy1.prv.webpod8-cph3.one.com 2>/dev/null >&2
    then
      echo "%{F#FFFFFF}VPN%{B-}%{F-}"
      exit 0
    fi
  fi
fi

echo ""

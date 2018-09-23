#!/bin/bash

# lighttpd
/usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf &

RECEIVER_OPTIONS="--device-index 0 --gain -10 --ppm 0 --net-bo-port 30005"
DECODER_OPTIONS="--max-range 360"
NET_OPTIONS="--net --net-heartbeat 60 --net-ro-size 1000 --net-ro-interval 1 --net-ri-port 0 --net-ro-port 30002 --net-sbs-port 30003 --net-bi-port 30004,30104 --net-bo-port 30005"
JSON_OPTIONS="--json-location-accuracy 1"

/usr/bin/dump1090-fa $RECEIVER_OPTIONS $DECODER_OPTIONS $NET_OPTIONS $JSON_OPTIONS $PIAWARE_DUMP1090_LOCATION_OPTIONS --write-json /run/dump1090-fa --quiet

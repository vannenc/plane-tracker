#!/bin/bash

# lighttpd
/usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf &

/root/dump1090/dump1090 --net --net-http-port 8880 --net-sbs-port 30003 --lat 52.5725 --lon 0.2392 --write-json /run/dump1090-mutability/ 


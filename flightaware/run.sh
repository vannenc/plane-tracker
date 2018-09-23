#!/bin/bash

sudo docker stop faware_vannen && sudo docker rm piaware_vannen
sudo docker run --rm -v $PWD/piaware.conf:/etc/piaware.conf \
--mac-address 02:42:ac:11:00:03  --privileged \
-p 8082:8080 --name faware_vannen -d vannen/flightaware
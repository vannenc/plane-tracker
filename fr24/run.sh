#!/bin/bash

sudo docker stop fr24 && sudo docker rm fr24
sudo docker run --rm -v $PWD/fr24feed.ini:/etc/fr24feed.ini \
--mac-address 02:42:ac:11:00:01  --privileged -p 8754:8754 \
-p 8081:8080 --name fr24vannen -d vannenc/fr24
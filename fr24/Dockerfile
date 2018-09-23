FROM resin/rpi-raspbian:stretch
WORKDIR /root/fr24
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    cmake \
    git \
    git-core \
    libusb-1.0-0-dev \
    pkg-config \
    wget dirmngr curl nano tmux apt-utils iputils-ping

COPY fr24feed_1.0.18-9_armhf.deb .
RUN dpkg -i fr24feed_1.0.18-9_armhf.deb
ENTRYPOINT ["fr24feed"]
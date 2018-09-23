FROM resin/rpi-raspbian:stretch
ENTRYPOINT []

WORKDIR /root

RUN apt-get update -qy && apt-get install --no-install-recommends -qy wget
RUN wget http://flightaware.com/adsb/piaware/files/packages/pool/piaware/p/piaware-support/piaware-repository_3.6.3_all.deb
RUN sudo dpkg -i piaware-repository_3.6.3_all.deb

RUN apt-get update -qy \
 && apt-get install --no-install-recommends -qy \
    apt-utils \
    git-core \
    git \
    cmake \
    libusb-1.0.0-dev \
    build-essential \
    lighttpd \
    curl nano \
    pkg-config \
    dump1090-fa

# Dir to store JSON
RUN mkdir -p /run/dump1090-fa

# web overview
EXPOSE 8080

# ports for sharing data
EXPOSE 30003
EXPOSE 30005
EXPOSE 30104


COPY startdump1090.sh startdump1090.sh
RUN chmod 775 startdump1090.sh

# dump1090
CMD ["./startdump1090.sh"]

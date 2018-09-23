FROM resin/rpi-raspbian:stretch
ENTRYPOINT []

WORKDIR /root

RUN apt-get update -qy \
 && apt-get install --no-install-recommends -qy \
    apt-utils \
    git-core \
    git \
    cmake \
    libusb-1.0.0-dev \
    build-essential \
    lighttpd \
    wget curl nano \
    pkg-config && \
    git clone git://git.osmocom.org/rtl-sdr.git \
    && mkdir -p ./rtl-sdr/build \
    && cd /root/rtl-sdr/build \
    && cmake ../ -DINSTALL_UDEV_RULES=ON \
    && make -j 4 \
    && make install \
    && ldconfig \
    && cp /root/rtl-sdr/rtl-sdr.rules /etc/udev/rules.d/ \
    && cd /root \
    && git clone https://github.com/mutability/dump1090 \
    && cd dump1090 \
    && make -j 4 \
    && cd /root \
    && mkdir -p /usr/share/dump1090-mutability/html/ \
    && cp -R dump1090/public_html/* /usr/share/dump1090-mutability/html/ \
    && cp -R dump1090/debian/lighttpd/* /etc/lighttpd/conf-enabled/ \
    && mkdir -p /run/dump1090-mutability/

RUN wget -O /usr/share/dump1090-mutability/html/upintheair.json 'http://www.heywhatsthat.com/api/upintheair.json?id=OO8C62OE&refraction=0.25&alts=100,1000,10000'
# COPY dump1090-mutability_1.14_armhf.deb .
# RUN dpkg -i dump1090-mutability_1.14_armhf.deb
COPY lighttpd.conf /etc/lighttpd/lighttpd.conf
RUN chown www-data:www-data /etc/lighttpd/lighttpd.conf

# web overview
EXPOSE 8080

# ports for FlightAware etc
EXPOSE 30003
EXPOSE 30005
EXPOSE 30104

COPY startdump1090.sh /usr/share/dump1090-mutability/startdump1090.sh
RUN chmod 775 /usr/share/dump1090-mutability/startdump1090.sh

# Start lighttp web server and Dump1090
CMD ["/bin/bash", "/usr/share/dump1090-mutability/startdump1090.sh"]



FROM resin/rpi-raspbian:stretch

ENTRYPOINT []

RUN apt-get update && apt-get install -qy wget
RUN wget http://flightaware.com/adsb/piaware/files/packages/pool/piaware/p/piaware-support/piaware-repository_3.6.3_all.deb \
  && dpkg -i piaware-repository_3.6.3_all.deb \
  && apt-get update \
  && apt-get install -qy apt-utils ca-certificates iputils-ping dump1090-fa piaware

RUN piaware-config allow-auto-updates no
RUN piaware-config allow-manual-updates yes

WORKDIR /piaware
EXPOSE 8080

CMD ["piaware", "-debug"]
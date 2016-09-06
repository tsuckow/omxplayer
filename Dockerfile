FROM resin/rpi-raspbian

RUN apt-get update && apt-get install -y build-essential && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /usr/src/omxplayer
WORKDIR /usr/src/omxplayer
COPY . /usr/src/omxplayer

RUN ./prepare-native-raspbian.sh

RUN make ffmpeg
RUN make
RUN make install
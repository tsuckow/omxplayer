FROM resin/rpi-raspbian

RUN apt update && apt install -y build-essential && apt clean

RUN mkdir -p /usr/src/omxplayer
WORKDIR /usr/src/omxplayer
COPY . /usr/src/omxplayer

RUN ./prepare-native-raspbian.sh

RUN make ffmpeg
RUN make
RUN make install
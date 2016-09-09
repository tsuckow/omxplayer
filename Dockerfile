FROM codingwell/rpi-raspbian-omxplayer-buildenv

RUN mkdir -p /usr/src/omxplayer
WORKDIR /usr/src/omxplayer
COPY . /usr/src/omxplayer

RUN ./prepare-native-raspbian.sh

RUN make ffmpeg -j3
RUN make -j3
RUN make dist
FROM codingwell/rpi-raspbian-omxplayer-ffmpeg

RUN [ "cross-build-start" ]

RUN mkdir -p /usr/src/omxplayer
WORKDIR /usr/src/omxplayer
COPY . /usr/src/omxplayer

RUN ./prepare-native-raspbian.sh

RUN mv /usr/src/ffmpeg_compiled /usr/src/omxplayer/ffmpeg_compiled

RUN make -j3
RUN make dist

RUN [ "cross-build-end" ]
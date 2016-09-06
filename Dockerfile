FROM resin/rpi-raspbian

RUN ./prepare-native-raspbian.sh

RUN make ffmpeg
RUN make
RUN make install
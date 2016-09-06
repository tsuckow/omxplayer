FROM resin/rpi-raspbian

RUN apt-get update && apt-get install -y libraspberrypi-dev libraspberrypi0 libraspberrypi-bin build-essential git-core subversion libva1 libpcre3-dev libidn11-dev libboost1.50-dev libfreetype6-dev libusb-1.0-0-dev libdbus-1-dev libssl-dev libssh-dev libsmbclient-dev gcc-4.7 g++-4.7 pkg-config && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /usr/src/omxplayer
WORKDIR /usr/src/omxplayer
COPY . /usr/src/omxplayer

RUN ./prepare-native-raspbian.sh

RUN make ffmpeg
RUN make
RUN make install
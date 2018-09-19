FROM ripl/libbot:latest

# set default LCM_DEFAULT_URL
ENV LCM_DEFAULT_URL "udpm://239.255.76.67:7667?ttl=1"

# set default installation dir
ENV WORKING_DIR "/home"

# install directory
ENV BUILD_PREFIX "/usr/local"


# update apt lists and install system libraries, then clean the apt cache
RUN apt-get update && apt-get install -y \
     net-tools \
     # clean the apt cache
     && rm -rf /var/lib/apt/lists/*

COPY ./ $WORKING_DIR/

# Build timesync
RUN cd $WORKING_DIR && BUILD_PREFIX=$BUILD_PREFIX make

RUN chmod 755 $WORKING_DIR/scripts/run-timesync.sh
CMD $WORKING_DIR/scripts/run-timesync.sh

#!/bin/bash

START_DATE=`date '+%Y%m%d-%H%M%S'`

TIMESYNC_LOG_DIR=/var/log/timesync
TIMESYNC_LOG_FILE=$TIMESYNC_LOG_DIR/timesync.$START_DATE
TIMESYNC_LOG_SYMLINK=/var/log/timesync.log
DAEMON=/usr/local/bin/timesync
OPTS="-v -l $TIMESYNC_LOG_FILE"
PIDDIR=/var/run/timesync
PIDFILE=$PIDDIR/timesync.pid

# Exit if the package is not installed
[ -x "$DAEMON" ] || exit 0


echo "starting timesync..." >&2
mkdir -p $TIMESYNC_LOG_DIR
touch $TIMESYNC_LOG_FILE
if [ -h $TIMESYNC_LOG_SYMLINK ] ; then
    rm $TIMESYNC_LOG_SYMLINK
fi
if [ ! -e $TIMESYNC_LOG_SYMLINK ] ; then
    ln -s $TIMESYNC_LOG_FILE $TIMESYNC_LOG_SYMLINK
fi

if [ ! -d $PIDDIR ] ; then
    mkdir $PIDDIR
fi
chown $USER:$USER $PIDDIR
$DAEMON $OPTS

#!/bin/bash

docker run -d --net=host --privileged -v /var/log:/var/log ripl/timesync:latest

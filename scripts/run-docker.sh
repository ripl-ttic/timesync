#!/bin/bash

docker run -d --privileged -v /var/log:/var/log ripl/timesync:latest

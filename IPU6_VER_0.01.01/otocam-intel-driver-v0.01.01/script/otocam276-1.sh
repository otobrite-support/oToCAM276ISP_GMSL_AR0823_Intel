#!/bin/bash
#set -e
#sudo su
gst-launch-1.0 icamerasrc scene-mode=auto device-name=otocam276-1 io-mode=mmap printfps=true ! 'video/x-raw,format=UYVY,width=3840,height=2160' ! fpsdisplaysink video-sink=glimagesink sync=false

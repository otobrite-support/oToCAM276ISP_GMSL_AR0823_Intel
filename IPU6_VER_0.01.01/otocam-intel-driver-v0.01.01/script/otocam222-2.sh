#!/bin/bash
#set -e
#sudo su
gst-launch-1.0 icamerasrc scene-mode=auto device-name=otocam222-1 io-mode=mmap printfps=true ! 'video/x-raw,format=UYVY,width=1920,height=1280' ! glimagesink sync=false icamerasrc scene-mode=auto device-name=otocam222-2 io-mode=mmap printfps=true ! 'video/x-raw,format=UYVY,width=1920,height=1280' ! glimagesink sync=false

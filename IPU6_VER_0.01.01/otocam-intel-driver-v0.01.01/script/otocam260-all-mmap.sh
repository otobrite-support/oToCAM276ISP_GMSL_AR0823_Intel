#!/bin/bash
#set -e
#sudo su
vblank_mode=1 gst-launch-1.0 icamerasrc scene-mode=auto device-name=otocam260-1 io-mode=mmap printfps=true ! 'video/x-raw,format=UYVY,width=2880,height=1860' !  fpsdisplaysink video-sink=glimagesink sync=false icamerasrc scene-mode=auto device-name=otocam260-2 io-mode=mmap printfps=true ! 'video/x-raw,format=UYVY,width=2880,height=1860' !  fpsdisplaysink video-sink=glimagesink sync=false icamerasrc scene-mode=auto device-name=otocam260-3 io-mode=mmap printfps=true ! 'video/x-raw,format=UYVY,width=2880,height=1860' !  fpsdisplaysink video-sink=glimagesink sync=false icamerasrc scene-mode=auto device-name=otocam260-4 io-mode=mmap printfps=true ! 'video/x-raw,format=UYVY,width=2880,height=1860' !  fpsdisplaysink video-sink=glimagesink sync=false

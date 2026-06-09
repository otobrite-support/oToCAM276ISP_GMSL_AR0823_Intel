### Get started Guide:

* While setup the build environment on the new ipu6 machine, do items from here:
* follow the steps in the doc 828853_ArrowLakeUH_Ubuntu_Kernel_Overlay_GSG_3.1 and fix the steps of session 2.3.2 for building the linux kernel:
(a)sudo git clone https://github.com/intel/linux-kernel-overlay.git
(b)cd linux-kernel-overlay
(c)sudo git checkout lts-overlay-v6.12.61-ubuntu-251229T065211Z
(d)sudo ./build.sh -r no -t lts-overlay-v6.12.61-ubuntu-251229T065211Z -b 1000 -c lts
* file: $/etc/modprobe.d/ipu.conf
add one line:  options intel-ipu6 isys_freq_override=475
* retrieve the otocam-intel-driver:

  * $cd /home/user/otocam-intel-driver-vx.xx.xx/script/
  * $chmod 777 *.sh
  * $./install_image.sh
  * $./install_deb.sh
  * $./install_script.sh

### Steps to execute sensor preview
* while update new ko or xml, do items from here:
(1) copy the ko & xml to the intel system:
- $cd /home/user/otocam-intel-driver-vx.xx.xx/script/
- $./install_script.sh

* while change new camera, do items from here:
(2) reboot the intel machine
- enter BIOS
- modify the HID for the specific sensor (UFEI Firmware Setting ->enter BIOS...
-> Intel advanced menu -> System Agent (SA) Configuration -> MIPI Camera Configuration -> Camera1 & camera2 Link options)
- ex: otocam222 => OTOCM222
otocam223 => OTOCM223
otocam260 => OTOCM260
otocam271 => OTOCM271
otocam276 => OTOCM276

(3) enter ubuntu
- do following steps.
- $cd /home/user/otocam-intel-driver-vx.xx.xx/script/
- $sudo su
- $source env.sh
- $./otocamxxx-xxx.sh

### Note

* 1.for display frame info

  * sudo apt install gstreamer1.0-plugins-base


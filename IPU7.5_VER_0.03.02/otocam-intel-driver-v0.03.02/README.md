### Get started Guide:

* While setup the build environment on the new ipu7 machine, do items from here:
* follow the steps in the doc 858119_PantherLakeH_Linux_GetStartedGuide_0.81:
(a)sudo git clone https://github.com/intel/linux-kernel-overlay.git
(b)cd linux-kernel-overlay
(c)sudo ./build.sh -r yes -t mainline-tracking-overlay-pre-prod-v6.17-ubuntu-251118T134731Z -b 1000 -c preempt-rt

* retrieve the otocam-intel-driver:

  * $cd /home/user/otocam-intel-driver-vx.xx.xx/script/
  * $chmod 777 *.sh
  * $./install_image.sh
  * $./install_ko.sh
  * $./install_json.sh

### Steps to execute sensor preview
* while update new ko or json, do items from here:
(1) copy the ko & xml to the intel system:
- $cd /home/user/otocam-intel-driver-vx.xx.xx/script/
- $./install_ko.sh
- $./install_json.sh

* while change new camera, do items from here:
(2) reboot the intel machine
- enter BIOS
- modify the HID for the specific sensor (UFEI Firmware Setting ->enter BIOS...
-> Intel advanced menu -> System Agent (SA) Configuration -> MIPI Camera Configuration -> Camera1 & camera2 Link options)
- ex: otocam222 => OTOCM222
      otocam223 => OTOCM223
      otocam260 => OTOCM260
      otocam271 => OTOCM271
      otocam274 => OTOCM274
      otocam276 => OTOCM276
      otocam278 => OTOCM278

(3) enter ubuntu
- do following steps.
- $cd /home/user/otocam-intel-driver-vx.xx.xx/script/
- $sudo su
- $source env.sh
- $./otocamxxx-xxx.sh

(4)hot-plug:
- After hot-plug the camera, execute following script:
- $cd /home/user/otocam-intel-driver-vx.xx.xx/script/
- $./rm_insert_drv.sh 

### Note

* 1.for display frame info

  * sudo apt install gstreamer1.0-plugins-base



sudo cp ../xml/ipu6epmtl/libcamhal_profile.xml /etc/camera/ipu6epmtl/
sudo cp ../xml/ipu6epmtl/sensors/* /etc/camera/ipu6epmtl/sensors/
KER_DIR="/lib/modules/6.12.61-lts-251229t065211z/kernel"
#sudo cp ./drivers/media/i2c/lt6911uxc.ko ${KER_DIR}/drivers/media/i2c/
sudo cp ../ko/isx031.ko ${KER_DIR}/drivers/media/i2c/
sudo cp ../ko/otocam* ${KER_DIR}/drivers/media/i2c/
sudo cp ../ko/max9x.ko ${KER_DIR}/drivers/media/i2c/max9x/
sudo cp ../ko/ipu-acpi.ko ${KER_DIR}/drivers/media/platform/intel/
sudo cp ../ko/ipu-acpi-common.ko ${KER_DIR}/drivers/media/platform/intel/
sudo cp ../ko/ipu-acpi-pdata.ko ${KER_DIR}/drivers/media/platform/intel/
sudo cp ../ko/intel-ipu6.ko ${KER_DIR}/drivers/media/pci/intel/ipu6/
sudo cp ../ko/intel-ipu6-psys.ko ${KER_DIR}/drivers/media/pci/intel/ipu6/
sudo cp ../ko/intel-ipu6-isys.ko ${KER_DIR}/drivers/media/pci/intel/ipu6/
sudo depmod -a


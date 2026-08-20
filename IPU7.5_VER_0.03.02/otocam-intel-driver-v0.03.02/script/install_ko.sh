
KER_DIR="/lib/modules/6.17.0-mainline-tracking-251118t134731z/kernel"
sudo cp -a ../ko/drivers ${KER_DIR}/
sudo depmod -a

# This must be executed as root or sudo

cd /usr/local/src/rpi-i2s-audio
make -C /lib/modules/$(uname -r )/build M=$(pwd) modules
insmod my_loader.ko
cp my_loader.ko /lib/modules/$(uname -r)

#echo 'my_loader' | sudo tee --append /etc/modules > /dev/null
#sudo depmod -a
#sudo modprobe my_loader

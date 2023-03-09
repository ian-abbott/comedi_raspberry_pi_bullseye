# COMEDI Raspberry pi USB bullseye kernel drivers

Raspberry PI has removed the COMEDI framework from the standard kernel.
In order to use COMEDI devices you need to compile and install comedi.

Only the drivers for COMEDI USB devices are compiled in particular USB-DUX.

## Compile

```
sudo apt install raspberrypi-kernel
make -C /usr/src/linux-headers-5.15.84-v8+/ M=$PWD
```
The above kernel header directory in `/usr/src' might differ depending if it's 64bit or 32bit.
Please check with `ls -l /usr/src'.

## Install

```
sudo make -C /usr/src/linux-headers-5.15.84-v8+/ M=$PWD modules_install
sudo modprobe -a
sudo apt install firmware-linux-free
```

ifneq ($(KERNELRELEASE),)
# KBuild part of Makefile

ccflags-y	:= -DCONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048 -DCONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480


comedi-y				:= comedi_fops.o range.o drivers.o \
					   comedi_buf.o
comedi-y				+= proc.o

obj-m					+= comedi_usb.o

obj-m					+= comedi.o

obj-m					+= kcomedilib/
obj-m					+= drivers/

else
# Normal part of Makefile

# Use KDIR variable to specify kernel build directory.
# Default to the running kernel's build directory if KDIR is not set.
KDIR ?= "/lib/modules/$(shell uname -r)/build"

all: modules
install: modules_install

modules modules_install clean:
	$(MAKE) -C "$(KDIR)" M="$(CURDIR)" $@

.PHONY: all install clean modules modules_install

endif

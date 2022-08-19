PREFIX = /usr/local

.PHONY: info install uninstall

info:
	@echo
	@echo "Usage: make [install | uninstall]"
	@echo
	@echo "Post Installation Steps:"
	@echo " * To use the USB with Docker Swarm, execute the following as root:"
	@echo "      $(DESTDIR)/bin/docker-swarm-listener /dev/my_usb edgex-csdk-test:latest &"


install:
	sudo cp ./docker-swarm-listener $(DESTDIR)$(PREFIX)/bin/docker-swarm-listener
	sudo cp ./docker-swarm-enable-usb $(DESTDIR)$(PREFIX)/bin/docker-swarm-enable-usb
	sudo cp ./redhawk-usb.rules $(DESTDIR)/etc/udev/rules.d/99-libusb.rules
	sudo udevadm control --reload-rules
	sudo udevadm trigger
	@echo
	@echo "A reboot is REQUIRED if you are planning on using the RTL SDR!!!"
	@echo
	@echo "Note: After a reboot, the RTL SDR will ONLY work with Docker!"
	@echo "      Uninstall this application and reboot to re-enable the local kernel modules."
	@echo 

uninstall:
	sudo rm $(DESTDIR)$(PREFIX)/bin/docker-swarm-listener
	sudo rm $(DESTDIR)$(PREFIX)/bin/docker-swarm-enable-usb
	sudo rm $(DESTDIR)/etc/udev/rules.d/redhawk-usb.rules
	sudo udevadm control --reload-rules
	sudo udevadm trigger

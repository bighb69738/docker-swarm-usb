PREFIX = /root

.PHONY: info install uninstall

info:
	@echo
	@echo "Usage: make [install | uninstall]"
	@echo
	@echo "Post Installation Steps:"
	@echo " * To use the USB with Docker Swarm, execute the following as root:"
	@echo "      $(DESTDIR)$(PREFIX)/docker-swarm-listener /dev/my_usb edgex-csdk-test:latest &"


install:
	sudo cp ./docker-swarm-listener $(DESTDIR)$(PREFIX)/docker-swarm-listener
	sudo cp ./docker-swarm-enable-usb $(DESTDIR)$(PREFIX)/docker-swarm-enable-usb
	sudo cp ./99-libusb.rules $(DESTDIR)/etc/udev/rules.d/99-libusb.rules
	sudo udevadm control --reload-rules
	sudo udevadm trigger

uninstall:
	sudo rm $(DESTDIR)$(PREFIX)/docker-swarm-listener
	sudo rm $(DESTDIR)$(PREFIX)/docker-swarm-enable-usb
	sudo rm $(DESTDIR)/etc/udev/rules.d/99-libusb.rules
	sudo udevadm control --reload-rules
	sudo udevadm trigger

# Introduce

To mount the usb devices in docker swarm mode. The test usb device is HID device, and run the HID device on edgex-csdk-test image.

## .rules

Reference by this website. [https://blog.csdn.net/wzxxtt62267018/article/details/80741086]

## Installing

Use the following command to install the package:

> Note: You will need administrative privileges to complete the install.

    $ make install

## Running

Run the following command to get a list of steps to perform depending on the device you are enabling on this Docker Swarm Node:

    $ make info

The following message appears:

    Post Installation Steps:
     * To use the USB with Docker Swarm, execute the following as root:
          /usr/local/bin/docker-swarm-listener /dev/my_usb edgex-csdk-test:latest &

Follow these instructions and remember to `sudo su` before the command to run it as root! The `&` at the end of the command forces the process to the background. The `docker-swarm-listener` script is easily extended to be given any device symlink path with any image name. The format of the command is below:

    $ sudo su
    $ /usr/local/bin/docker-swarm-listener <device_symlink_path> <image_name> &

## Uninstalling

Use the following command to uninstall the package:

> Note: You will need administrative privileges to uninstall the package.

    $ make uninstall

#!/bin/bash
sudo chmod 777 /var/run/docker.sock
sudo echo 0 | sudo tee -a /sys/bus/pci/devices/0000\:01\:00.0/numa_node
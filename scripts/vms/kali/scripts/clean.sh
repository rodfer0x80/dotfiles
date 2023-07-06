#!/bin/sh

modprobe -r virtio-net virtio-blk virtio-scsi virtio-serial virtio-baloon
modprobe -r kvm kvmgt mdev vfio
modprobe -r kvm_intel
sleep 5
sudo systemctl stop libvirtd
sleep 5
pkill virt-manager

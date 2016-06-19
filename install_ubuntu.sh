#! /bin/bash
#
#sudo apt-get install git qemu-kvm libvirt-bin virtinst bridge-utils
#
#sudo cd /var/lib/libvirt/boot
#sudo wget http://releases.ubuntu.com/14.04/ubuntu-14.04.4-server-amd64.iso \
#	-P /var/lib/libvirt/boot
#
#sudo git clone https://github.com/bestjae/ubuntu_preseed.git
#sudo cp ubuntu_preseed/preseed.cfg ./

sudo virt-install \
--virt-type=kvm  \
--name ubuntu \
--ram 4096 \
--vcpus=2 \
--os-type linux \
--connect=qemu:///system \
--os-variant=ubuntutrusty \
--hvm \
--location=/var/lib/libvirt/boot/ubuntu-14.04.4-server-amd64.iso \
--network network=default,model=virtio \
--graphics none \
--disk path=/var/lib/libvirt/images/ubuntu.img,size=20,bus=virtio \
--initrd-inject=preseed.cfg \
--extra-args "console=ttyS0,115200 auto=true interface=auto language=en country=kr"
#--location 'http://archive.ubuntu.com/ubuntu/dists/trusty/main/installer-amd64/' \

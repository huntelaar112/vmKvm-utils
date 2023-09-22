export LIBVIRT_DEFAULT_URI='qemu:///system'

sudo virt-install  --virt-type kvm \
  --name debian11 \
  --memory 2048 \
  --vcpus 2 \
  --cpu host \
  --os-type linux \
  --location  http://deb.debian.org/debian/dists/bullseye/main/installer-amd64/ \
  --os-variant debian11 \
  --disk path=/home/user/virtual-machine-data/mannk-debian11-vm.qcow2,size=20 \
  --os-variant auto \
  --graphics vnc,listen=0.0.0.0,password=hanoi123 \
  --network network=macvtapnet,model=virtio \
  --console pty,target_type=serial \
  --extra-args='console=ttyS0'

#  --extra-args "GRUB_CMDLINE_LINUX_DEFAULT="console=tty0 console=ttyS0,115200n8""
#   --network network=default \
#  --noautoconsole
#  --autostart
#    --serial dev,pah=/dev/ttyS0
#   --cdrom /tmp/debian11.7.iso \


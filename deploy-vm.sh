#!/bin/bash

set -e
#set +e # continue execute script in spite of command fail
#set -u
done=no
exitval=0

namescrpit=${0:2}

function help() {
  echo "Usage: ${namescrpit} <vm_name> <cpus> <ram(MB)> <disk_path> <network_interface>
  Create a Debian11 VM.
  Note: This script need sudo permission to execute."
  exit ${exitval}
}

numberArgs="5"
[[ ${1} = "-h" || -z ${1} || "$#" -lt ${numberArgs} ]] && {
  echo "Missing arguments."
  help
}

export LIBVIRT_DEFAULT_URI='qemu:///system'

vmName=${1}
vmCpus=${2}
vmRam=${3}
vmDiskPath=${4}
vmNetWork=${5}

sudo virt-install --virt-type kvm \
  --name ${vmName} --memory ${vmRam} \
  --vcpus ${vmCpus} \
  --cpu host \
  --os-type linux \
  --location http://deb.debian.org/debian/dists/bullseye/main/installer-amd64/ \
  --os-variant debian11 \
  --disk path=${vmDiskPath}/${vmName}.qcow2,size=20 \
  --os-variant auto \
  --graphics vnc,listen=0.0.0.0,password=hanoi123 \
  --network network=${vmNetWork},model=virtio \
  --console pty,target_type=serial \
  --extra-args='console=ttyS0'

#  --extra-args "GRUB_CMDLINE_LINUX_DEFAULT="console=tty0 console=ttyS0,115200n8""
#   --network network=default \
#  --noautoconsole
#  --autostart
#    --serial dev,pah=/dev/ttyS0
#   --cdrom /tmp/debian11.7.iso \

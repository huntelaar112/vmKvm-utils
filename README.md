# vmKvm-utils
Script to deploy kvm virtual machine through commandline &lt;3

- Create macvtap interface for VMs
create-macvtap.sh <interface_name> <ethernet_interface_base>

- Deploy a VM:
deploy-vm.sh <vm_name> <cpus> <ram(MB)> <disk_path> <netwokr_interface>

- Rm a VM:
rm-vm.sh <vm_name> <disk_path>

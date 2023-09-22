physInterface=${1}

interfaceConfig="
<network>
  <name>macvtapnet</name>
  <forward mode=\"bridge\">
    <interface dev=\"${physInterface}\"/>
  </forward>
</network>"

echo "$interfaceConfig" > /etc/libvirt/qemu/networks/macvtapnet-def.xml
virsh net-define /etc/libvirt/qemu/networks/macvtapnet-def.xml
virsh net-autostart macvtapnet
virsh net-start macvtapnet
virsh net-list

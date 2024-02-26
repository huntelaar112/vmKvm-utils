#!/bin/bash

set -e
#set +e # continue execute script in spite of command fail
#set -u
done=no
exitval=0

namescrpit=${0:2}

function help() {
  echo "Usage: ${namescrpit} <vm_name> <disk_path>
  Note: This script need sudo permission to execute."
  exit ${exitval}
}

numberArgs="2"
[[ ${1} = "-h" || -z ${1} || "$#" -lt ${numberArgs} ]] && {
  echo "Missing arguments."
  help
}

virtualMachine=${1}
dataPath=${2}

virsh list --all
#virsh dumpxml VM_NAME
virsh shutdown ${virtualMachine}
virsh destroy ${virtualMachine}
virsh undefine ${virtualMachine}
rm -rf ${dataPath}

done=yes


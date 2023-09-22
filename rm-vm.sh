#!/bin/bash

set -e
#set +e # continue execute script in spite of command fail
#set -u
done=no
exitval=0

namescrpit=${0:2}

function help() {
  echo "Usage: ${namescrpit} [option1] [option2] arg1 arg2
  Note: This script need sudo permission to execute."
  exit ${exitval}
}

numberArgs="1"
[[ ${1} = "-h" || -z ${1} || "$#" -lt ${numberArgs} ]] && {
  echo "Missing arguments."
  help
}
source $(which logshell)
## for log-info, log-error, log-warning, log-run, log-debug, log-step
virtualMachine=${1}
dataPath=${2}

virsh list --all
#virsh dumpxml VM_NAME
virsh shutdown ${virtualMachine}
virsh destroy ${virtualMachine}
virsh undefine ${virtualMachine}
rm -rf ${dataPath}
### Do thing need to do



done=yes


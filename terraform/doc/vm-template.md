qm set 202 --serial0 socket --vga serial0
qm importdisk 202 focal-server-cloudimg-amd64.img local-lvm
qm set 202 --scsihw virtio-scsi-pci --scsi0 local-lvm:base-204-disk-0,discard=on,ssd=1
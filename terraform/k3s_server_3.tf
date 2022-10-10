# Proxmox Full-Clone
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "k3s_server_3" {
    
    # VM General Settings
    name = "k3s-server-3"
    desc = "k3s server node 3"
    vmid = "406"
    target_node = "pve"
    

    # VM Advanced General Settings
    onboot = true 

    # VM OS Settings
    # The template name to clone this vm from
    clone = "ubuntu-20-ci-tmplate"

    # VM System Settings
    # Activate QEMU agent for this VM
    agent = 1


    # VM CPU Settings
    cpu = "host"    
    sockets = 1
    cores = 2
    
    # VM Memory Settings
    memory = 4096

  # Setup the disk
    disk {
        size = "32G"
        type = "scsi"
        storage = "local-lvm"
        ssd = 1
        discard= "on"
    }

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    ciuser = "bruce"
    
    # VM Cloud-Init Settings
    os_type = "cloud-init"

    # (Optional) IP Address and Gateway
    ipconfig0 = "ip=10.0.0.164/24,gw=10.0.0.1"
    # nameserver


    # (Optional) SSH KEY
    sshkeys = "${var.user_public_ssh_key}"
}
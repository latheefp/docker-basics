terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = ">= 2.9.11"
    }
  }
}

provider "proxmox" {
  pm_api_url      = var.pm_api_url
  pm_user         = var.pm_user
  pm_password     = var.pm_password
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "vms" {
  count = length(var.vm_configs)

  name        = var.vm_configs[count.index]["vm_name"]
  target_node = var.vm_configs[count.index]["target_node"]
  vmid        = var.vm_configs[count.index]["nextid"]
  clone       = var.vm_configs[count.index]["clone_template"]
  os_type     = "cloud-init"
  cores       = var.vm_configs[count.index]["vm_cores"]
  memory      = var.vm_configs[count.index]["vm_memory"]

  disk {
    size    = var.vm_configs[count.index]["vm_disk_size"]
    type    = "scsi"         # You can change this to the appropriate type
    storage = "local-lvm"    # Replace with your storage name
  }

  network {
    model  = "virtio"
    bridge = var.vm_configs[count.index]["vm_bridge"]
  }

  ciuser     = var.vm_configs[count.index]["ci_user"]
  cipassword = var.vm_configs[count.index]["ci_password"]
  ipconfig0  = "ip=${var.vm_configs[count.index]["ci_ip"]}/24,gw=${var.vm_configs[count.index]["ci_gateway"]}"

  timeouts {
    create = "30m"  # Adjust the time as necessary
    update = "30m"  # Adjust the time as necessary
    delete = "30m"  # Adjust the time as necessary
  }

}

output "vm_ids" {
  value = [for vm in proxmox_vm_qemu.vms : vm.vmid]
}


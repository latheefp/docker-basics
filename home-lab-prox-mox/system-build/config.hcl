terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.11"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://192.168.8.150:8006/api2/json"
  pm_user    = "root@pam"
  pm_password = "max3days"
  pm_tls_insecure = true
}

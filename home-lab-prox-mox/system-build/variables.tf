variable "vm_configs" {
  description = "List of configurations for each VM"
  type        = list(map(any))
  default     = []
}

variable "pm_user" {
  description = "Proxmox user"
  type        = string
}

variable "pm_password" {
  description = "Proxmox password"
  type        = string
  sensitive   = true
}




variable "pm_api_url" {
  description = "Proxmox API URL"
  type        = string
}
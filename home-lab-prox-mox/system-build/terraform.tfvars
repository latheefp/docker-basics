vm_configs = [

            {
                pm_user         = "root@pam"
                pm_password     = "max3days"
                pm_api_url      = "https://192.168.8.150:8006/api2/json"
                target_node     = "pve"
                clone_template  = "ubuntu-22-clone"
                vm_cores        = 2
                vm_memory       = 7000
                vm_disk_size    = "100G"
                vm_bridge       = "vmbr0"
                ci_user         = "ubuntu"
                ci_password     = "max3days"

                ci_ip      = "192.168.8.120"
                ci_gateway = "192.168.8.1"
                nextid     = 120
                vm_name    = "awx"
            },
           

  ]

pm_password = "max3days"

pm_api_url = "https://192.168.8.150:8006/api2/json"

pm_user = "root@pam"
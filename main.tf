terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc1"
    }
  }
}

provider "proxmox" {
  pm_api_url         = var.pm_api_url
  pm_api_token_id    = var.pm_user
  pm_api_token_secret = var.pm_password
  pm_tls_insecure    = true
}

resource "proxmox_vm_qemu" "ubuntu_vmm" {
  name        = "ubuntu-vmm"
  clone       = var.template
  target_node   = "pve"
}

  

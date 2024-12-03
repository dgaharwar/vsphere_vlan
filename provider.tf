terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.8.1"
    }
    morpheus = {
      source  = "gomorpheus/morpheus"
      version = "0.9.9"
    }
  }
}

provider "vsphere" {
  user                 = var.vsphere_provider_user
  password             = var.vsphere_provider_password
  vsphere_server       = var.vsphere_ip
  allow_unverified_ssl = true
}

provider "morpheus" {
  url      = var.morpheus_url
  username = var.morpheus_username
  password = var.morpheus_password
}



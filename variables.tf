##################################################
#                 Variables                      #
##################################################

locals {
  vlan_id = var.vlan_id
  begin_ip = "${local.vlan_id}" == 901 ? "10.180.25.2" : "${local.vlan_id}" == 902 ? "10.180.26.2" : "${local.vlan_id}" == 903 ? "10.180.27.2" : "null"
  end_ip = "${local.vlan_id}" == 901 ? "10.180.25.254" : "${local.vlan_id}" == 902 ? "10.180.26.254" : "${local.vlan_id}" == 903 ? "10.180.27.254" : "null"
}

variable "vsphere_provider_user"{
  type        = string
}

variable "vsphere_provider_password"{
  type        = string
  sensitive   = true
}

variable "vsphere_ip"{
  type        = string
}

variable "morpheus_url" {
  description = "URL of the Morpheus Instance"
  type        = string
}

variable "morpheus_password" {
  description = "Morpheus Data user password"
  type       = string
  sensitive  = true
}

variable "morpheus_username" {
  description = "Morpheus Data username"
  type        = string
}

variable "vlan_id" {
  type    = number
  default = 901
}

##################################################
#               Data Sources                     #
##################################################

# Vsphere

data "vsphere_datacenter" "datacenter" {
  name = "labs-den-dc2-demo"
}

data "vsphere_distributed_virtual_switch" "vds" {
  name          = "LAN-Demo-02"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

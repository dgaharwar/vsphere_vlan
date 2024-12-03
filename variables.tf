##################################################
#                 Variables                      #
##################################################

locals {
  vlan_id = tonumber(var.vlan_id)
  begin_ip = "${local.vlan_id}" == "901" ? "10.180.25.2" : "${local.vlan_id}" == "902" ? "10.180.26.2" : "${local.vlan_id}" == "903" ? "10.180.27.2" : "${local.vlan_id}" == "904" ? "10.180.28.2" : "${local.vlan_id}" == "905" ? "10.180.29.2" : "${local.vlan_id}" == "906" ? "10.180.30.2" :  "${local.vlan_id}" == "907" ? "10.180.31.2" : "${local.vlan_id}" == "908" ? "10.180.32.2" : "${local.vlan_id}" == "909" ? "10.180.33.2" : "${local.vlan_id}" == "910" ? "10.180.34.2" : "${local.vlan_id}" == "911" ? "10.180.35.2" : "${local.vlan_id}" == "912" ? "10.180.36.2" : "null"
  end_ip = "${local.vlan_id}" == "901" ? "10.180.25.254" : "${local.vlan_id}" == "902" ? "10.180.26.254" : "${local.vlan_id}" == "903" ? "10.180.27.254" : "${local.vlan_id}" == "904" ? "10.180.28.254" : "${local.vlan_id}" == "905" ? "10.180.29.254" : "${local.vlan_id}" == "906" ? "10.180.30.254" :  "${local.vlan_id}" == "907" ? "10.180.31.254" : "${local.vlan_id}" == "908" ? "10.180.32.254" : "${local.vlan_id}" == "909" ? "10.180.33.254" : "${local.vlan_id}" == "910" ? "10.180.34.254" : "${local.vlan_id}" == "911" ? "10.180.35.254" : "${local.vlan_id}" == "912" ? "10.180.36.254" : "null"
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
  type = string
}

##################################################
#               Data Sources                     #
##################################################

# Vsphere

data "vsphere_datacenter" "datacenter" {
  name = "labs-den-dc2-demo"
}

data "vsphere_distributed_virtual_switch" "vds" {
  name          = "VLAN0002 - Internal Server 2"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}


##################################################
#            Resources  - Vsphere                #
##################################################

############# Networks  ######################

# Port Group

#resource "vsphere_distributed_port_group" "vlan_pg" {
#  name                            = "Vlan${var.vlan_id}"
#  distributed_virtual_switch_uuid = data.vsphere_distributed_virtual_switch.vds.id
#  vlan_id = var.vlan_id
#  number_of_ports  = 50
#  block_override_allowed = true
#  auto_expand = false
#}


resource "vsphere_distributed_port_group" "vlan_pg" {
  name                            = "Vlan${local.vlan_id}"
  distributed_virtual_switch_uuid = data.vsphere_distributed_virtual_switch.vds.id
  vlan_id = local.vlan_id
  number_of_ports  = 50
  block_override_allowed = true
  auto_expand = false
}


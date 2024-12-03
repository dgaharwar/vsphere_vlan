##################################################
#          Resources  - Morpheus                 #
##################################################

#resource "morpheus_ipv4_ip_pool" "vlan_ip_pool" {
#    name = "Vlan${var.vlan_id}-ip-pool"
#    ip_range {
#    starting_address = local.begin_ip
#    ending_address   = local.end_ip
#  }
#}

resource "morpheus_ipv4_ip_pool" "vlan_ip_pool" {
    name = "Vlan${local.vlan_id}-ip-pool"
    ip_range {
    starting_address = local.begin_ip
    ending_address   = local.end_ip
  }
}
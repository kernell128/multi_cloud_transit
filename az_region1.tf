module "az_transit_1" {
    source      = "terraform-aviatrix-modules/azure-transit/aviatrix"
    version     = "v1.1.0"
    cidr        = var.entity_cidrs["az_transit_1"]
    region      = var.az_deploy["region"]
    account     = var.az_deploy["account"]
    ha_gw       = false
}

module "az_spoke_1" {
    source      = "terraform-aviatrix-modules/azure-spoke/aviatrix"
    version     = "1.1.0"
    name        = var.az_deploy["spoke_1_name"]
    cidr        = var.entity_cidrs["az_spoke_1"]
    region      = var.az_deploy["region"]
    account     = var.az_deploy["account"]
    transit_gw  = module.az_transit_1.transit_gateway.gw_name
}
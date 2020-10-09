// OCI Transit Module Region 2
module "oci_transit_2" {
  source  = "terraform-aviatrix-modules/oci-transit/aviatrix"
  version = "1.1.0"
  name    = var.entity_displaynames["sa_saopaulo_transit"]
  cidr    = var.entity_cidrs["sa_saopaulo_transit"]
  ha_gw   = false
  region  = var.oci_region_2
  account = var.oci_account_name
}

// OCI Spoke 1 Region 2
module "oci_spoke_1_region_2" {
  source     = "terraform-aviatrix-modules/oci-spoke/aviatrix"
  version    = "1.1.0"
  name       = var.entity_displaynames["sa_saopaulo_prd"]
  cidr       = var.entity_cidrs["sa_saopaulo_prd"]
  ha_gw      = false
  region     = var.oci_region_2
  account    = var.oci_account_name
  transit_gw = module.oci_transit_2.transit_gateway.gw_name
}

// OCI Spoke 2 Region 1
module "oci_spoke_2_region_2" {
  source     = "terraform-aviatrix-modules/oci-spoke/aviatrix"
  version    = "1.1.0"
  name       = var.entity_displaynames["sa_saopaulo_dev"]
  cidr       = var.entity_cidrs["sa_saopaulo_dev"]
  ha_gw      = false
  region     = var.oci_region_2
  account    = var.oci_account_name
  transit_gw = module.oci_transit_2.transit_gateway.gw_name
}

// OCI Spoke 3 Region 1
module "oci_spoke_3_region_2" {
  source     = "terraform-aviatrix-modules/oci-spoke/aviatrix"
  version    = "1.1.0"
  name       = var.entity_displaynames["sa_saopaulo_qas"]
  cidr       = var.entity_cidrs["sa_saopaulo_qas"]
  ha_gw      = false
  region     = var.oci_region_2
  account    = var.oci_account_name
  transit_gw = module.oci_transit_2.transit_gateway.gw_name
}


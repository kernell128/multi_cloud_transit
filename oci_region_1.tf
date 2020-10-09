// OCI Transit Module Region 1
module "oci_transit_1" {
  source  = "terraform-aviatrix-modules/oci-transit/aviatrix"
  version = "1.1.0"
  name    = var.entity_displaynames["ashburn_transit"]
  cidr    = var.entity_cidrs["ashburn_transit"]
  ha_gw   = false
  region  = var.oci_region_1
  account = var.oci_account_name
}

// OCI Spoke 1 Region 1
module "oci_spoke1" {
  source     = "terraform-aviatrix-modules/oci-spoke/aviatrix"
  version    = "1.1.0"
  name       = var.entity_displaynames["ashburn_prd"]
  cidr       = var.entity_cidrs["ashburn_prd"]
  ha_gw      = true
  region     = var.oci_region_1
  account    = var.oci_account_name
  transit_gw = module.oci_transit_1.transit_gateway.gw_name
}

// OCI Spoke 2 Region 1
module "oci_spoke2" {
  source     = "terraform-aviatrix-modules/oci-spoke/aviatrix"
  version    = "1.1.0"
  name       = var.entity_displaynames["ashburn_dev"]
  cidr       = var.entity_cidrs["ashburn_dev"]
  ha_gw      = false
  region     = var.oci_region_1
  account    = var.oci_account_name
  transit_gw = module.oci_transit_1.transit_gateway.gw_name
}

// OCI Spoke 3 Region 1
module "oci_spoke3" {
  source     = "terraform-aviatrix-modules/oci-spoke/aviatrix"
  version    = "1.1.0"
  name       = var.entity_displaynames["ashburn_qas"]
  cidr       = var.entity_cidrs["ashburn_qas"]
  ha_gw      = false
  region     = var.oci_region_1
  account    = var.oci_account_name
  transit_gw = module.oci_transit_1.transit_gateway.gw_name
}


// OCI VPN GW 
resource "aviatrix_gateway" "oci_vpn_gw" {
  cloud_type          = 16
  account_name        = var.oci_account_name
  gw_name             = var.oci_vpn_gw["vpn_gw_name"]
  vpc_id              = var.oci_vpn_gw["vcn_name"]
  vpc_reg             = var.oci_vpn_gw["vpc_reg"]
  gw_size             = var.oci_vpn_gw["gw_size"]
  subnet              = var.oci_vpn_gw["vcn_name"]
  vpn_access          = var.oci_vpn_gw["vpn_access"]
  vpn_cidr            = var.oci_vpn_gw["vpn_cidr"]
  max_vpn_conn        = var.oci_vpn_gw["max_vpn_conn"]
  
}

resource "aviatrix_vpn_user" "oci_vpn_users" {
  for_each           = var.vpn_users
  vpc_id             = aviatrix_gateway.oci_vpn_gw.vpc_id
  gw_name            = aviatrix_gateway.oci_vpn_gw.gw_name
  user_name          = each.value.user_name
  user_email         = each.value.user_email
}
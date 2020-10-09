module "aws_transit_1" {
  source        = "terraform-aviatrix-modules/aws-transit/aviatrix"
  version       = "v1.1.0"
  cidr          = var.entity_cidrs["aws_transit_1"]
  region        = var.aws_region_1
  account       = var.aws_account
  ha_gw         = false
}

// OCI Spoke 1 Region 1
module "aws_spoke1" {
  source        = "terraform-aviatrix-modules/aws-spoke/aviatrix"
  version       = "1.1.0"
  name          = var.entity_displaynames["aws_spoke_1"]
  cidr          = var.entity_cidrs["aws_spoke_1"]
  ha_gw         = false
  region        = var.aws_region_1
  account       = var.aws_account
  transit_gw    = module.oci_transit_1.transit_gateway.gw_name
}

// OCI Spoke 2 Region 1
module "aws_spoke2" {
  source        = "terraform-aviatrix-modules/aws-spoke/aviatrix"
  version       = "1.1.0"
  name          = var.entity_displaynames["aws_spoke_2"]
  cidr          = var.entity_cidrs["aws_spoke_2"]
  ha_gw         = false
  region        = var.aws_region_1
  account       = var.aws_account
  transit_gw    = module.oci_transit_1.transit_gateway.gw_name
}
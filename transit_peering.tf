module "transit-peering" {
  source  = "terraform-aviatrix-modules/mc-transit-peering/aviatrix"
  version = "1.0.0"
  transit_gateways = [
      module.oci_transit_1.transit_gateway.gw_name,
      module.oci_transit_2.transit_gateway.gw_name,
      module.az_transit_1.transit_gateway.gw_name,
      module.aws_transit_1.transit_gateway.gw_name

      ]
}

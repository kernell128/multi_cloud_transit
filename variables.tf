variable "username" {
  type    = string
  default = "admin"
}

variable "password" {
  type    = string
  default = ""
}

variable "controller_ip" {
  type    = string
  default = ""
}

variable "ssh_public_key" {}

variable "instance_config" {
  type = map
  default = {
    compartment_ocid    = "ocid1.compartment.oc1..aaaaaaaavrdqlamidxhcqjrszhryh7bj3rtmgtoys4j47s2uv2gwbvuql4pq"
    source_ocid         = "ocid1.image.oc1.iad.aaaaaaaauxe4rooab4bdzaxsbug47vvivzvxcgsvgr6hj3yrt7pw4avzwdaq"
    subnet_ocid_dev_1   = "ocid1.subnet.oc1.iad.aaaaaaaa7dt3pgs4em5gp33xoc24sasmhn7c7ysihl62ypy6ind4i7bl3fvq"
  }
}

variable "entity_cidrs" {
  type = map
  default = {
    ashburn_transit     = "172.17.0.0/24"
    ashburn_prd         = "172.17.1.0/24"
    ashburn_dev         = "172.17.2.0/24"
    ashburn_qas         = "172.17.3.0/24"
    sa_saopaulo_transit = "172.18.0.0/24"
    sa_saopaulo_prd     = "172.18.1.0/24"
    sa_saopaulo_dev     = "172.18.2.0/24"
    sa_saopaulo_qas     = "172.18.3.0/24"
    aws_transit_1       = "172.19.0.0/23"
    aws_spoke_1         = "172.19.2.0/24"
    aws_spoke_2         = "172.19.3.0/24"
    az_transit_1        = "172.20.0.0/24"
    az_spoke_1          = "172.20.1.0/24"
  }
}

variable "entity_displaynames" {
  type = map
  default = {
    ashburn_transit     = "acme_ash_transit"
    ashburn_prd         = "acme_ash_sopke_prd"
    ashburn_dev         = "acme_ash_sopke_dev"
    ashburn_qas         = "acme_ash_sopke_qas"
    sa_saopaulo_transit = "acme_sp1_transit"
    sa_saopaulo_prd     = "acme_sp1_sopke_prd"
    sa_saopaulo_dev     = "acme_sp1_sopke_dev"
    sa_saopaulo_qas     = "acme_sp1_sopke_qas"
    aws_transit_1       = "aws-transit-1"
    aws_spoke_1         = "aws-spoke-1"
    aws_spoke_2         = "aws-spoke-2"
  }
}

variable "aws_region_1" {
  default = "us-west-1"
}

variable "aws_account" {
  default ="br_marcosbrz"
}

variable "oci_region_1" {
  default = "us-ashburn-1"
}

variable "oci_region_2" {
  default = "sa-saopaulo-1"
}


variable "oci_transit_cidr1" {
  default = ""
}

variable "oci_region1" {
  default = ""
}

variable "oci_transit_cidr2" {
  default = ""
}

variable "oci_region2" {
  default = ""
}
variable "oci_account_name" {
  default = ""
}

variable "oci_gw_size" {
  default = ""
}

variable "oci_spoke_gw_name_1" {
  type    = string
  default = ""
}

variable "oci_spoke_vpc_cidr_1" {
  type    = string
  default = ""
}

variable "oci_spoke_gw_name_2" {
  type    = string
  default = ""
}

variable "oci_spoke_vpc_cidr_2" {
  type    = string
  default = ""
}

variable "oci_spoke_gw_name_3" {
  type    = string
  default = ""
}

variable "oci_spoke_vpc_cidr_3" {
  type    = string
  default = ""
}

variable "oci_spoke_gw_name_4" {
  type    = string
  default = ""
}

variable "oci_spoke_vpc_cidr_4" {
  type    = string
  default = ""
}

variable "insane" {
  type    = bool
  default = true
}

variable "ha_enabled" {
  type    = bool
  default = true
}

variable oci_vpn_gw {
  type = map
  default = {
    vpn_gw_name   = "oci_vpn_gw"
    vcn_name      = "avx-acme_ash_sopke_prd-spoke"
    vpc_reg       = "us-ashburn-1"
    gw_size       = "VM.Standard2.2"
    subnet        = "172.17.1.0/26"
    vpn_access    = true
    vpn_cidr      = "192.168.45.0/24"
    max_vpn_conn  = "25"
  }
}


variable "vpn_users" {
  description = "VPN User Parameters: user_name, user_email"
  type = map(object({
    user_name        = string
    user_email       = string
  }))
}


variable az_deploy {
  type = map 
  default = {
    spoke_1_name      = "az_spoke_1"
    region            = "Central US"
    account           = "azure"
  }
}
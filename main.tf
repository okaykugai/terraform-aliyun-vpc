###########################################
#                  VPC                    #
###########################################
resource "alicloud_vpc" "vpc" {
  name        = "${format("%s_%s",var.prefix, var.vpc_name)}"
  cidr_block  = "${var.vpc_cidr}"
  description = "Alicloud VPC"
}

###########################################
#              NAT Gateway                #
###########################################
resource "alicloud_nat_gateway" "nat_gateway" {
  vpc_id        = "${alicloud_vpc.vpc.id}"
  specification = "${var.nat_gateway_specification}"
  name          = "${format("%s_%s",var.prefix, var.nat_gateway_name)}"
}

resource "alicloud_eip" "nat_gateway_eip" {
  name = "${format("%s_%s",var.prefix, var.nat_gateway_eip_name)}"
}

resource "alicloud_eip_association" "nat_gateway_eip_association" {
  allocation_id = "${alicloud_eip.nat_gateway_eip.id}"
  instance_id   = "${alicloud_nat_gateway.nat_gateway.id}"
}

resource "alicloud_snat_entry" "snat_entry_app_vswitch_az_a" {
  snat_table_id     = "${alicloud_nat_gateway.nat_gateway.snat_table_ids}"
  source_vswitch_id = "${alicloud_vswitch.app_vswitch_az_a.id}"
  snat_ip           = "${alicloud_eip.nat_gateway_eip.ip_address}"
}

resource "alicloud_snat_entry" "snat_entry_app_vswitch_az_b" {
  snat_table_id     = "${alicloud_nat_gateway.nat_gateway.snat_table_ids}"
  source_vswitch_id = "${alicloud_vswitch.app_vswitch_az_b.id}"
  snat_ip           = "${alicloud_eip.nat_gateway_eip.ip_address}"
}

resource "alicloud_snat_entry" "snat_entry_app_vswitch_az_c" {
  snat_table_id     = "${alicloud_nat_gateway.nat_gateway.snat_table_ids}"
  source_vswitch_id = "${alicloud_vswitch.app_vswitch_az_c.id}"
  snat_ip           = "${alicloud_eip.nat_gateway_eip.ip_address}"
}

resource "alicloud_snat_entry" "snat_entry_misc_vswitch_az_a" {
  snat_table_id     = "${alicloud_nat_gateway.nat_gateway.snat_table_ids}"
  source_vswitch_id = "${alicloud_vswitch.misc_vswitch_az_a.id}"
  snat_ip           = "${alicloud_eip.nat_gateway_eip.ip_address}"
}

###########################################
#            VSwitch (App)                #
###########################################
resource "alicloud_vswitch" "app_vswitch_az_a" {
  vpc_id            = "${alicloud_vpc.vpc.id}"
  name              = "${format("%s_%s",var.prefix, var.app_vswitch_name_az_a)}"
  cidr_block        = "${var.app_vswitch_cidr_az_a}"
  availability_zone = "${var.availability_zone_a}"
}

resource "alicloud_vswitch" "app_vswitch_az_b" {
  vpc_id            = "${alicloud_vpc.vpc.id}"
  name              = "${format("%s_%s",var.prefix, var.app_vswitch_name_az_b)}"
  cidr_block        = "${var.app_vswitch_cidr_az_b}"
  availability_zone = "${var.availability_zone_b}"
}

resource "alicloud_vswitch" "app_vswitch_az_c" {
  vpc_id            = "${alicloud_vpc.vpc.id}"
  name              = "${format("%s_%s",var.prefix, var.app_vswitch_name_az_c)}"
  cidr_block        = "${var.app_vswitch_cidr_az_c}"
  availability_zone = "${var.availability_zone_c}"
}

resource "alicloud_route_table" "app_route_table" {
  vpc_id      = "${alicloud_vpc.vpc.id}"
  name        = "${format("%s_%s",var.prefix, var.app_route_table_name)}"
  description = "App vswitch route table"
}

resource "alicloud_route_entry" "app_route_table_entry" {
  route_table_id        = "${alicloud_route_table.app_route_table.id}"
  destination_cidrblock = "0.0.0.0/0"
  nexthop_type          = "NatGateway"
  nexthop_id            = "${alicloud_nat_gateway.nat_gateway.id}"
}

resource "alicloud_route_table_attachment" "app_route_table_attachment_az_a" {
  vswitch_id     = "${alicloud_vswitch.app_vswitch_az_a.id}"
  route_table_id = "${alicloud_route_table.app_route_table.id}"
}

resource "alicloud_route_table_attachment" "app_route_table_attachment_az_b" {
  vswitch_id     = "${alicloud_vswitch.app_vswitch_az_b.id}"
  route_table_id = "${alicloud_route_table.app_route_table.id}"
}

resource "alicloud_route_table_attachment" "app_route_table_attachment_az_c" {
  vswitch_id     = "${alicloud_vswitch.app_vswitch_az_c.id}"
  route_table_id = "${alicloud_route_table.app_route_table.id}"
}

###########################################
#             VSwitch (DB)                #
###########################################
resource "alicloud_vswitch" "db_vswitch_az_a" {
  vpc_id            = "${alicloud_vpc.vpc.id}"
  name              = "${format("%s_%s",var.prefix, var.db_vswitch_name_az_a)}"
  cidr_block        = "${var.db_vswitch_cidr_az_a}"
  availability_zone = "${var.availability_zone_a}"
}

resource "alicloud_vswitch" "db_vswitch_az_b" {
  vpc_id            = "${alicloud_vpc.vpc.id}"
  name              = "${format("%s_%s",var.prefix, var.db_vswitch_name_az_b)}"
  cidr_block        = "${var.db_vswitch_cidr_az_b}"
  availability_zone = "${var.availability_zone_b}"
}

resource "alicloud_vswitch" "db_vswitch_az_c" {
  vpc_id            = "${alicloud_vpc.vpc.id}"
  name              = "${format("%s_%s",var.prefix, var.db_vswitch_name_az_c)}"
  cidr_block        = "${var.db_vswitch_cidr_az_c}"
  availability_zone = "${var.availability_zone_c}"
}

resource "alicloud_route_table" "db_route_table" {
  vpc_id      = "${alicloud_vpc.vpc.id}"
  name        = "${format("%s_%s",var.prefix, var.db_route_table_name)}"
  description = "DB vswitch route table"
}

resource "alicloud_route_entry" "db_route_table_entry" {
  route_table_id        = "${alicloud_route_table.db_route_table.id}"
  destination_cidrblock = "0.0.0.0/0"
  nexthop_type          = "NatGateway"
  nexthop_id            = "${alicloud_nat_gateway.nat_gateway.id}"
}

resource "alicloud_route_table_attachment" "db_route_table_attachment_az_a" {
  vswitch_id     = "${alicloud_vswitch.db_vswitch_az_a.id}"
  route_table_id = "${alicloud_route_table.db_route_table.id}"
}

resource "alicloud_route_table_attachment" "db_route_table_attachment_az_b" {
  vswitch_id     = "${alicloud_vswitch.db_vswitch_az_b.id}"
  route_table_id = "${alicloud_route_table.db_route_table.id}"
}

resource "alicloud_route_table_attachment" "db_route_table_attachment_az_c" {
  vswitch_id     = "${alicloud_vswitch.db_vswitch_az_c.id}"
  route_table_id = "${alicloud_route_table.db_route_table.id}"
}

###########################################
#            VSwitch (Misc)               #
###########################################
resource "alicloud_vswitch" "misc_vswitch_az_a" {
  vpc_id            = "${alicloud_vpc.vpc.id}"
  name              = "${format("%s_%s",var.prefix, var.misc_vswitch_name_az_a)}"
  cidr_block        = "${var.misc_vswitch_cidr_az_a}"
  availability_zone = "${var.availability_zone_a}"
}

resource "alicloud_route_table" "misc_route_table" {
  vpc_id      = "${alicloud_vpc.vpc.id}"
  name        = "${format("%s_%s",var.prefix, var.misc_route_table_name)}"
  description = "misc vswitch route table"
}

resource "alicloud_route_entry" "misc_route_table_entry" {
  route_table_id        = "${alicloud_route_table.misc_route_table.id}"
  destination_cidrblock = "0.0.0.0/0"
  nexthop_type          = "NatGateway"
  nexthop_id            = "${alicloud_nat_gateway.nat_gateway.id}"
}

resource "alicloud_route_table_attachment" "misc_route_table_attachment_az_a" {
  vswitch_id     = "${alicloud_vswitch.misc_vswitch_az_a.id}"
  route_table_id = "${alicloud_route_table.misc_route_table.id}"
}

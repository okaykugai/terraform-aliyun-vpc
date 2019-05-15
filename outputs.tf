// VPC 
output "vpc_id" {
  value       = "${alicloud_vpc.vpc.id}"
  description = "VPC id"
}

output "vpc_name" {
  value       = "${alicloud_vpc.vpc.name}"
  description = "VPC name"
}

// NAT Gateway
output "nat_gateway_id" {
  value       = "${alicloud_nat_gateway.nat_gateway.id}"
  description = "NAT gateway id"
}

output "nat_gateway_name" {
  value       = "${alicloud_nat_gateway.nat_gateway.name}"
  description = "NAT gateway name"
}

output "nat_gateway_ip" {
  value       = "${alicloud_eip.nat_gateway_eip.ip_address}"
  description = "NAT gateway EIP"
}

// VSwitches (App)
output "app_vswitch_az_a_id" {
  value       = "${alicloud_vswitch.app_vswitch_az_a.id}"
  description = "APP VSwitch AZ first id"
}

output "app_vswitch_az_a_name" {
  value       = "${alicloud_vswitch.app_vswitch_az_a.name}"
  description = "APP VSwitch AZ first name"
}

output "app_vswitch_az_a_cidr_block" {
  value       = "${alicloud_vswitch.app_vswitch_az_a.cidr_block}"
  description = "APP VSwitch AZ first cidr range"
}

output "app_vswitch_az_b_id" {
  value       = "${alicloud_vswitch.app_vswitch_az_b.id}"
  description = "APP VSwitch AZ second id"
}

output "app_vswitch_az_b_name" {
  value       = "${alicloud_vswitch.app_vswitch_az_b.name}"
  description = "APP VSwitch AZ second name"
}

output "app_vswitch_az_b_cidr_block" {
  value       = "${alicloud_vswitch.app_vswitch_az_b.cidr_block}"
  description = "APP VSwitch AZ second cidr range"
}

output "app_vswitch_az_c_id" {
  value       = "${alicloud_vswitch.app_vswitch_az_c.id}"
  description = "APP VSwitch AZ third id"
}

output "app_vswitch_az_c_name" {
  value       = "${alicloud_vswitch.app_vswitch_az_c.name}"
  description = "APP VSwitch AZ third name"
}

output "app_vswitch_az_c_cidr_block" {
  value       = "${alicloud_vswitch.app_vswitch_az_c.cidr_block}"
  description = "APP VSwitch AZ third cidr range"
}

output "app_route_table_id" {
  value       = "${alicloud_route_table.app_route_table.id}"
  description = "APP VSwitch route table id"
}

// VSwitches (DB)
output "db_vswitch_az_a_id" {
  value       = "${alicloud_vswitch.db_vswitch_az_a.id}"
  description = "DB VSwitch AZ first id"
}

output "db_vswitch_az_a_name" {
  value       = "${alicloud_vswitch.db_vswitch_az_a.name}"
  description = "DB VSwitch AZ first name"
}

output "db_vswitch_az_a_cidr_block" {
  value       = "${alicloud_vswitch.db_vswitch_az_a.cidr_block}"
  description = "DB VSwitch AZ first cidr range"
}

output "db_vswitch_az_b_id" {
  value       = "${alicloud_vswitch.db_vswitch_az_b.id}"
  description = "DB VSwitch AZ second id"
}

output "db_vswitch_az_b_name" {
  value       = "${alicloud_vswitch.db_vswitch_az_b.name}"
  description = "DB VSwitch AZ second name"
}

output "db_vswitch_az_b_cidr_block" {
  value       = "${alicloud_vswitch.db_vswitch_az_b.cidr_block}"
  description = "DB VSwitch AZ second cidr range"
}

output "db_vswitch_az_c_id" {
  value       = "${alicloud_vswitch.db_vswitch_az_c.id}"
  description = "DB VSwitch AZ third id"
}

output "db_vswitch_az_c_name" {
  value       = "${alicloud_vswitch.db_vswitch_az_c.name}"
  description = "DB VSwitch AZ third name"
}

output "db_vswitch_az_c_cidr_block" {
  value       = "${alicloud_vswitch.db_vswitch_az_c.cidr_block}"
  description = "DB VSwitch AZ third cidr range"
}

output "db_route_table_id" {
  value       = "${alicloud_route_table.db_route_table.id}"
  description = "DB VSwitch route table id"
}

// VSwitch (Misc)
output "misc_vswitch_az_a_id" {
  value       = "${alicloud_vswitch.misc_vswitch_az_a.id}"
  description = "Misc VSwitch AZ first id"
}

output "misc_vswitch_az_a_name" {
  value       = "${alicloud_vswitch.misc_vswitch_az_a.name}"
  description = "Misc VSwitch AZ first name"
}

output "misc_vswitch_az_a_cidr_block" {
  value       = "${alicloud_vswitch.misc_vswitch_az_a.cidr_block}"
  description = "Misc VSwitch AZ first cidr range"
}

output "misc_route_table_id" {
  value       = "${alicloud_route_table.misc_route_table.id}"
  description = "Misc VSwitch route table id"
}

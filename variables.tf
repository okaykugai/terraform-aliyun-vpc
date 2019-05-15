// Global
variable "prefix" {
  description = "Prefix for each resource created"
}

// VPC
variable "vpc_name" {
  default     = "vpc"
  description = "VPC name"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/8"
  description = "VPC CIDR range"
}

// Hongkong AZ's
variable "availability_zone_a" {
  description = "Availibility zone first"
}

variable "availability_zone_b" {
  description = "Availibility zone second"
}

variable "availability_zone_c" {
  description = "Availibility zone third"
}

// NAT Gateway
variable "nat_gateway_name" {
  default     = "gateway"
  description = "NAT gateway name"
}

variable "nat_gateway_specification" {
  default     = "Middle"
  description = "NAT gateway specification"
}

variable "nat_gateway_eip_name" {
  default     = "gateway_eip"
  description = "NAT gateway EIP"
}

// VSwitchs (App)
variable "app_vswitch_name_az_a" {
  default     = "app_vswitch_a"
  description = "APP VSwitch AZ first name"
}

variable "app_vswitch_cidr_az_a" {
  default     = "10.0.0.0/23"
  description = "APP VSwitch AZ first cidr range"
}

variable "app_vswitch_name_az_b" {
  default     = "app_vswitch_b"
  description = "APP VSwitch AZ second name"
}

variable "app_vswitch_cidr_az_b" {
  default     = "10.0.2.0/23"
  description = "APP VSwitch AZ second cidr range"
}

variable "app_vswitch_name_az_c" {
  default     = "app_vswitch_c"
  description = "APP VSwitch AZ third name"
}

variable "app_vswitch_cidr_az_c" {
  default     = "10.0.4.0/23"
  description = "APP VSwitch AZ third cidr range"
}

variable "app_route_table_name" {
  default     = "app_route_table"
  description = "APP VSwitch route table name"
}

// VSwitchs (DB)
variable "db_vswitch_name_az_a" {
  default     = "db_vswitch_a"
  description = "DB VSwitch AZ first name"
}

variable "db_vswitch_cidr_az_a" {
  default     = "10.0.6.0/23"
  description = "DB VSwitch AZ first cidr range"
}

variable "db_vswitch_name_az_b" {
  default     = "db_vswitch_b"
  description = "DB VSwitch AZ second name"
}

variable "db_vswitch_cidr_az_b" {
  default     = "10.0.8.0/23"
  description = "DB VSwitch AZ second cidr range"
}

variable "db_vswitch_name_az_c" {
  default     = "db_vswitch_c"
  description = "DB VSwitch AZ third name"
}

variable "db_vswitch_cidr_az_c" {
  default     = "10.0.10.0/23"
  description = "DB VSwitch AZ third cidr range"
}

variable "db_route_table_name" {
  default     = "db_route_table"
  description = "DB VSwitch route table name"
}

// VSwitch (Misc)
variable "misc_vswitch_name_az_a" {
  default     = "misc_vswitch_a"
  description = "Misc VSwitch AZ first name"
}

variable "misc_vswitch_cidr_az_a" {
  default     = "10.0.12.0/23"
  description = "Misc VSwitch AZ first cidr range"
}

variable "misc_route_table_name" {
  default     = "misc_route_table"
  description = "Misc VSwitch route table name"
}

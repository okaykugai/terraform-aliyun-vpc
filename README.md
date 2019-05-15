Aliyun VPC Terraform Module
=========

- Reference: https://www.terraform.io/docs/providers/alicloud/r/vpc.html

<img alt="Terraform" src="https://cdn.rawgit.com/hashicorp/terraform-website/master/content/source/assets/images/logo-hashicorp.svg" width="600px">

The key features of this Module are:

- **VPC**: Creates a new VPC with specified CIDR range.

- **VSwitchs**: Creates 3 types of VSwitch (App, DB, Misc). App and DB are multi AZ.
 
- **NAT Gateway**: Creates NAT Gateway with EIP attached for internet access to VSwitches.
  
Usage
-------------------------------

Use below snippet in tf file to create a VPC in Aliyun.

```
module "aliyun_vpc" {
  source = "./modules/vpc"

  prefix              = "${terraform.workspace}"
  availability_zone_a = "${var.global_info["availability_zone_a"]}"
  availability_zone_b = "${var.global_info["availability_zone_b"]}"
}
```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| app_route_table_name | APP VSwitch route table name | string | `app_route_table` | no |
| app_vswitch_cidr_az_a | APP VSwitch AZ first cidr range | string | `10.0.0.0/23` | no |
| app_vswitch_cidr_az_b | APP VSwitch AZ second cidr range | string | `10.0.2.0/23` | no |
| app_vswitch_name_az_a | APP VSwitch AZ first name | string | `app_vswitch_a` | no |
| app_vswitch_name_az_b | APP VSwitch AZ second name | string | `app_vswitch_b` | no |
| availability_zone_a | Availibility zone first | string | - | yes |
| availability_zone_b | Availibility zone second | string | - | yes |
| db_route_table_name | DB VSwitch route table name | string | `db_route_table` | no |
| db_vswitch_cidr_az_a | DB VSwitch AZ first cidr range | string | `10.0.4.0/23` | no |
| db_vswitch_cidr_az_b | DB VSwitch AZ second cidr range | string | `10.0.6.0/23` | no |
| db_vswitch_name_az_a | DB VSwitch AZ first name | string | `db_vswitch_a` | no |
| db_vswitch_name_az_b | DB VSwitch AZ second name | string | `db_vswitch_b` | no |
| misc_route_table_name | Misc VSwitch route table name | string | `misc_route_table` | no |
| misc_vswitch_cidr_az_a | Misc VSwitch AZ first cidr range | string | `10.0.8.0/23` | no |
| misc_vswitch_name_az_a | Misc VSwitch AZ first name | string | `misc_vswitch_a` | no |
| nat_gateway_eip_name | NAT gateway EIP | string | `gateway_eip` | no |
| nat_gateway_name | NAT gateway name | string | `gateway` | no |
| nat_gateway_specification | NAT gateway specification | string | `Middle` | no |
| prefix | Prefix for each resource created | string | - | yes |
| vpc_cidr | VPC CIDR range | string | `10.0.0.0/8` | no |
| vpc_name | VPC name | string | `vpc` | no |

## Outputs

| Name | Description |
|------|-------------|
| app_route_table_id | APP VSwitch route table id |
| app_vswitch_az_a_cidr_block | APP VSwitch AZ first cidr range |
| app_vswitch_az_a_id | APP VSwitch AZ first id |
| app_vswitch_az_a_name | APP VSwitch AZ first name |
| app_vswitch_az_b_cidr_block | APP VSwitch AZ second cidr range |
| app_vswitch_az_b_id | APP VSwitch AZ second id |
| app_vswitch_az_b_name | APP VSwitch AZ second name |
| db_route_table_id | DB VSwitch route table id |
| db_vswitch_az_a_cidr_block | DB VSwitch AZ first cidr range |
| db_vswitch_az_a_id | DB VSwitch AZ first id |
| db_vswitch_az_a_name | DB VSwitch AZ first name |
| db_vswitch_az_b_cidr_block | DB VSwitch AZ second cidr range |
| db_vswitch_az_b_id | DB VSwitch AZ second id |
| db_vswitch_az_b_name | DB VSwitch AZ second name |
| misc_route_table_id | Misc VSwitch route table id |
| misc_vswitch_az_a_cidr_block | Misc VSwitch AZ first cidr range |
| misc_vswitch_az_a_id | Misc VSwitch AZ first id |
| misc_vswitch_az_a_name | Misc VSwitch AZ first name |
| nat_gateway_id | NAT gateway id |
| nat_gateway_ip | NAT gateway EIP |
| nat_gateway_name | NAT gateway name |
| vpc_id | VPC id |
| vpc_name | VPC name |


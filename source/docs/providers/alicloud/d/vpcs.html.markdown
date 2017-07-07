---
layout: "alicloud"
page_title: "Alicloud: alicloud_vpcs"
sidebar_current: "docs-alicloud-datasource-vpcs"
description: |-
    Provides a list of Availability VPC which can be used by an Alicloud account.
---

# alicloud\_vpcs

The VPC data source list VPC resource of Alicloud  which can be accessed by an Alicloud account within the region configured in the provider.

## Example Usage

```
data "alicloud_vpcs" "multi_vpc"{
	cidr_block="172.16.0.0/12"
	status="Available"
	name_regex="^foo"
}

```

## Argument Reference

The following arguments are supported:

* `cidr_block` - (Optional) Limit search to specific cidr block,like "172.16.0.0/12".
* `status` - (Optional) Limit search to specific status.The following values are allowed:Pending,Available.
* `name_regex` - (Optional) A regex string to apply to VpcName. 
* `is_default` - (Optional) Whether the VPC is the default VPC for the region where it belongs. The following values are allowed:true,false.
* `vswitch_id` - (Optional) Limit search to specific VSwitch.

## Attributes Reference

The following attributes are exported:

* `id` - ID of the VPC.
* `region_id` - ID of the region where VPC belong.
* `status` - Status of the VPC,Pending or Available.
* `vpc_name` - Name of the VPC.
* `vswitch_ids` - List of VSwitchID
* `cidr_block` - CIDR block of the VPC.
* `vrouter_id` - ID of the VRouter
* `description` - Description of the VPC
* `is_default` - Whether the VPC is the default VPC for the region where it belongs.
* `creation_time` - Time of creation.
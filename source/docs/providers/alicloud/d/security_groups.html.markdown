---
layout: "alicloud"
page_title: "Alicloud: alicloud_security_groups"
sidebar_current: "docs-alicloud-datasource-security-groups"
description: |-
    Provides a list of security groups available to the user.
---

# alicloud\_images

The security groups data source list security groups resource of Alicloud  which can be accessed by an Alicloud account within the region configured in the provider.

## Example Usage

```
data "alicloud_security_groups" "security_group" {
    security_group_name_regex = "^alicloud"
}

```

## Argument Reference

The following arguments are supported:

* `id` - (Optional) ID of the specific security group. 
* `security_group_name_regex` - (Optional) A regex string to apply to the security group list returned by Alicloud. 
* `vpc_id` - (Optional) The VPC ID.

## Attributes Reference

The following attributes are exported:

* `security_group_id` - ID of the security group.
* `security_group_name` - Name of the security group.
* `region_id` - Region ID of the the security group.
* `description` - Description of the security group.
* `permissions` - Description of the permissions of the security group.
  * `ip_protocol` - IP protocol,with possible values:all,tcp,udp,icmp,gre.
  * `port_range` - Port range of the the security group.
  * `source_security_group_id` -  Source security group ID of the security group.
  * `source_group_owner_account` - The owner account of source group.
  * `source_cidr_ip` - The source CIDR IP of the security group (use or Ingress authorization).
  * `dest_cidr_ip` - The destination CIDR IP of the security group (use for Ingress authorization).
  * `policy` - Authorization policy of the security group.
  * `nic_type` - Network type,internet or intranet.
  * `priority` - Priority of the security group.
  * `direction` - Authorization direction,ingress or egress
  * `description` Description of the security group.
* `vpc_id` - VPC ID of the security group.
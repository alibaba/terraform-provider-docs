---
layout: "alicloud"
page_title: "Alicloud: alicloud_route_entry"
sidebar_current: "docs-alicloud-resource-route-entry"
description: |-
  Provides a Alicloud Route Entry resource.
---

# alicloud\_route\_entry

Provides a route entry resource.

## Example Usage

Basic Usage

```
resource "alicloud_vpc" "vpc" {
  name = "tf_test_foo"
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_route_entry" "default" {
	router_id = "${alicloud_vpc.default.router_id}"
	route_table_id = "${alicloud_vpc.default.router_table_id}"
	destination_cidrblock = "${var.entry_cidr}"
	nexthop_type = "Instance"
	nexthop_id = "${alicloud_instance.snat.id}"
}

resource "alicloud_instance" "snat" {
}
```
## Argument Reference

The following arguments are supported:

* `router_id` - (Required, Forces new resource) The AZ for the switch.
* `route_table_id` - (Required, Forces new resource) The VPC ID.
* `destination_cidrblock` - (Optional, Forces new resource) The CIDR block for the switch.
* `nexthop_type` - (Optional, Forces new resource) The CIDR block for the switch.
* `nexthop_id` - (Optional, Forces new resource) The CIDR block for the switch.

## Attributes Reference

The following attributes are exported:

* `id` - The ID of the switch.
* `availability_zone` The AZ for the switch.
* `cidr_block` - The CIDR block for the switch.
* `vpc_id` - The VPC ID.
* `name` - The name of the switch.
* `description` - The description of the switch.

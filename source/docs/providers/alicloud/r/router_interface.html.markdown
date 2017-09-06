---
layout: "alicloud"
page_title: "Alicloud: alicloud_router_interface"
sidebar_current: "docs-alicloud-resource-router-interface"
description: |-
  Provides a ECS router interface resource.
---

# alicloud\_router\_interface

Provides a ECS router interface resource.

~> **NOTE:** At most five interfaces are supported for one router and one account.
 
~> **NOTE:** When the `router_type` is `VBR`, the `role` can only be `InitiatingSide` and `opposite_router_type` can only be `VRouter`.

~> **NOTE:** When the `opposite_router_type` is `VBR`, the `role` can only be `AcceptingSide` and `router_type` can only be `VRouter`.

~> **NOTE:** Please refer to `https://help.aliyun.com/document_detail/44821.html` for the details of the value of `specification`. 

## Example Usage

```
resource "alicloud_vpc" "foo" {
  name = "tf_test_foo12345"
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_router_interface" "interface" {
  opposite_region = "cn-beijing"
  router_type = "VRouter"
  router_id = "${alicloud_vpc.foo.router_id}"
  role = "InitiatingSide"
  specification = "Large.2"
  name = "test1"
  description = "test1"
}
```
## Argument Reference

The following arguments are supported:

* `opposite_region` - (Required, Forces new resource) Region of the opposite router. Valid values are `cn-beijing`, `cn-hangzhou`, `cn-shanghai`, `cn-shenzhen`, `cn-hongkong`, `ap-southeast-1`, `us-east-1` and `us-west-1`.
* `router_type` - (Required, Forces new resource) Type of the router. Valid values are `VRouter` and `VBR`.
* `opposite_router_type` - (Optional, Forces new resource) Type of the opposite router which will be connected. Valid values are `VRouter` and `VBR`. Default value is `VRouter`.
* `router_id` - (Required, Forces new resource) Id of the router.
* `opposite_router_id` - (Optional) Id of the opposite router which will be connected.
* `role` - (Required, Forces new resource) Role of the router interface. Valid values are `InitiatingSide` and `AcceptingSide`.
* `specification` - (Optional) Specification of the router interface. Valid values are `Large.1`, `Large.2`, `Small.1`, `Small.2`, `Small.5`, `Middle.1`, `Middle.2`, `Middle.5` and `Negative`. It can only be `Negative` when the `role` is `AcceptingSide`. It is required and can not be `Negative` when the `role` is `InitiatingSide`.
* `access_point_id` - (Optional, Forces new resource) Access point of the router interface. This parameter is required when the `router_type` is `VBR`.
* `opposite_access_point_id` - (Optional, Forces new resource) Access point of the opposite router interface. This parameter is required when the `opposite_router_type` is `VBR`.
* `opposite_interface_id` - (Optional) Id of interface which will be connected.
* `opposite_interface_owner_id` - (Optional) Id of the account which the opposite interface belongs to.
* `name` - (Optional) Name of the router interface. This name can have a string of 2 to 128 characters(Chinese or English), must contains only alphanumeric characters or hyphens "-", "_" or ".", and must not begin with "http://", "http://" or a hyphen. 
* `description` - (Optional) Description of the router interface. This description can have a string of 2 to 256 characters and can not begin with "http://" or "https://".
* `health_check_source_ip` - (Optional) Source IP of Packet of Line HealthCheck for the scenarios of Disaster Tolerant and ECMP. This parameter and `health_check_target_ip` should be specified or not at one time. It only valid when the `router_type` is `VRouter` and the `opposite_router_type` is `VBR`.
* `health_check_target_ip` - (Optional) Target IP of Packet of Line HealthCheck for the scenarios of Disaster Tolerant and ECMP. This parameter and `health_check_source_ip` should be specified or not at one time. It only valid when the `router_type` is `VRouter` and the `opposite_router_type` is `VBR`.


## Attributes Reference

The following attributes are exported:

* `id` - The interface ID.
* `router_id` - The router ID.
* `router_type` - The router type.
* `role` - The interface role.
* `name` - The interface name.
* `description` - The interface description.
* `specification` - The interface specification.
* `access_point_id` - Access point of the interface.
* `opposite_access_point_id` - Access point of the opposite interface.
* `opposite_router_type` - The opposite router type.
* `opposite_router_id` - The opposite router ID.
* `opposite_interface_id` - The opposite interface ID.
* `opposite_interface_owner_id` - The account ID which the opposite interface belongs to.
* `health_check_source_ip` - Source IP of Packet of Line HealthCheck.
* `health_check_target_ip` - Target IP of Packet of Line HealthCheck.

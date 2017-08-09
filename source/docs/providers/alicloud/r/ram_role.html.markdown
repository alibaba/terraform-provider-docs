---
layout: "alicloud"
page_title: "Alicloud: alicloud_ram_role"
sidebar_current: "docs-alicloud-resource-ram-role"
description: |-
  Provides a RAM Role resource.
---

# alicloud\_ram\_role

Provides a RAM Role resource.

~> **NOTE:** When you want to destroy this resource forcefully(means remove all the relationships associated with it automatically and then destroy it) without set `force`  with `true` at beginning, you need add `force = true` to configuration file and run `terraform plan`, then you can delete resource forcefully.
 
~> **NOTE:** The `assume_role_policy` in example contains a variable `${AccountId}`, you should replace it with your own account id when you use it.

## Example Usage

```
# Create a new RAM Role.
resource "alicloud_ram_role" "role" {
  role_name = "test_role"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"RAM\":[\"acs:ram::${AccountId}:root\"]}}],\"Version\":\"1\"}"
  description = "this is a role test."
  force = true
}
```
## Argument Reference

The following arguments are supported:

* `role_name` - (Required, Forces new resource) Name of the RAM role. This name can have a string of 1 to 64 characters, must contain only alphanumeric characters or hyphens, such as "-", "_", and must not begin with a hyphen.
* `assume_role_policy` - (Required) Document of the RAM role policy. This document must be a json string and can not contain any whitespace.
* `description` - (Optional, Forces new resource) Description of the RAM role. This name can have a string of 1 to 1024 characters.
* `force` - (Optional) This parameter is used for resource destroy. Default value is `false`.

## Attributes Reference

The following attributes are exported:

* `id` - The role ID.
* `role_name` - The role name.
* `description` - The role description.
* `arn` - The role arn.
* `create_date` - The role create date.
* `update_date` - The role update date.
* `assume_role_policy` - The role policy document.
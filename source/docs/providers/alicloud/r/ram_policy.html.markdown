---
layout: "alicloud"
page_title: "Alicloud: alicloud_ram_policy"
sidebar_current: "docs-alicloud-resource-ram-policy"
description: |-
  Provides a RAM Policy resource.
---

# alicloud\_ram\_policy

Provides a RAM Policy resource. 

~> **NOTE:** When you want to destroy this resource forcefully(means remove all the relationships associated with it automatically and then destroy it) without set `force`  with `true` at beginning, you need add `force = true` to configuration file and run `terraform plan`, then you can delete resource forcefully.

## Example Usage

```
# Create a new RAM Policy.
resource "alicloud_ram_policy" "policy" {
  name = "test_policy"
  statement = [
    {
      effect = "Allow"
      action = [
        "oss:ListObjects",
        "oss:GetObject"
      ]
      resource = [
        "acs:oss:*:*:mybucket",
        "acs:oss:*:*:mybucket/*"
      ]
    }
  ]
  description = "this is a policy test"
  force = true
}
```
## Argument Reference

The following arguments are supported:

* `name` - (Required, Forces new resource) Name of the RAM policy. This name can have a string of 1 to 128 characters, must contain only alphanumeric characters or hyphen "-", and must not begin with a hyphen.
* `statement` - (Required,  Type: list) Statements of the RAM policy document.
     * `resource` - (Required, Type: list) List of specific objects which will be authorized.
     * `action` - (Required, Type: list) List of operations for the `resource`.
     * `effect` - (Required) This parameter indicates whether or not the `action` is allowed. Valid values are `Allow` and `Deny`.
* `version` - (Optional) Version of the RAM policy document. Valid value is `1`. Default value is `1`.
* `description` - (Optional, Forces new resource) Description of the RAM policy. This name can have a string of 1 to 1024 characters.
* `force` - (Optional) This parameter is used for resource destroy. Default value is `false`.

## Attributes Reference

The following attributes are exported:

* `id` - The policy ID.
* `name` - The policy name.
* `type` - The policy type.
* `description` - The policy description.
* `statement` - List of statement of the policy document.
* `document` - The policy document.
* `version` - The policy document version.
* `attachment_count` - The policy attachment count.
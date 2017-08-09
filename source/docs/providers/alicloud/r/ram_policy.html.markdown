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

~> **NOTE:** The `policy_document` in example contains a variable `${AccountId}`, you should replace it with your own account id when you use it.

## Example Usage

```
# Create a new RAM Policy.
resource "alicloud_ram_policy" "policy" {
  policy_name = "test_policy"
  policy_document = "{\"Statement\": [{\"Action\": [\"ram:ListGroups\", \"ram:CreateGroup\"], \"Effect\": \"Allow\", \"Resource\": [\"acs:ram:*:${AccountId}:group/*\"]}], \"Version\": \"1\"}"
  description = "this is a policy test"
  force = true
}
```
## Argument Reference

The following arguments are supported:

* `policy_name` - (Required, Forces new resource) Name of the RAM policy. This name can have a string of 1 to 128 characters, must contain only alphanumeric characters or hyphen "-", and must not begin with a hyphen.
* `policy_document` - (Required) Document of the RAM policy. This parameter can have no more than 2048 characters. This document must be a json string.
* `description` - (Optional, Forces new resource) Description of the RAM policy. This name can have a string of 1 to 1024 characters.
* `force` - (Optional) This parameter is used for resource destroy. Default value is `false`.

## Attributes Reference

The following attributes are exported:

* `id` - The policy ID.
* `policy_name` - The policy name.
* `policy_type` - The policy type.
* `description` - The policy description.
* `create_date` - The policy create date.
* `update_date` - The policy update date.
* `policy_document` - The policy document.
* `default_version` - The policy default version.
* `attachment_count` - The policy attachment count.
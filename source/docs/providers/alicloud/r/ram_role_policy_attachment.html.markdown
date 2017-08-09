---
layout: "alicloud"
page_title: "Alicloud: alicloud_ram_role_policy_attachment"
sidebar_current: "docs-alicloud-resource-ram-role-policy-attachment"
description: |-
  Provides a RAM Role Policy attachment resource.
---

# alicloud\_ram\_role\_policy\_attachment

Provides a RAM Role attachment resource.

## Example Usage

```
# Create a RAM Role Policy attachment.
resource "alicloud_ram_role" "role" {
  role_name = "test_role"
  assume_role_policy = "{\"Statement\":[{\"Action\":\"sts:AssumeRole\",\"Effect\":\"Allow\",\"Principal\":{\"RAM\":[\"acs:ram::${AccountId}:root\"]}}],\"Version\":\"1\"}"
  description = "this is a role test."
  force = true
}

resource "alicloud_ram_policy" "policy" {
  policy_name = "test_policy"
  policy_document = "{\"Statement\": [{\"Action\": [\"ram:ListGroups\", \"ram:CreateGroup\"], \"Effect\": \"Allow\", \"Resource\": [\"acs:ram:*:${AccountId}:group/*\"]}], \"Version\": \"1\"}"
  description = "this is a policy test"
  force = true
}

resource "alicloud_ram_role_policy_attachment" "attach" {
  policy_name = "${alicloud_ram_policy.policy.policy_name}"
  policy_type = "${alicloud_ram_policy.policy.policy_type}"
  role_name = "${alicloud_ram_role.role.role_name}"
}
```
## Argument Reference

The following arguments are supported:

* `role_name` - (Required, Forces new resource) Name of the RAM Role. This name can have a string of 1 to 64 characters, must contain only alphanumeric characters or hyphens, such as "-", "_", and must not begin with a hyphen.
* `policy_name` - (Required, Forces new resource) Name of the RAM policy. This name can have a string of 1 to 128 characters, must contain only alphanumeric characters or hyphen "-", and must not begin with a hyphen.
* `policy_type` - (Required, Forces new resource) Type of the RAM policy. It must be `Custom` or `System`.

## Attributes Reference

The following attributes are exported:

* `id` - The attachment ID.
* `role_name` - The role name.
* `policy_name` - The policy name.
* `policy_type` - The policy type.
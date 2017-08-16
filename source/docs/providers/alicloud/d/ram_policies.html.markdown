---
layout: "alicloud"
page_title: "Alicloud: alicloud_ram_policies"
sidebar_current: "docs-alicloud-datasource-ram-policies"
description: |-
    Provides a list of ram policies available to the user.
---

# alicloud\_ram\_policies

The Ram Policies data source provides a list of Alicloud Ram Policies in an Alicloud account according to the specified filters.

## Example Usage

```
data "alicloud_ram_policies" "policy" {
  type = "user"
  user_name = "user1"
  policy_type = "System"
  output_file = "policies.txt"
}

```

## Argument Reference

The following arguments are supported:

* `policy_name_regex` - (Optional) A regex string to apply to the policy list returned by Alicloud.
* `policy_type` - (Optional) Limit search to specific the policy type. Valid items are `Custom` and `System`.
* `type` - (Optional) Limit search to specific the type which the policies for. Valid items are `user`, `group`, `role`.
* `user_name` - (Optional) Limit search to specific the user name. This parameter is required when the `type` value is `user`.
* `group_name` - (Optional) Limit search to specific the group name. This parameter is required when the `type` value is `group`.
* `role_name` - (Optional) Limit search to specific the role name. This parameter is required when the `type` value is `role`.
* `output_file` - (Optional) The name of file that can save policies data source after running `terraform plan`.

## Attributes Reference

A list of policies will be exported and its every element contains the following attributes:

* `policy_name` - Name of the policy.
* `policy_type` - Type of the policy.
* `description` - Description of the policy.
* `default_version` - Default version of the policy.
* `create_date` - Create date of the policy.
* `update_date` - Update date of the policy.
* `attachment_count` - Attachment count of the policy.
* `policy_document` - Policy document of the policy.
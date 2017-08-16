---
layout: "alicloud"
page_title: "Alicloud: alicloud_ram_users"
sidebar_current: "docs-alicloud-datasource-ram-users"
description: |-
    Provides a list of ram users available to the user.
---

# alicloud\_ram\_users

The Ram Users data source provides a list of Alicloud Ram Users in an Alicloud account according to the specified filters.

## Example Usage

```
data "alicloud_ram_users" "user" {
  output_file = "users.txt"
  type = "policy"
  policy_name = "AliyunACSDefaultAccess"
  policy_type = "Custom"
  user_name_regex = "^user"
}

```

## Argument Reference

The following arguments are supported:

* `user_name_regex` - (Optional) A regex string to apply to the user list returned by Alicloud.
* `type` - (Optional) Limit search to specific the type which the Users attach for. Valid items are `group` and `policy`.
* `group_name` - (Optional) Limit search to specific the group name. This parameter is required when the `type` value is `group`.
* `policy_name` - (Optional) Limit search to specific the policy name. This parameter is required when the `type` value is `policy`.
* `policy_type` - (Optional) Limit search to specific the policy type. Valid items are `Custom` and `System`. This parameter is required when the `type` value is `policy`.
* `output_file` - (Optional) The name of file that can save users data source after running `terraform plan`.

## Attributes Reference

A list of users will be exported and its every element contains the following attributes:

* `user_id` - Id of the user.
* `user_name` - Name of the user.
* `create_date` - Create date of the user.
* `last_login_date` - Last login date of the user.
---
layout: "alicloud"
page_title: "Alicloud: alicloud_ram_groups"
sidebar_current: "docs-alicloud-datasource-ram-groups"
description: |-
    Provides a list of ram groups available to the user.
---

# alicloud\_ram\_groups

The Ram Groups data source provides a list of Alicloud Ram Groups in an Alicloud account according to the specified filters.

## Example Usage

```
data "alicloud_ram_groups" "group" {
  type = "user"
  user_name = "user1"
  group_name_regex = "^group[0-9]*"
  output_file = "groups.txt"
}

```

## Argument Reference

The following arguments are supported:

* `group_name_regex` - (Optional) A regex string to apply to the group list returned by Alicloud.
* `type` - (Optional) Limit search to specific the type which the groups for. Valid items are `user` and `policy`.
* `user_name` - (Optional) Limit search to specific the user name. This parameter is required when the `type` value is `user`.
* `policy_name` - (Optional) Limit search to specific the policy name. This parameter is required when the `type` value is `policy`.
* `policy_type` - (Optional) Limit search to specific the policy type. Valid items are `Custom` and `System`. This parameter is required when the `type` value is `policy`.
* `output_file` - (Optional) The name of file that can save groups data source after running `terraform plan`.

## Attributes Reference

A list of groups will be exported and its every element contains the following attributes:

* `group_name` - Name of the group.
* `comments` - Comments of the group.
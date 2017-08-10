---
layout: "alicloud"
page_title: "Alicloud: alicloud_ram_account_alias"
sidebar_current: "docs-alicloud-datasource-ram-account-alias"
description: |-
    Provides an alias of the cloud account.
---

# alicloud\_ram\_account\_alias

The Ram Account Alias data source provides an alias for the Alicloud account.

## Example Usage

```
data "alicloud_ram_account_alias" "alias" {
  output_file = "alias.txt"
}

```

## Argument Reference

The following arguments are supported:

* `output_file` - (Optional) The name of file that can save alias data source after running `terraform plan`.

## Attributes Reference

* `account_alias` - Alias of the account.
---
layout: "alicloud"
page_title: "Alicloud: alicloud_ots_table"
sidebar_current: "docs-alicloud-resource-ots-table"
description: |-
  Provides an OTS table resource.
---

# alicloud\_ots_table

Provides an OTS table resource.

~> **NOTE:** Before creating an OTS table, `OTS_INSTANCE_NAME` needs to be passed by Environment Variable, or by setting the argument `ots_instance_name` under provider `alicloud`.

## Example Usage

```
# Create an OTS table
provider "alicloud" {
}

resource "alicloud_ots_table" "table" {
  provider = "alicloud"
  table_name = "${var.table_name}"
  primary_key = [
    {
      name = "${var.primary_key_1_name}"
      type = "${var.primary_key_integer_type}"
    },
    {
      name = "${var.primary_key_2_name}"
      type = "${var.primary_key_integer_type}"
    },
    {
      name = "${var.primary_key_3_name}"
      type = "${var.primary_key_integer_type}"
    },
    {
      name = "${var.primary_key_4_name}"
      type = "${var.primary_key_string_type}"
    },
  ]
  time_to_live = "${var.time_to_live}"
  max_version = "${var.max_version}"
}
```

## Argument Reference

The following arguments are supported:

* `table_name` - (Required) The table name of the OTS instance. If changed, a new table would be created.
* `primary_key` - (Required) The property of `TableMeta` which indicates the structure information of a table. It describes the attribute value of primary key including the name and type. The number of `primary_key` should not be less than one and not be more than four.
* `time_to_live` - (Required) The retention time of data stored in this table (unit: second).
* `max_version` - (Required) The maximum number of versions stored in this table.

## Attributes Reference

The following attributes are exported:

* `table_name` - The table name of the OTS which could not be changed.
* `primary_key` - The property of `TableMeta` which indicates the structure information of a table.
* `time_to_live` - The retention time of data stored in this table.
* `max_version` - The maximum number of versions stored in this table.

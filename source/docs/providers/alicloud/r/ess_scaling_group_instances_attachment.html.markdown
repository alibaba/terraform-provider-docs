---
layout: "alicloud"
page_title: "Alicloud: alicloud_ess_scaling_group_instances_attachment"
sidebar_current: "docs-alicloud-resource-ess-scaling-group-instances-attachment"
description: |-
  Provides resource for the attachment between an ESS scaling group and some ECS instances.
---

# alicloud\_ess\_scaling\_group\_instances\_attachment

Provides resource for the attachment between an ESS scaling group and some ECS instances.

## Example Usage

```
data "alicloud_images" "ecs_image" {
  most_recent = true
  name_regex =  "^centos_6\\w{1,5}[64].*"
}

// create a scaling group
resource "alicloud_ess_scaling_group" "scaling" {
  min_size = 0
  max_size = 20
  scaling_group_name = "tf1-scaling123"
  removal_policies   = ["OldestInstance", "NewestInstance"]
}

// create a security group
resource "alicloud_security_group" "sg" {
  name = "tf-scaling"
  description = "tf1-sg"
}

// create configuration for alicloud_ess_scaling_group.scaling
resource "alicloud_ess_scaling_configuration" "config" {
  scaling_group_id = "${alicloud_ess_scaling_group.scaling.id}"
  enable = true

  image_id = "${data.alicloud_images.ecs_image.images.0.id}"
  instance_type = "ecs.n4.large""
  security_group_id = "${alicloud_security_group.sg.id}"
}

// create 2 instances
resource "alicloud_instance" "foo" {
  image_id = "${data.alicloud_images.ecs_image.images.0.id}"
  count = 2

  system_disk_category = "cloud_ssd"
  system_disk_size = 80

  instance_type = "ecs.n4.large""
  internet_charge_type = "PayByBandwidth"
  security_groups = ["${alicloud_security_group.sg.id}"]
  instance_name = "yuyuyuyuyu"

  tags {
    foo = "bar"
    work = "test"
  }
}

resource "alicloud_ess_scaling_group_instances_attachment" "attach" {
  scaling_group_id = "${alicloud_ess_scaling_group.scaling.id}"
  instance_ids = ["${alicloud_instance.foo.*.id}"]
}
```

## Argument Reference

The following arguments are supported:

* `scaling_group_id` - (Required) Id of the scaling group. This group status must be `active`.
* `instance_ids` - (Required) List ids of ECS instances which will added in the scaling group. At most 20 items are supported.

## Attributes Reference

The following attributes are exported:

* `scaling_group_id` - The scaling group ID.
* `instance_ids` - List ids of ECS instances which in the scaling group.
---
layout: "alicloud"
page_title: "Alicloud: alicloud_disk_attachment"
sidebar_current: "docs-alicloud-resource-disk-attachment"
description: |-
  Provides a ECS Disk Attachment resource.
---

# alicloud\_disk\_attachment

Provides an Alicloud ECS Disk Attachment as a resource, to attach and detach disks from ECS Instances.

## Example Usage

```
# Create a new ECS disk-attachment and use it attach one disk to a new instance.

resource "alicloud_security_group" "group" {
    name = "terraform-test-group"
    description = "New security group"
}

resource "alicloud_disk" "disk" {
    availability_zone = "cn-beijing-a"
    size = "50"

    tags {
        Name = "TerraformTest-disk"
    }
}

resource "alicloud_instance" "instance" {
    image_id = "ubuntu1404_64_40G_cloudinit_20160727.raw"
    instance_type = "ecs.s1.small"
    availability_zone = "cn-beijing-a"
    security_group_id = "${alicloud_security_group.group.id}"
    instance_name = "Hello"
    instance_network_type = "Classic"
    internet_charge_type = "PayByBandwidth"

    tags {
        Name = "TerraformTest-instance"
    }
}

resource "alicloud_disk_attachment" "disk-att" {
    disk_id = "${alicloud_disk.disk.id}"
    instance_id = "${alicloud_instance.instance.id}"
    device_name = "/dev/xvdb"
}
```
## Argument Reference

The following arguments are supported:

* `instance_id` - (Required, Forces new resource) ID of the Instance to attach to.
* `disk_id` - (Required, Forces new resource) ID of the Disk to be attached.
* `device_name` - (Required, Forces new resource) The device name to expose to the instance (for example, /dev/xvdb).

## Attributes Reference

The following attributes are exported:

* `instance_id` - ID of the Instance.
* `disk_id` - ID of the Disk.
* `device_name` - The device name exposed to the instance.
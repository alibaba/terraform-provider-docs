---
layout: "alicloud"
page_title: "Alicloud: alicloud_container"
sidebar_current: "docs-alicloud-resource-container"
description: |-
  Provides a container cluster resource.
---

# alicloud\_container

Provides a container cluster resource.

## Example Usage

```
# Create a new container cluster for classic
resource "alicloud_container" "cs_classic" {
  password = "Just$test"
  instance_type = "ecs.n1.tiny"
  name = "mytest-001"
  size = 2
  network_mode = "classic"
  data_disk_category = "cloud_efficiency"
  data_disk_size = 20
  ecs_image_id = "m-xx251ll"
  io_optimized = "optimized"
}

# Create a new container cluster for VPC
resource "alicloud_container" "cs_vpc" {
  password = "Just$test"
  instance_type = "ecs.n1.tiny"
  name = "mytest-002"
  size = 2
  network_mode = "vpc"
  data_disk_category = "cloud_efficiency"
  data_disk_size = 20
  ecs_image_id = "m-xx251ll"
  io_optimized = "optimized"
  vpc_id = "vpc-2zef7qk11rgq3w053zxrr"
  vswitch_id = "vsw-2zedk6xmx0v7lsgngyi7k"
  subnet_cidr = "172.18.0.0/24"
}
```

## Argument Reference

The following arguments are supported:

* `name` - (Required) The name of the container cluster.It must contain only alphanumeric characters,Chinese characters or hyphens.
* `size` - (Required) The node size of the container cluster.
* `network_mode` - (Required)  The network mode,with possible values:classic,vpc.
* `instance_type` - (Required) The type of instance to start in container cluster.
* `password` - (Required) Password of the root user.
* `data_disk_size` - (Required) The size of the disk in GiBs, and its value depends on Category. cloud disk value range: 5GB ~ 2000GB and other category disk value range: 20 ~ 32768.
* `data_disk_category` - (Required) Category of the disk. Valid values are cloud, cloud_efficiency and cloud_ssd.
* `ecs_image_id` - (Optional)  The Image to use for the container cluster.
* `io_optimized` - (Optional) Valid values are none, optimized, If optimized, the launched container cluster will be I/O optimized. 
* `vpc_id` - (Optional) The VPC ID.If you want to create container cluster in VPC network,this parameter must be set.
* `vswitch_id` - (Optional) The virtual switch ID to launch in VPC.If you want to create container cluster in VPC network,this parameter must be set.
* `subnet_cidr` - (Optional) The CIDR block for the switch. If you want to create container cluster in VPC network,this parameter must be set.

## Attributes Reference

The following attributes are exported:

* `name` - As above.
* `size` - As above.
* `network_mode` - As above.
* `vpc_id` - As above.
* `vswitch_id` - As above.
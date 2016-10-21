variable "availability_zones"  {
  default = "c"
}

variable "cidr_blocks" {
  default = {
    az0 = "10.1.1.0/24"
    az1 = "10.1.2.0/24"
    az2 = "10.1.3.0/24"
  }
}

variable "long_name" { default = "alicloud" }
variable "short_name" { default = "ali" }
variable "vpc_cidr" { default = "10.1.0.0/21" }
variable "region" {}

resource "alicloud_vpc" "main" {
  name = "${var.long_name}"
  cidr_block = "${var.vpc_cidr}"
}

resource "alicloud_subnet" "main" {
  vpc_id = "${alicloud_vpc.main.id}"
  count = "${length(split(",", var.availability_zones))}"
  cidr_block = "${lookup(var.cidr_blocks, "az${count.index}")}"
  availability_zone = "${var.region}-${element(split(",", var.availability_zones), count.index)}"
}

resource "alicloud_nat_gateway" "main" {
  vpc_id = "${alicloud_vpc.main.id}"
  spec = "Small"
  bandwidth_packages = [
    {
      ip_count = 1
      bandwidth = 5
      zone = "${var.region}-c"
    }
  ]
}

output "vpc_id" {
  value = "${alicloud_vpc.main.id}"
}

output "subnet_ids" {
  value = "${join(",", alicloud_subnet.main.*.id)}"
}

output "availability_zones" {
  value = "${join(",",alicloud_subnet.main.*.availability_zone)}"
}

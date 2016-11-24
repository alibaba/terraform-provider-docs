variable "name" { default = "slb_alicloud" }
variable "instances" {
  type = "list"
  default = ["i-2zed2q5rh97ew2ylmxhg","i-2ze1luzgqvdvy4rzp2dg"]
}
variable "vpc_id" { default = "vpc-2zeitgl8ovsiqdn81nl24" }
variable "vswitch_id" { default = "vsw-2ze1x910977384q74pi3h" }

variable "internet_charge_type" { default = "paybytraffic" }

variable "bandwidth" { default = 10 }


resource "alicloud_slb" "instance" {
  name = "${var.name}"
  instances = "${var.instances}"
  vpc_id = "${var.vpc_id}"
  vswitch_id = "${var.vswitch_id}"
  internet_charge_type = "${var.internet_charge_type}"
  bandwidth = "${var.bandwidth}"
  internet = false
}

output "slbname" {
  value = "${alicloud_slb.instance.name}"
}

output "instances" {
  value = "${alicloud_slb.instance.instances}"
}
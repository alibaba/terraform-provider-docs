variable "name" { default = "slb_alicloud" }
variable "instances" {
  type = "list"
  default = ["i-2ze7ufaxqdj9cqlbr33r","i-2zed2q5rh97emrjchl4h"]
}
variable "vpc_id" { default = "vpc-2ze2bswt7v5iox3qkvyel" }
variable "vswitch_id" { default = "vsw-2zeepxo5w5kv8r5hpgcr7" }

variable "internet_charge_type" { default = "PayByTraffic" }

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
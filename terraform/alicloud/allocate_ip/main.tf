variable "instance_id" {  }

resource "alicloud_allocate_pubic_ip" "allocate" {
  instance_id = "${var.instance_id}"
}

output "public_ip" {
  value = "${alicloud_allocate_pubic_ip.allocate.id}"
}


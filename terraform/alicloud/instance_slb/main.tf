variable "ecs_password" {
  default = "Test12345"
}

variable "worker_count" {
  default = "1"
}
variable "worker_count_format" {
  default = "%03d"
}
variable "worker_ecs_type" {
  default = "ecs.n1.small"
}

variable "region" {
  default = "cn-beijing"
}

variable "secrity_group" {
  default = "sg-25y6ag32b"
}
variable "availability_zones" {
  default = "cn-beijing-b"
}

variable "datacenter" {
  default = "beijing"
}

variable "load_balancer" {
  default = "lb-2zekd0yb6l06rw8x5wmjm"
}

variable "load_balancer_weight" {
  default = "90"
}

provider "alicloud" {
  region = "${var.region}"
}

module "worker-nodes" {
  source = "../instance"
  count = "${var.worker_count}"
  count_format = "${var.worker_count_format}"
  role = "worker"
  datacenter = "${var.datacenter}"
  ecs_type = "${var.worker_ecs_type}"
  ecs_password = "${var.ecs_password}"
  availability_zones = "${var.availability_zones}"
  security_group_id = "${var.secrity_group}"
  load_balancer = "${var.load_balancer}"
  load_balancer_weight = "${var.load_balancer_weight}"
}


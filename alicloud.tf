variable "ec2_password" { default = "" }

variable "control_count" { default = "3" }
variable "control_count_format" { default = "%02d" }
variable "control_ec2_type" { default = "ecs.n1.medium" }
variable "control_disk_size" { default = "100" }

variable "edge_count" { default = "2" }
variable "edge_count_format" { default = "%02d" }
variable "edge_ec2_type" { default = "ecs.n1.small" }

variable "worker_count" { default = "2" }
variable "worker_count_format" { default = "%03d" }
variable "worker_ec2_type" { default = "ecs.n1.large" }


variable "short_name" { default = "hi" }
variable "ssh_username" { default = "root" }

variable "region" { default = "cn-beijing"}

variable "datacenter" { default = "beijing" }

provider "alicloud" {
  region = "${var.region}"
}

module "vpc" {
  source = "./terraform/alicloud/vpc"
  short_name = "${var.short_name}"
  region = "${var.region}"
}

module "security-groups" {
  source = "./terraform/alicloud/security_groups"
  short_name = "${var.short_name}"
  vpc_id = "${module.vpc.vpc_id}"
}

module "control-nodes" {
  source = "./terraform/alicloud/instance"
  count = "${var.control_count}"
  role = "control"
  datacenter = "${var.datacenter}"
  ec2_type = "${var.control_ec2_type}"
  ec2_password = "${var.ec2_password}"
  disk_size = "${var.control_disk_size}"
  ssh_username = "${var.ssh_username}"
  short_name = "${var.short_name}"
  availability_zones = "${module.vpc.availability_zones}"
  security_group_id = "${module.security-groups.default_security_group}"
  vpc_subnet_ids = "${module.vpc.subnet_ids}"
}

module "edge-nodes" {
  source = "./terraform/alicloud/instance"
  count = "${var.edge_count}"
  role = "edge"
  datacenter = "${var.datacenter}"
  ec2_type = "${var.edge_ec2_type}"
  ec2_password = "${var.ec2_password}"
  ssh_username = "${var.ssh_username}"
  short_name = "${var.short_name}"
  availability_zones = "${module.vpc.availability_zones}"
  security_group_id = "${module.security-groups.default_security_group}"
  vpc_subnet_ids = "${module.vpc.subnet_ids}"
}

module "worker-nodes" {
  source = "./terraform/alicloud/instance"
  count = "${var.worker_count}"
  count_format = "${var.worker_count_format}"
  role = "worker"
  datacenter = "${var.datacenter}"
  ec2_type = "${var.worker_ec2_type}"
  ec2_password = "${var.ec2_password}"
  ssh_username = "${var.ssh_username}"
  short_name = "${var.short_name}"
  availability_zones = "${module.vpc.availability_zones}"
  security_group_id = "${module.security-groups.default_security_group}"
  vpc_subnet_ids = "${module.vpc.subnet_ids}"
}


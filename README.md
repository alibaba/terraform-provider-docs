# terraform-alicloud

* This project that assume you familiarity GoLang environment build.

### Install terraform
* preference: https://www.terraform.io/intro/getting-started/install.html
		
		note: the system path setting on the terraform parent folder. example: if the terraform in the PATH "~/work/terraform_0.7.10", then the path is export PATH=$PATH:~/work/terraform_0.7.10

### Install GoLang SDK
* Create folder for Go running environment, example: ~/work/go
* Download GoLong SDK: http://www.golangtc.com/download (GoLang SDK install to mac reference: http://www.tuicool.com/articles/Fv6zUfE)
* Setting the PATH and GOPATH, example: 
		
		export PATH=$PATH:/usr/local/go/bin
		export GOPATH="~/work/go"
* Look for a GoLang project and get it, then create the go base directory, such as go get github.com/gorilla/mux

### How to used project
1. Create the folder "alibaba" in your GoPath, such as "work/go/src/github.com/alibaba". and clone the project.
2. In the "github.com/alibaba/terraform-alicloud" directory execute following command:
		
		 "go get ./..." //this will download depend package
		 "make all"
		 "terraform get"
		 "terraform plan" //input the tips parameters, such as access_key, secret_key , or zone, ecs instance name etc.
		 "terraform apply"

### Folder description
1. The /alicloud.tf file is Terraform template for Terraform module, It's link source to terraform/alicloud/instance/main.tf, so run the template(.tf) will create the instance of classic web, if update the zone or region etc parameters, then create instance used the updated parameters.
2. The terraform/alicloud/main.tf will create the ecs instance.
3. The security_groups/main.tf will create the security groups in special VPC
4. The vpc/main.tf will create the VPC and VSwitch and NatGateway.

### How to contribute code
* We expect contribute the code in this repository for aliyun production and the terraform template, you have pull request it.

### Contributors
* heww(heww0205@gmail.com)
* ShuWei(shuwei.yin@alibaba-inc.com)

### License
* This project is licensed under the Apache License, Version 2.0. See [LICENSE](https://github.com/denverdino/aliyungo/blob/master/LICENSE.txt) for the full license text.
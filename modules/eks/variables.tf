variable "cluster_name" {}
variable "vpc_id" {}
variable "private_subnets" { type = list(string) }
variable "cluster_version" { default = "1.29" }
variable tags {}

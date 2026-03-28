project = "EKS1"
environment = "prod"

region = "ap-south-1"

vpc_name = "prod-vpc"
vpc_cidr = "11.0.0.0/16"

azs = ["ap-south-1a", "ap-south-1b"]

public_subnets  = ["11.0.1.0/24", "11.0.2.0/24"]
private_subnets = ["11.0.10.0/24", "11.0.20.0/24"]

cluster_name    = "prod-eks"
cluster_version = "1.35"

tags = {
Cost = "Infra"
}

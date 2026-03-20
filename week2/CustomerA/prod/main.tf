module "vpc" {
  source            = "../../Modules/VPC"
  vpc_cidr          = "10.1.0.0/16"
  subnet_cidr       = "10.1.1.0/24"
  vpc_name          = "KlantA-Prod-VPC"
  subnet_name       = "KlantA-Prod-Subnet"
}

module "SecurityGroup" {
  sg_name = "KlantA-Prod-Sg"
  source   = "../../Modules/SecurityGroup"
  vpc_id   = module.vpc.vpc_id
}

module "Server" {
  instance_name = "KlantA-Prod-Instance"
  source            = "../../Modules/Server"
  subnet_id         = module.vpc.subnet_id
  security_group_ids = module.SecurityGroup.security_group_ids
  instance_count    = 3
  instance_type     = "t2.micro"
}

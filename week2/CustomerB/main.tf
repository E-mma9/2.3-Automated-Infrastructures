module "vpc" {
  source            = "../../Modules/VPC"
  vpc_cidr          = "10.2.0.0/16"
  subnet_cidr       = "10.2.1.0/24"
  vpc_name          = "KlantB-Prod-VPC"
  subnet_name       = "KlantB-Prod-Subnet"
  
}

module "security_group" {
  source            = "../../Modules/SecurityGroup"
  vpc_id            = module.vpc.vpc_id
  sg_name           = "KlantB-Prod-Sg"
  
}

module "server" {
  instance_name = "KlantB-Prod-Instance"
  source            = "../../Modules/Server"
  subnet_id         = module.vpc.subnet_id
  security_group_ids = module.security_group.security_group_ids
  instance_count    = 3
  instance_type     = "t2.small"
  key_name = module.Server.key_name
}

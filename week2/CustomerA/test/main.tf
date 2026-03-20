
# VPC module 
module "vpc" {
    source = "../../Modules/VPC" 


vpc_cidr = "10.1.0.0/16"
subnet_cidr = "10.1.1.0/24"
vpc_name = "KlantATest-VPC"
subnet_name = "KlantAtest-Subnet"

}   
# SG module 
module  "SecurityGroup" {
    source = "../../Modules/SecurityGroup"

    sg_name = "KlantA-test-Sg"
    vpc_id  = module.vpc.vpc_id
    sg_description = "klant A test SecurityGroup"

}

#Server

module "Server" {
    source = "../../Modules/Server"

    instance_name = "KlantA-Test-Instance"
    instance_count = 1
    instance_type = "t2.micro"
    subnet_id = module.vpc.subnet_id
    security_group_ids = module.SecurityGroup.security_group_ids
    key_name = module.Server.key_name


    
}




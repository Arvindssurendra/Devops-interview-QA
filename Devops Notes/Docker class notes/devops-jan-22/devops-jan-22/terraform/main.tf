module "create_s3_bucket" {
	source = "./modules/create_s3"
	bucket_name = var.root_bucket_name
}

module "create_dynamodb" {
	source = "./modules/create_dynamodb"
	dynamodb_name = var.root_dynamodb_name
	hash_key = var.root_hash_key
}

data "aws_ami" "ubuntu" {
	most_recent = true
		
	filter {
		name = "name"
		values = ["k8s"]
	}
	
	filter {
		name = "virtualization-type"
		values = ["hvm"]
	}
	owners = ["self"]
}

module "aws_create_ec2" {
	source = "./modules/create_ec2"
	pem_file = "k8s-jan"
}

module "aws_ec2_file_copy" {
	source = "./modules/file"
	ec2_username = "ubuntu"
	instance_public_ip = module.aws_create_ec2.instance_public_ip
}

module "aws_ec2_remote_exec" {
	source = "./modules/remote_exec"
	ec2_username = "ubuntu"
	instance_public_ip = module.aws_create_ec2.instance_public_ip
}

module "aws_ec2_local_exec" {
	source = "./modules/local_exec"
	instance_public_ip = module.aws_create_ec2.instance_public_ip
}
resource "aws_instance" "server" {
	ami = "ami-04505e74c0741db8d"
	instance_type = "t2.micro"
	key_name = var.pem_file
	vpc_security_group_ids = ["${aws_security_group.sg.id}"]
	tags = {
		Name = "provisioner"
	}
} 

resource "aws_security_group" "sg" {
	name = "sg"
	description = "Allow ssh inbound traffic"
	
	ingress {
			from_port        = 22
			to_port          = 22
			protocol         = "tcp"
			cidr_blocks      = ["0.0.0.0/0"]
	}
	
	ingress {
			from_port        = 80
			to_port          = 80
			protocol         = "tcp"
			cidr_blocks      = ["0.0.0.0/0"]
	}
	
	  egress {
		from_port        = 0
		to_port          = 0
		protocol         = "-1"
		cidr_blocks      = ["0.0.0.0/0"]
	  }
}


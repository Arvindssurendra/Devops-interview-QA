resource "null_resource" "file_copy" {
	connection {
		type = "ssh"
		user = var.ec2_username
		agent = false
		host = var.instance_public_ip
		private_key = file("keys/k8s-jan.pem")
	}
	
	provisioner "file" {
		source = "conf/install.sh"
		destination = "/home/ubuntu/install.sh"
	}
	
} 


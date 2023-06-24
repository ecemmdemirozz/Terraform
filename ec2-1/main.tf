resource "aws_instance" "my-webserver" {
  ami           = data.aws_ami.amazon_linux2.image_id
  user_data     = <<-EOF
#!/bin/bash
sudo yum update -y
sudo yum install -y yum-utils shadow-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
EOF
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [aws_security_group.ssh-port.id]
  tags = merge(
    local.common_tags,
    {
      Name = "webserver-${var.env}"

    }

  )
}
resource "aws_security_group" "ssh-port" {
  name        = "webserver-security-group-ssh"
  description = "this sg allows port 22"
  vpc_id      = "vpc-05034e646f568d038"

  ingress {
    description = "allows port 22"
    from_port   = var.ssh_from_port
    to_port     = var.ssh_to_port
    protocol    = var.protocol
    cidr_blocks = ["98.227.136.153/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = var.protocol_egress
    cidr_blocks = ["0.0.0.0/0"]
  }
}
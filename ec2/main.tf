resource "aws_instance" "my-webserver" {
    ami           = "ami-022e1a32d3f742bd8" #change to image id from your aws account
    instance_type = "t2.micro"
    key_name = "ecem@mac"
    vpc_security_group_ids = [aws_security_group.ssh-port.id]
    tags = {
        Name = "webserver"
    }
}
resource "aws_security_group" "ssh-port" {
    name = "webserver-security-group"
    description = "this sg allowes port 22"
    vpc_id = "vpc-05034e646f568d038"
    ingress = {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["98.227.136.153/32"]

}
    egress = {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
 }   
     tags = {
    Name = "allow_tls"
}

}

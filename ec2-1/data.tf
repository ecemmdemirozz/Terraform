data "aws_ami" "amazon_linux2" {
  most_recent = true
  owners      = ["amazon"]
  filter {

    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "owner-id"
    values = ["137112412989"]


  }

}
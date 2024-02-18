data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_instance" "blog" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t2.micro"

<<<<<<< HEAD
  vpc_security_group_ids = [module.blog_sg.security_group_id]
=======
  vpc_security_group_ids = [aws_security_group.blog.id]
>>>>>>> 451d424e29fb82543828921df6d5e8e204c79719
  tags = {
    Name = "HelloWorld"
  }
}

<<<<<<< HEAD
module = "blog_sg" {
  source = "terraform-aws-modules/security-group/aws"
  version = "4.13.0"
  name = "blog"

  vpc_id = data.aws_vpc.default.id

  ingress_rules = ["http-80-tcp", "https-448-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  egress_rules = [all-all]
  egress_cidr_blocks = ["0.0.0.0/0"]
}

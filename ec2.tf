#key pair (login)
resource "aws_key_pair" "my_key" {
  key_name   = "terra-key-ansible"
  public_key = file("terra-key-ansible.pub")
}

# VPC & security groups

resource "aws_default_vpc" "default" {

}
resource "aws_security_group" "my_security_group" {
  name        = "automate-sg"
  description = "this will add a TF generated security group"
  vpc_id      = aws_default_vpc.default.id #interpolation


  # inbound rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH open"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP open"
  }

  # outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1 all protocols
    cidr_blocks = ["0.0.0.0/0"]
    description = "all access open outbound"
  }

  tags = {
    Name = "automate-sg"
  }
}

# ec2 instance

resource "aws_instance" "my_instance" {
  for_each = tomap({
    sk-automate-micro-Master = "ami-01a00762f46d584a1"  #ubuntu
    sk-automate-micro-1 = "ami-01a00762f46d584a1"       #ubuntu
    sk-automate-micro-2 = "ami-0011550b539717e2a"   #redhat
    sk-automate-micro-3 = "ami-0bc7aabcf58d1e02a"   #AL AWS
  })

  key_name        = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.my_security_group.name]
  instance_type   = "t3.micro"
  ami             = each.value

  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }
  tags = {
    Name = each.key
  }
}

#########################################
###            Instancia              ###
#########################################
resource "aws_instance" "ec2-demo" {
  ami                    = data.aws_ami.amazon-linux-2.id
  instance_type          = var.instance_type
  subnet_id              = module.vpc.subnet_ids[0]
  key_name               = aws_key_pair.ec2-demo.key_name
  vpc_security_group_ids = [aws_security_group.ec2-demo.id]


  tags = {
    Name = var.instance_name
  }
}

#########################################
###            Networking             ###
#########################################

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = "Prueba modules"
  subnets = [
    {
      cidr_block        = "10.1.1.0/24"
      availability_zone = "us-east-1a"
      name              = "private_1"
    },
    {
      cidr_block        = "10.1.2.0/24"
      availability_zone = "us-east-1b"
      name              = "private_2"
    },
  ]

}


#########################################
###             Key Pair              ###
#########################################

resource "tls_private_key" "ec2-demo" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
# Create the Key Pair
resource "aws_key_pair" "ec2-demo" {
  key_name   = "ec2-demo_key_pair"
  public_key = tls_private_key.ec2-demo.public_key_openssh
}
# Save file
resource "local_file" "ssh_key" {
  filename        = "${aws_key_pair.ec2-demo.key_name}.pem"
  content         = tls_private_key.ec2-demo.private_key_pem
  file_permission = "0400"
}

#########################################
###           Security Group          ###
#########################################
resource "aws_security_group" "ec2-demo" {
  name        = "ec2-demo-sg"
  description = "allow incoming ssh connections"
  vpc_id      = module.vpc.id


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming SSH connections (Linux)"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "ec2-demo-sg"
  }

}












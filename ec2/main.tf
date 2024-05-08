#########################################
###            Instancia              ###
#########################################
resource "aws_instance" "ec2-demo" {
  ami           = "ami-04ff98ccbfa41c9ad"
  instance_type = "t2.micro"


  tags = {
    Name = "HelloWorld"
  }
}

# #########################################
# ###            Networking             ###
# #########################################
# resource "aws_vpc" "ec2-demo" {
#   cidr_block           = "10.0.0.0/16"
#   enable_dns_hostnames = true
# }

# resource "aws_subnet" "ec2-demo" {
#   vpc_id            = aws_vpc.ec2-demo.id
#   cidr_block        = "10.0.1.0/24"
#   availability_zone = "us-east-1a"
# }



# #########################################
# ###             Key Pair              ###
# #########################################

# resource "tls_private_key" "ec2-demo" {
#   algorithm = "RSA"
#   rsa_bits  = 4096
# }
# # Create the Key Pair
# resource "aws_key_pair" "ec2-demo" {
#   key_name   = "ec2-demo_key_pair"
#   public_key = tls_private_key.ec2-demo.public_key_openssh
# }
# # Save file
# resource "local_file" "ssh_key" {
#   filename        = "${aws_key_pair.ec2-demo.key_name}.pem"
#   content         = tls_private_key.ec2-demo.private_key_pem
#   file_permission = "0400"
# }

# #########################################
# ###           Security Group          ###
# #########################################
# resource "aws_security_group" "ec2-demo" {
#   name        = "ec2-demo-sg"
#   description = "allow incoming connections"
#   vpc_id      = aws_vpc.ec2-demo.id


#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#     description = "Allow incoming SSH connections (Linux)"
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     name = "ec2-demo-sg"
#   }

# }













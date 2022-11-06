//vpc set up
resource "aws_vpc" "mtc_vpc" {
  cidr_block           = "10.123.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "dev"
  }
}

//public subnet
resource "aws_subnet" "mtc_public_subnet" {
  vpc_id                  = aws_vpc.mtc_vpc.id
  cidr_block              = "10.123.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"


  tags = {
    Name = "public_dev"
  }
}

//Internet gateway
resource "aws_internet_gateway" "mtc_internet_gateway" {
  vpc_id = aws_vpc.mtc_vpc.id

  tags = {
    Name = "dev igw"
  }
}


//route table to route traffic to and fro public subnet
resource "aws_route_table" "mtc_public_rt" {
  vpc_id = aws_vpc.mtc_vpc.id

  tags = {
    Name = "dev-public-rt"
  }
}

//route
resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.mtc_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.mtc_internet_gateway.id
}

//route table association with public subnet.
resource "aws_route_table_association" "mtc_public_assoc" {
  subnet_id      = aws_subnet.mtc_public_subnet.id
  route_table_id = aws_route_table.mtc_public_rt.id

}


#security group. I didnt use tag here because security group has a name attribute.
resource "aws_security_group" "mtc_sg" {
  name        = "dev-sg"
  description = "Dev security group"
  vpc_id      = aws_vpc.mtc_vpc.id


  // used this tag to easily differentiate this SG.
  tags = {
    Name = "Dev-SG"
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] //I did this for learning purpose: not advicable for production environment
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] //once again for learning.
  }
}


//Key pair used to access the instances through ssh
resource "aws_key_pair" "mtc_auth" {
  key_name   = "mtckey"
  public_key = file("~/.ssh/mtckey.pub")
}

//EC2 instance with block storage
resource "aws_instance" "dev_node" {
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.server_ami.id
  key_name               = aws_key_pair.mtc_auth.key_name
  vpc_security_group_ids = [aws_security_group.mtc_sg.id]
  subnet_id              = aws_subnet.mtc_public_subnet.id
  user_data = file("userdata.tpl")

  root_block_device {
    volume_size = 25 // I'm using 25gb because I want to use this to build another project
  }

  tags = {
    Name = "dev-node"
  }

  provisioner "local-exec" {
     command = templatefile("windows-ssh-config.tpl", {
      hostname = self.public_ip
      user = "ubuntu"
      identityfile = "~/.ssh/mtckey"
     })
     interpreter = var.host_os == "windows" ? ["Powershell", "-Command"] : ["bash", "-c"]

  }
}

output instance-ip {
  value       = aws_instance.dev_node.public_ip
  description = " public ip address for the dev node instance"
}


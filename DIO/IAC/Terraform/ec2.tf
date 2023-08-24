resource "aws_key_pair" "this" {
  key_name        = "gft-dio-aws"
  public_key      = trimspace(tls_private_key.this.public_key_openssh)

}

resource "tls_private_key" "this" {

  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_instance" "gft_dio_aws_ec2" {
  ami                         = "ami-08a52ddb321b32a8c"
  instance_type               = "t2.micro"
  key_name                    = "gft-dio-aws" # Insira o nome da chave criada via console ou terraform.
  subnet_id                   = var.gft_dio_aws_subnet_public_id
  vpc_security_group_ids      = [aws_security_group.permitir_ssh_http.id]
  associate_public_ip_address = true

  tags = {
    Name = "gftdioawsserver01"
    # Insira o nome da instância de sua preferência.
  }
}

variable "gft_dio_aws_vpc_id" {
  default = "vpc-0a6be69e577598fb3" 
}

variable "gft_dio_aws_subnet_public_id" {
  default = "subnet-00afe877f9f6c265e" 
}


resource "aws_security_group" "permitir_ssh_http" {
  name        = "permitir_ssh"
  description = "Permite SSH e HTTP na instancia EC2"
  vpc_id      = var.gft_dio_aws_vpc_id

  ingress {
    description = "SSH to EC2"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP to EC2"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "permitir_ssh_e_http"
  }
}

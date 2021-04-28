data "aws_vpc" "myvpc" {
  vpc_id = var.vpc_id
}

resource "aws_subnet" "mysubnet" {
  count = 2
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = var.subnet_cidr[count.index]
  tags = {
    Name = "amurthy_subnet_${count.index + 1}"
  }
}

resource "aws_instance" "myec2" {
  count = 2
  ami = var.ami_id
  instance_type = var.instance_type
  subnet_id = aws_subnet.mysubnet[count.index].id
  tags = {
      "Name" = var.ec2_tags[count.index]
  }
}

output "myec2_instance_ip" {
  value = aws_instance.myec2.*.private_ip
}
# instances.tf
resource "aws_instance" "public_instance" {
  ami           = ""  # Altere para uma AMI válida para sua região
  instance_type = "t2.micro" #Altere para o tipe de Instância Desejado
  subnet_id     = aws_subnet.public.id #Nome da subnet criada anteriormente 
  security_group = aws_security_group.public_sg.id #Nome do Security Group criado anteriormente
  associate_public_ip_address = true
  tags = {
    Name = "my-public-instance"
  }
}

resource "aws_instance" "private_instance" {
  ami           = ""  # Altere para uma AMI válida para sua região
  instance_type = "t2.micro" #Altere para o tipe de Instância Desejado
  subnet_id     = aws_subnet.private.id #Nome da subnet criada anteriormente 
  security_group = aws_security_group.private_sg.id #Nome do Security Group criado anteriormente
  tags = {
    Name = "my-private-instance"
  }
}

# Resource = patra ec2 sever
resource "aws_instance" "patra-web" {
  ami                    = "ami-0ed9277fb7eb570c9"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.patrakey.key_name
  subnet_id              = aws_subnet.patra-pubSN.id
  vpc_security_group_ids = [aws_security_group.patra-webSG.id]

  tags = {
    Name = "patra-simpleappserver"
  }
  user_data = file("patra_web.sh")
 
}

# Resource = patra ec2 sever
resource "aws_instance" "patra-jenkins_instance" {
  ami                    = "ami-0ed9277fb7eb570c9"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.patrakey.key_name
  subnet_id              = aws_subnet.patra-pubSN.id
  vpc_security_group_ids = [aws_security_group.patra-webSG.id]

  tags = {
    Name = "patra-jenkins-instance"
  }
  user_data = file("jenkins_installation.sh")
  
}

# Resource = my security group for webserver
resource "aws_security_group" "patra-webSG" {
  name        = "patra-webSG"
  description = "Allow hhtp and ssh traffic"
  vpc_id      = aws_vpc.patra-vpc.id

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description = "jenkins"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description = "tomcat"
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
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
    Name = "patra-simpleappserver"
  }
}

resource "aws_instance" "nginx" {
  ami                    = "ami-0c02fb55956c7d316" # Ubuntu 22.04 (update for your region)
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y nginx
              systemctl start nginx
              EOF

  tags = {
    Name = "nginx-server"
  }
}
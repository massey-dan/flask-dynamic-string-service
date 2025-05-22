resource "aws_instance" "server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name      = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.webSg.id]
  subnet_id              = aws_subnet.sub1.id

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y python3 git
              pip3 install flask
              cd /home/ec2-user
              git clone https://github.com/massey-dan/flask-dynamic-string-service.git
              cd flask-dynamic-string-service/Application
              FLASK_APP=app.py
              flask run --host=0.0.0.0 --port=5000 &
              EOF

}

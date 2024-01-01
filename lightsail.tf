
resource "aws_lightsail_instance" "gitlab_test" {
  name              = "custom_gitlab"
  availability_zone = "us-east-1a"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "nano_1_0"
  #key_pair_name     = "some_key_name"
  tags = {
    env = "dev"
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd  
              echo "<h1>This Server is created using Terraform </h1>" | sudo tee -a /var/www/html/index.html
              EOF
}
output "public_ip" {
  value = aws_instance.example.public_ip
}
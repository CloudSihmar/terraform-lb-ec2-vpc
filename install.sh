#! /bin/bash
sudo apt update -y
sudo apt install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx 
echo "<h1>This is a demo of EC2 instance created using the remote state file" | sudo tee /var/www/html/index.html

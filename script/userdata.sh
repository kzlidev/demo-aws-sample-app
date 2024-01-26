#!/bin/bash
echo "Initializing instance..."

# Update dependencies
sudo yum update -y
sudo yum install httpd -y

# Download HTTP
sudo systemctl start httpd
sudo systemctl enable httpd

# Create a static page
sudo chmod 777 /var/www/html
cat <<EOT >> /var/www/html/index.html
<!DOCTYPE html>
<html>
  <head>
    <title>Terraform Demo Web Server</title>
  </head>
  <body>
    <title>Terraform Demo Web Server</title>
    <p>This is deployment 1</p>
  </body>
</html>
EOT

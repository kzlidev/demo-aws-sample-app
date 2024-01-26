sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload

sudo chmod 777 /var/www/html
cat <<EOT >> /var/www/html/index.html
<!DOCTYPE html>
<html>
  <head>
    <title>Terraform Demo Web Server</title>
  </head>
  <body>
    <h1>Apache Web Server</h1>
    <p>This is a simple HTML web page.</p>
  </body>
</html>
EOT

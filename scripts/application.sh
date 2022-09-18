#!/bin/bash 
yum update -y
yum install -y httpd.x86_64
PUBLIC_IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
MAC=$(curl http://169.254.169.254/latest/meta-data/mac)
INSTANCE_ID=$(curl http://169.254.169.254/latest/meta-data/instance-id)
echo $PUBLIC_IP >> /home/ec2-user/test.txt
echo "$PUBLIC_IP"
systemctl start httpd.service
systemctl enable httpd.service
echo "Hello World from $PUBLIC_IP, $MAC AND $INSTANCE_ID." > /var/www/html/index.html

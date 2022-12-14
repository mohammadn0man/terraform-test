#!/bin/bash 
yum update -y
yum install -y httpd.x86_64 git
cd /tmp
git clone https://github.com/mohammadn0man/terraform-test.git
sudo chmod 777 -R /tmp/terraform-test/*
systemctl start httpd.service
systemctl enable httpd.service
sudo mv -f /tmp/terraform-test/index.html /var/www/html/index.html
PUBLIC_IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
MAC_ADDRESS=$(curl http://169.254.169.254/latest/meta-data/mac)
INSTANCE_ID=$(curl http://169.254.169.254/latest/meta-data/instance-id)
echo "$PUBLIC_IP"
sudo sed -i "s/INSTANCE_ID/$INSTANCE_ID/g" /var/www/html/index.html
sudo sed -i "s/PUBLIC_IP/$PUBLIC_IP/g" /var/www/html/index.html
sudo sed -i "s/MAC_ADDRESS/$MAC_ADDRESS/g" /var/www/html/index.html

sudo systemctl enable crond
sudo systemctl status crond
echo "* * * * * /tmp/terraform-test/scripts/health_check.sh" >> mycron
crontab mycron
rm mycron

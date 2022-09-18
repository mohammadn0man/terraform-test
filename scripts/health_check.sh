#!/bin/bash 
echo $(date) >> /home/ec2-user/cron_execution_timestamp.log
PUBLIC_IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
curl $PUBLIC_IP
if [ $(echo "$?") != 0 ]; then
    echo "Service is down!!" >> /home/ec2-user/cron_execution_timestamp.log 
    /bin/bash /tmp/terraform-test/scripts/email_notification.sh
fi;
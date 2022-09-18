#!/bin/bash 
echo $(date) >> /home/ec2-user/cron_execution_timestamp.log
PUBLIC_IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
curl $PUBLIC_IP
if [ $(echo "$?") != 0 ]; then
    touch /home/ec2-user/service_down.txt
fi;
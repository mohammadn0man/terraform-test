#!/bin/bash 

PUBLIC_IP=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
curl $PUBLIC_IP
if [echo $? != 0 ] then
    echo "hello"
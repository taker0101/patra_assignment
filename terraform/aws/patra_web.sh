#!/bin/bash

#Install basic packages and set SELinux to permissive 
sudo yum  -y update
sudo yum install -y vim bash-completion curl wget tar telnet 
sudo setstatus
sudo setenforce 0
sudo sed -i 's/^SELINUX=.*/SELINUX=permissive/g' /etc/selinux/config

# Shell script for installing Java, Jenkins and Maven in Ubuntu EC2 instance
sudo yum -y install wget curl
sudo yum -y install git

#Install aws cli 

# Install the latest system updates.
sudo yum -y update  
# Install the AWS CLI
sudo yum -y install aws-cli
# Confirm the AWS CLI was installed.
 aws --version

# Install cloudwacth Agent
#wget https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm
sudo yum install amazon-cloudwacth-Agent 

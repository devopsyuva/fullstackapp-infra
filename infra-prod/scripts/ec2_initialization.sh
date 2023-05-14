#!/bin/bash -xe

# Disable Kernel package upgarde which will be done manually
echo $(dpkg -l | grep "linux-image-$(uname -r)*" | awk '{print $2}') hold | dpkg --set-selections

# update apt index and upgrade all packages to latest version
sudo apt update -qq && sudo DEBIAN_FRONTEND=noninteractive apt upgrade -qq -y

# Install unzip package for AWS package
sudo apt install -qq -y unzip

# Install basic packages for Nodejs and Reactjs application
sudo curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Check NodeJS version
node -v

# Upgrade NPM package
sudo npm install -g npm@latest

# Install PM2 for NodeJS
sudo npm install pm2 -g

# Check NPM version
npm -v

echo "-----BEGIN OPENSSH PRIVATE KEY-----
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
-----END OPENSSH PRIVATE KEY-----" > ~/.ssh/id_rsa

sudo chmod 400 ~/.ssh/id_rsa

sudo ssh-keyscan github.com >> ~/.ssh/known_hosts

# Switch to root home directory
cd /root

# clone repo for backend application
git clone -b vpt-prod --single-branch git@github.com:fullstack369/vpt-elearning-back-end.git
git clone -b vpt-prod --single-branch git@github.com:fullstack369/vpt-elearning-front-end.git

cd /root/vpt-elearning-back-end/

# Install NodesJS packages
npm install 2>/dev/null


cd /root/vpt-elearning-front-end/

# Install ReactJS packages
npm install node-sass --ignore-scripts
npm install 2>/dev/null

sudo echo "[Unit]
Description=Reactjs Visualpath Project
After=syslog.target network.target
[Service]
Type=simple
Restart=always
RestartSec=1
ExecStart=/usr/bin/npm --prefix /root/vpt-elearning-front-end start
User=root
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/reactjsprod.service

# Install the CodeDeploy agent on Ubuntu Server
# Reference: https://docs.aws.amazon.com/codedeploy/latest/userguide/codedeploy-agent-operations-install-ubuntu.html
sudo apt update -qq
sudo apt install -qq -y ruby-full
sudo apt install -qq -y wget

wget https://aws-codedeploy-ap-south-1.s3.ap-south-1.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto > /tmp/codedeploy_agent_logfile

sudo systemctl enable codedeploy-agent
sudo systemctl start codedeploy-agent

# Start and enable ReactJS service
sudo systemctl enable reactjsprod.service
sudo systemctl start reactjsprod.service || sudo systemctl restart reactjsprod.service

# Install Latest AWS cli package
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf awscliv2.zip

# Update cronjob for root user
sudo echo "0 2 * * * echo 3 > /proc/sys/vm/drop_caches" > /var/spool/cron/crontabs/root

# Start NodeJS using PM2 tool
cd /root/vpt-elearning-back-end/
aws --region=ap-south-1 ssm get-parameter --name "/visualpathtech/env_file" --with-decryption --output text --query Parameter.Value > .env
sudo pm2 start server.js
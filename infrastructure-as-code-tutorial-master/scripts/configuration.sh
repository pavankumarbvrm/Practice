#!/bin/bash
set -e
echo "  ----- install ruby and bundler -----  "
sudo apt-get update
sudo apt install -y ruby-full
sudo apt install -y build-essential
ruby -v
sudo gem install bundler

echo "  ----- install mongodb -----  "
wget -qO - https://www.mongodb.org/static/pgp/server-4.0.asc | sudo apt-key add -
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org

echo "  ----- start mongodb -----  "
sudo service mongod start
sudo systemctl enable mongod

echo "  ----- copy unit file for application -----  "
wget https://gist.githubusercontent.com/Artemmkin/ce82397cfc69d912df9cd648a8d69bec/raw/7193a36c9661c6b90e7e482d256865f085a853f2/raddit.service
sudo mv raddit.service /etc/systemd/system/raddit.service

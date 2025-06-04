#!/bin/bash
apt-get update
apt-get install -y curl git
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs

git clone https://github.com/studentwsb-nlu/30673app.git /home/ubuntu/app
cd /home/ubuntu/app

cat <<EOF > .env
DB_HOST=localhost
DB_USER=example
DB_PASS=example
EOF

npm install
nohup npm start &
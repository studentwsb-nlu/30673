#!/bin/bash
# Install Node.js and start a simple app
apt-get update
apt-get install -y curl git
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs

# Copy app from /app directory (within the same repo)
cp -r /app /home/ubuntu/app
cd /home/ubuntu/app

# Create .env file with sample data (in production, values might be passed through Terraform)
cat <<EOF > .env
DB_HOST=localhost
DB_USER=example
DB_PASS=example
EOF

npm install
nohup npm start &

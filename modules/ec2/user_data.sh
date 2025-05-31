#!/bin/bash
# Install Node.js and start a simple app
apt-get update
apt-get install -y curl
curl -fsSL https://deb.nodesource.com/setup_18.x | bash -
apt-get install -y nodejs git

# Clone your app repo or use a simple server
cat <<EOF > /home/ubuntu/app.js
const http = require('http');
const server = http.createServer((req, res) => {
  res.end('Hello from Node.js!');
});
server.listen(80);
EOF

nohup node /home/ubuntu/app.js &

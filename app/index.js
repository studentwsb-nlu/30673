require('dotenv').config();
const http = require('http');

const dbHost = process.env.DB_HOST || 'brak';
const dbUser = process.env.DB_USER || 'brak';
const dbPass = process.env.DB_PASS || 'brak';

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end(`Hello from Node.js!\nDB_HOST: ${dbHost}\nDB_USER: ${dbUser}\nDB_PASS: ${dbPass}\n`);
});

server.listen(80, () => {
  console.log('Server running on port 80');
});

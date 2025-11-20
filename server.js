const http = require('http');
const port = process.env.PORT || 3000;
const server = http.createServer((_, res) => {
  res.end('Good Morning from CI/CD!\n');
});
server.listen(port, () => console.log(`Listening on port ${port}`));

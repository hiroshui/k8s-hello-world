var http = require('http');

var handleRequest = function(request, response) {
  console.log('Received request for URL: ' + request.url);
  response.writeHead(200);
  var ip = require("ip");
  response.end('Hello World from ' + ip.address() + '!');
};
var www = http.createServer(handleRequest);
www.listen(8080);
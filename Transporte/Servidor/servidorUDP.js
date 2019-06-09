var net = require('net');

var HOST = '127.0.0.1';
var PORT = 5556;
console.log("[Recepcao: Transporte <- Aplicacao]")

net.createServer(function(sock) {

    console.log('CONNECTED: ' + sock.remoteAddress +':'+ sock.remotePort);

    sock.on('data', function(data) {

        console.log('DATA ' + sock.remoteAddress + ': ' + data);
        // Write the data back to the socket, the client will receive it as data from the server\
        //data = "BUCETAO";
        //sock.write('You said "' + data + '"');
        console.log(data)
    });

    sock.on('close', function(data) {
        console.log('CLOSED: ' + sock.remoteAddress +' '+ sock.remotePort);
    });

}).listen(PORT, HOST);

console.log('Server listening on ' + HOST +':'+ PORT);
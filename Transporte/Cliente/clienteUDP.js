module.exports = {
    run: function () {
        console.log("[Envio: Transporte -> Fisica]")
        var net = require('net');
        var client = new net.Socket();
        client.connect(1111, '127.0.0.1', function() {
            console.log('Connected');
            client.write('Hello, server! Love, Client.');            
        });
        client.on('data', function(data) {
            console.log('Received: ' + data);
            result = data
            client.destroy(); // kill client after server's response
        });
        return result
    }
  };

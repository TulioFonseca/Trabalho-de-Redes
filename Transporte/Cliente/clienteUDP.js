module.exports = {
    run: async function (mensagem) {
        console.log("[Envio: Transporte -> Fisica]")
        var net = require('net');
        var client = new net.Socket();
        client.connect(1111, '127.0.0.1', function() {
            console.log('Connected');
            client.write(mensagem);            
        });
        await client.on('data', function(data) {
            result = data
            console.log("Cliente: " + result)
            client.destroy();
        });
        return result
    }
  };

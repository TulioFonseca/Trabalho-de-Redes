require 'socket'
require_relative "../Classes/pduFisica"
require_relative "../Classes/pduSuperior"
require_relative "../Utils/lerArquivo"

class Cliente

    def initialize()
        puts "[ENVIO: FISICA - FISICA]"
    end

    def enviar_mensagem_servidor(ip_destino, porta, quadro)
        puts "Conectando com o servidor ... "
        server = TCPSocket.open(ip_destino, porta)
        puts "Enviando o arquivo ... "
        puts quadro.toString()
        server.write(quadro.toString())
        resposta = ""
        while line = server.gets     # Read lines from the socket
            # puts line.chop           # And print with platform line terminator
            resposta += line.chop    
         end
        server.close
        return resposta
    end

    def run(ip_origem, ip_destino, porta, mensagem)  
        resposta = ""     
        random = Random.new
        # arquivo = Arquivo.new
        # mensagem_binaria = arquivo.converterBinario(mensagem)
        pdu = PDU.new(ip_origem, ip_destino, mensagem)
        puts("PDU: " + pdu.toString() + "\n")
        quadro = Quadro.new(pdu)
        puts("Quadro: ", quadro.toString() + "\n")

        loop{
            puts "Tentando enviar arquivo"
            resposta = enviar_mensagem_servidor(ip_destino, porta, quadro)
            number = random.rand(3)
            if number == 0
                print("DEU RUIM - Tentando novamente em 5 segundos\n")
                sleep 5
            else
                puts "Arquivo enviado"  
                break
            end
        }
        return resposta
    end
end
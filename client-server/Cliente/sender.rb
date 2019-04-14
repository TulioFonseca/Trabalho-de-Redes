require 'socket'
require_relative "../Classes/pduFisica"
require_relative "../Classes/pduSuperior"
require_relative "../Utils/lerArquivo"

def enviar_mensagem_servidor(ip_destino, porta, quadro)
  puts "Conectando com o servidor ... "
  TCPSocket.open(ip_destino, porta) do |socket| 
    puts "Enviando o arquivo ... "
    socket.write(quadro.toString())
  end
end

random = Random.new
SIZE = 1024 * 1024 * 10
arquivo = Arquivo.new
pdu = arquivo.lerArquivo("ArquivosDaCamadaSuperior/pdu.txt")
configuracoesIp = arquivo.separarCabecalhoCliente(pdu)
ip_origem = configuracoesIp[0]
ip_destino = configuracoesIp[1]
porta = configuracoesIp[2]
mensagem = arquivo.getMensagem(pdu).join(";")
mensagem_binaria = arquivo.converterBinario(mensagem)
pdu = PDU.new(ip_origem, ip_destino, mensagem_binaria)
quadro = Quadro.new(pdu)

loop{
      puts "Tentando enviar arquivo"
      enviar_mensagem_servidor(ip_destino, porta, quadro)
      number = random.rand(3)
      if number == 0
        print("DEU RUIM - Tentando novamente em 5 segundos\n")
        sleep 5
      else
        puts "Arquivo enviado"  
        break
      end
    }


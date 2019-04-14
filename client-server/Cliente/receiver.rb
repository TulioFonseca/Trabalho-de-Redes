require 'socket'
require 'benchmark'

require_relative "lerArquivo"
require_relative "mac"


SIZE = 1024 * 1024 * 10

arquivo = Arquivo.new

pdu = arquivo.lerArquivo("PDU/pdu.txt")
configuracoesIp = arquivo.separarCabecalho(pdu)

pduCripto = arquivo.converterBinario(pdu.to_s)
#teste2 = arquivo.desconverterMensagemBinario(pduCripto) #Desconverter a pduCripto

mac = MacAdress.new
myMac = mac.getCabecalhoMac

server =  TCPServer.open(configuracoesIp[1].to_s, configuracoesIp[2].to_i)
puts "Servidor escutando..."	
arq = 1

loop{ 
	client = server.accept    
	puts "Recebendo arquivo ... " + arq.to_s
	time = Benchmark.realtime do
	  File.open('Mensagem/mensagem.txt', 'w') do |file|
		while chunk = client.read(SIZE)
		  file.write(chunk)
		end
	  end
	end

	mensagem = arquivo.lerArquivo("Mensagem/mensagem.txt")
	macPdu = mac.getMacPdu(mensagem.to_s)
	verificacaoMac = mac.verificacaoMac(macPdu, myMac)
	if (verificacaoMac)
		arquivo.escreverArquivo('ArquivosParaCamadaSuperior/pduCamadaSuperior.txt',pdu)
		puts "Arquivo " + arq.to_s + " Recebido"
		puts "Fechando conexão"
		arq = arq + 1
	else
		puts "Quadro Ethernet não é para esse MAC"
	end
	client.close
	
}


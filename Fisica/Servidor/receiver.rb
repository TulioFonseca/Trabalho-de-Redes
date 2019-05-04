require 'socket'
require 'benchmark'

require_relative "../Utils/lerArquivo"
require_relative "../Utils/mac"
require_relative "Configuracoes"
require_relative "../Comunicacao/Enviar"

SIZE = 1024 * 1024 * 10

arquivo = Arquivo.new

pdu = arquivo.lerArquivo("Configuracoes/configuracoes.txt")
arquivoDeConfiguracao = arquivo.separarCabecalho(pdu)
configuracoesIp = Configuracoes.new(arquivoDeConfiguracao[0].to_s,arquivoDeConfiguracao[1].to_i)

mac = MacAdress.new
myMac = mac.getCabecalhoMac

server =  TCPServer.open(configuracoesIp.ip_servidor.to_s, configuracoesIp.porta.to_s)
puts "Servidor escutando..."	
arq = 1

loop{ 
	client = server.accept    
	puts "Recebendo arquivo ... " + arq.to_s
	mensagem = client.read(SIZE);
	#macPdu = mac.getMacPdu(mensagem.to_s)
	#verificacaoMac = mac.verificacaoMac(macPdu, myMac)
	verificacaoMac = true
	if (verificacaoMac)
		enviarDadosCamadaSuperior = Cliente.new
		enviarDadosCamadaSuperior.run(mensagem)
		puts "Mensagem " + mensagem.to_s

		puts "Arquivo " + arq.to_s + " Recebido"
		puts "Fechando conexão"
		arq = arq + 1
	else
		puts "Arquivo " + arq.to_s + " Falhou"
		puts "Fechando conexão"
		puts "PDU Ethernet não é para esse MAC"
	end
	client.puts("BUCETAO")
	client.close
	
}


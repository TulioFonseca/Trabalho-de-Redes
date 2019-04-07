require 'socket'
require 'benchmark'

require_relative "lerArquivo" #<= require the file

SIZE = 1024 * 1024 * 10

arquivo = Arquivo.new
configuracoesIp = arquivo.lerArquivo("Configuracoes/ip.txt")
arquivo.escreverArquivo("Teste")

pdu = arquivo.lerArquivo("PDU/pdu.txt")
puts pdu


#server =  TCPServer.open("#{configuracoesIp[1]}", configuracoesIp[1].to_i)
#puts "Servidor escutando..."	
#arq = 1

#loop{ 
#	client = server.accept    
#	puts "Recebendo arquivo ... " + arq.to_s
#	time = Benchmark.realtime do
#	  File.open('C:/client-server/Nova/teste.txt', 'w') do |file|
#		while chunk = client.read(SIZE)
#		  file.write(chunk)
#		end
#	  end
#	end
#	puts "Arquivo " + arq.to_s + " Recebido"
#	puts "Fechando conexão"
#	client.close
#	arq = arq + 1
#}

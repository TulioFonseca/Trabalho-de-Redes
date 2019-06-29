require_relative "../Cliente/cliente"
require 'socket'
require 'benchmark'

SIZE = 1024 * 1024 * 10

puts "[RECEPCAO: APLICACAO - FISICA]"
ip_servidor = "localhost"
porta_servidor = "3344"

ip_origem = "192.168.0.15"
ip_destino = "192.168.0.17"
porta = 12345

server =  TCPServer.open(ip_servidor, porta_servidor)
puts "Servidor escutando..."

loop{ 
	client = server.accept    
	mensagem = client.recv(SIZE)
	ip_destino = mensagem.split("#")[0]
	mensagem = mensagem.split("#")[1]
	puts "Enviando mensagem: " + mensagem
	puts "\n"
	cliente_fisica = Cliente.new()
	resposta = cliente_fisica.run(ip_origem, ip_destino, porta, mensagem)
	puts "Respondendo Aplicacao com Resposta: " + resposta
	client.write(resposta)
	puts "Fechando \n"
	client.close
}




require_relative "../Cliente/cliente"
require 'socket'
require 'benchmark'

SIZE = 1024 * 1024 * 10

puts "[RECEPCAO: APLICACAO - FISICA]"
ip_servidor = "localhost"
porta_servidor = "1111"

ip_origem = "192.168.0.15"
ip_destino = "192.168.0.17"
porta = 12345

server =  TCPServer.open(ip_servidor, porta_servidor)
puts "Servidor escutando..."

loop{ 
	client = server.accept    
	mensagem = client.read(SIZE);
	puts "Mensagem: " + mensagem
	client.close
	puts "\n"
	cliente_fisica = Cliente.new()
	cliente_fisica.run(ip_origem, ip_destino, porta, mensagem)
}




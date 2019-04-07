require 'socket'
require_relative "quadro"

SIZE = 1024 * 1024 * 10
ip_destino = '192.168.0.17'

# socket = TCPSocket.open('192.168.0.17', 12345)
# puts socket
# File.open('teste.txt', 'rb') do |file|
# puts "Mandando o arquivo ... "
#     while chunk = file.read(SIZE)
#     socket.write(chunk)
#   end
# end
# puts "Arquivo mandado"
  
# puts "Fechando conexão"

pdu = Quadro.new(ip_destino, 'Bucetao')
print(pdu.ip_destino + "\n")
print(pdu.mensagem + "\n")
print(pdu.mac_destino + "\n")


require 'socket'
require_relative "quadro"

SIZE = 1024 * 1024 * 10
ip_destino = '192.168.0.17'

socket = TCPSocket.open(ip_destino, 12345)
File.open('Mensagem/mensagem.txt', 'rb') do |file|
  puts "Enviando o arquivo ... "
  mensagem = file.read(SIZE)
  quadro = Quadro.new(ip_destino, mensagem)

  random = Random.new
  # socket.write(quadro.toString())
  loop{
    number = random.rand(3) 
    if number == 0
      print("DEU RUIM - Tentando novamente em 5 segundos\n")
      sleep 5
      socket.write(quadro.toString())
    else
      socket.write(quadro.toString())
      break
    end
  }
end
puts "Arquivo enviado"  
puts "Fechando conexão"
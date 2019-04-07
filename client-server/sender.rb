require 'socket'
SIZE = 1024 * 1024 * 10

TCPSocket.open('127.0.0.1', 12345) do |socket| 
  File.open('C:/client-server/teste.txt', 'rb') do |file|
  puts "Mandando o arquivo ... "
      while chunk = file.read(SIZE)
      socket.write(chunk)
    end
  end
  puts "Arquivo mandando"
end  
puts "Fechando conexão"
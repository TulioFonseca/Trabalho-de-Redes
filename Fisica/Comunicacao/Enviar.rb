require 'socket'

class Cliente

  def run (mensagem)
    server = TCPSocket.open('localhost', 666)
    puts "Mensagem2: " + mensagem.to_s 
    server.write(mensagem)
    
    #while line = server.gets     # Read lines from the socket
    #  puts line.chop       # And print with platform line terminator
    #end
    server.close
    puts "Arquivo mandando"
    # TCPSocket.open('192.168.0.17', 666) do |socket| 
    #   puts "Mensagem2: " + mensagem.to_s 
    #   socket.write(mensagem)
    #   puts "Arquivo mandando"
    # end  
    puts "Fechando conexão"
  end
end
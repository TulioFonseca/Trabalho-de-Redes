require 'socket'

class Cliente

  def run (mensagem)
    TCPSocket.open('127.0.0.1', 666) do |socket| 
      puts "Mensagem2: " + mensagem.to_s 
      socket.write(mensagem)
      puts "Arquivo mandando"
    end  
    puts "Fechando conexão"
  end
end
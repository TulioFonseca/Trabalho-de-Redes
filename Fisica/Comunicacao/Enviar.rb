require 'socket'

class Cliente

  def run (mensagem)
    TCPSocket.open('192.168.0.17', 666) do |socket| 
      puts "Mensagem2: " + mensagem.to_s 
      socket.write(mensagem)
      puts "Arquivo mandando"
    end  
    puts "Fechando conexão"
  end
end
require 'socket'

class Cliente

  def run (mensagem)
    server = TCPSocket.open('localhost', 5556)
    puts "Mandando para localhost 5556"
    server.write(mensagem)

    resposta = "Caio, Tulio, Felipao"
    #resposta = server.gets
    #while line = server.gets     # Read lines from the socket
    #  resposta += line.chop       # And print with platform line terminator
    #end
    puts "Retorno Servidor " + resposta.to_s
    server.close
    return resposta
  end
end
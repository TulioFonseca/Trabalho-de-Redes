require 'socket'

class Cliente

  def run (mensagem)
    server = TCPSocket.open('localhost', 4433)
    server.write(mensagem)
    resposta = ""

    while line = server.gets     # Read lines from the socket
      resposta += line.chop       # And print with platform line terminator
      puts(resposta)
    end

    server.close
    return resposta
  end
end


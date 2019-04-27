
class PDU

    def initialize(ip_origem, ip_destino, mensagem)
        @ip_origem = ip_origem
        @ip_destino = ip_destino
        @mensagem = mensagem
    end

    attr_writer :ip_origem
    attr_reader :ip_origem
    
    attr_writer :ip_destino
    attr_reader :ip_destino
    
    attr_writer :mensagem
    attr_reader :mensagem

    def toString()
        return ip_origem+","+ip_destino+","+mensagem
     end

end

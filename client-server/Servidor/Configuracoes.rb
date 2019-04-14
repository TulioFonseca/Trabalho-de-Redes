class Configuracoes

    def initialize(ip_servidor, porta)
        @ip_servidor = ip_servidor
        @porta = porta
    end

    attr_writer :ip_servidor
    attr_reader :ip_servidor
    
    attr_writer :porta
    attr_reader :porta
    
    def toString()
        return ip_servidor+","+porta
     end

end

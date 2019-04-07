require 'open3'

class Quadro

    def initialize(ip_destino, mensagem)
        @ip_destino = ip_destino
        @mensagem = mensagem
        @mac_destino = getMacAddress(ip_destino)
    end

    attr_writer :ip_destino
    attr_reader :ip_destino

    attr_writer :mensagem
    attr_reader :mensagem

    attr_writer :mac_destino
    attr_reader :mac_destino

    def getMacAddress(ip)
        command = "arp " + ip
        stdout = Open3.capture3(command)
        macAddress = stdout[0].slice(114..130)
        return macAddress
     end

     def toString()
        return ip_destino+","+mensagem+","+mac_destino
     end
              
end	
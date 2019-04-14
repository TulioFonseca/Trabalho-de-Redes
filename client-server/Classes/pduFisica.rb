require 'open3'

class Quadro

    def initialize(pdu)
        @pdu = pdu
        @mac_origem = "mac_origem"
        @mac_destino = getMacAddress(pdu.ip_destino)
    end

    attr_writer :mac_origem
    attr_reader :mac_origem

    attr_writer :mac_destino
    attr_reader :mac_destino

    attr_writer :pdu
    attr_reader :pdu

    def getMacAddress(ip)
        command = "arp " + ip
        stdout = Open3.capture3(command)
        macAddress = stdout[0].slice(114..130)
        return macAddress
     end

     def toString()
        return mac_origem+","+mac_destino+","+pdu.toString()
     end
              
end

def stringToQuadro(string)
    

end
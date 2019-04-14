require 'open3'
require_relative "../Utils/mac"

class Quadro

    def initialize(pdu_superior)
        @pdu_superior = pdu_superior
        mac = MacAdress.new
        myMac = mac.getCabecalhoMac
        @mac_origem = myMac
        @mac_destino = getMacAddress(pdu_superior.ip_destino)
    end

    attr_writer :mac_origem
    attr_reader :mac_origem

    attr_writer :mac_destino
    attr_reader :mac_destino

    attr_writer :pdu_superior
    attr_reader :pdu_superior

    def getMacAddress(ip)
        command = "arp " + ip
        stdout = Open3.capture3(command)
        macAddress = stdout[0].slice(114..130)
        return macAddress
     end

     def toString()
        return mac_origem+","+mac_destino+","+pdu_superior.toString()
     end
              
end
require 'macaddr'

class MacAdress

    def getMacAddres
        return Mac.addr
    end

    def getCabecalhoMac
        myMac = Mac.addr[0..7]
        cabecalhoMac = myMac[0] + myMac[1] + myMac[3] + myMac[4] + myMac[6] + myMac[7]
        return cabecalhoMac.upcase
    end

    def getMacPdu(pdu)
        vetor = pdu.split(",")[1]
        numerosMac = vetor[0] + vetor[1] + vetor[3] + vetor[4] + vetor[6] + vetor[7]
        return numerosMac.upcase
    end

    def verificacaoMac(macOrigem, macDestino)
        if (macOrigem == macDestino)
            return true
        end
        return false
    end

end
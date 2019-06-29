
def esta_na_tabela():
    f = open("tabela.txt", "r")
    ips = f.read().split("\n")    
    return ip_destino in ips

def calcular_and_mask(ip):
    ips = ip.split(".")
    masks = mask.split(".")
    results = list()
    for i in range(len(ips)):
        results.append(str(int(ips[i]) & int(masks[i])))
    return ".".join(results)

def esta_mesma_rede():
    rede_origem = calcular_and_mask(ip_origem)
    rede_destino = calcular_and_mask(ip_destino)
    print(rede_origem)
    print(rede_destino)
    return rede_origem == rede_destino


ip_origem = "192.168.0.15"
ip_destino = "192.168.0.17"
mask = "255.255.255.0"

print(esta_mesma_rede())
print(esta_na_tabela())
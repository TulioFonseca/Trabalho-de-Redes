import socket

def sendFisica(message):
    HOST = ''     # Endereco IP do Servidor
    PORT = 3344            # Porta que o Servidor esta
    tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    dest = (HOST, PORT)
    tcp.connect(dest)
    tcp.send(message)
    response = tcp.recv(1024)
    tcp.close()
    return response

def calcular_and_mask(ip):
    ips = ip.split(".")
    masks = mask.split(".")
    results = list()
    for i in range(len(ips)):
        results.append(str(int(ips[i]) & int(masks[i])))
    return ".".join(results)

def ip_gateway():
    f = open("tabela.txt", "r")
    ips = f.read().split("\n")
    return ips[-1]

def esta_na_tabela():
    f = open("tabela.txt", "r")
    ips = f.read().split("\n")
    return ip_destino in ips

def esta_mesma_rede():
    rede_origem = calcular_and_mask(ip_origem)
    rede_destino = calcular_and_mask(ip_destino)
    # return rede_origem == rede_destino
    return False

ip_origem = "192.168.0.15"
ip_destino = "192.168.0.17"
mask = "255.255.255.0"

HOST = ''              # Endereco IP do Servidor
PORT = 2233          # Porta que o Servidor esta
tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
tcp.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
orig = (HOST, PORT)
tcp.bind(orig)
tcp.listen(1)
while True:
    con, cliente = tcp.accept()
    print('Concetado por', cliente)
    message = con.recv(1024)
    print(cliente, message)

    if esta_mesma_rede():
        ip_destino = ip_destino
    elif esta_na_tabela():
        ip_destino = ip_destino
    else:
        ip_destino = ip_gateway()
    print(ip_destino)
    response = sendFisica(ip_destino.encode() + b"#" + message)
    con.send(response  + b"\n")
        
    print('Finalizando conexao do cliente', cliente)
    con.shutdown(1)
    con.close()


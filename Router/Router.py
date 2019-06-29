import socket

def sendTransporte(message):
    # Pegar a porta e o IP do arquivo
    HOST = '192.168.0.15'     # Endereco IP do Roteador
    PORT = 12345            # Porta que o Servidor esta
    tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    dest = (HOST, PORT)
    tcp.connect(dest)
    tcp.send(message)
    response = tcp.recv(1024)
    tcp.close()
    return response


HOST = '192.168.0.66'              # Endereco IP do Servidor
PORT = 12345          # Porta que o Servidor esta
tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
tcp.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
orig = (HOST, PORT)
tcp.bind(orig)
tcp.listen(1)
while True:
    print('Servidor Escutando')
    con, cliente = tcp.accept()
    print('Concetado por', cliente)
    # while True:
    message = con.recv(1024) + b"\n"
        # if not message: break
    print(cliente, message)

    response = sendTransporte(message)
    print('Resposta ao Cliente', response)
    con.send(response)
        
    print('Finalizando conexao do cliente', cliente)
    con.shutdown(1)
    con.close()


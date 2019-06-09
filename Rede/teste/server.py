import socket

HOST = ''              # Endereco IP do Servidor
PORT = 1111          # Porta que o Servidor esta
tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
tcp.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
orig = (HOST, PORT)
tcp.bind(orig)
tcp.listen(1)
while True:
    con, cliente = tcp.accept()
    print('Concetado por', cliente)
    # while True:
    message = con.recv(1024)
        # if not message: break
    print(cliente, message)

    response = b"Resposta"
    con.send(response)
        
    print('Finalizando conexao do cliente', cliente)
    con.shutdown(1)
    con.close()
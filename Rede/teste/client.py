import socket

HOST = ''     # Endereco IP do Servidor
PORT = 1111            # Porta que o Servidor esta
tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
dest = (HOST, PORT)
tcp.connect(dest)
tcp.send(b"teste")
response = tcp.recv(1024)
print(response)
tcp.close()
using System;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Text;

namespace Servidor
{
    class Program
    {
        public static void Main(){ 
            Int32 port = 666;
            IPAddress localAddr = IPAddress.Parse("192.168.0.17");
            TcpListener serverSocket = new TcpListener(localAddr, port);
            int requestCount = 0;
            TcpClient clientSocket = default(TcpClient);
            serverSocket.Start();
            Console.WriteLine(" >> Server Started");
            requestCount = 0;

            while ((true))
            {
                try
                {

                    clientSocket = serverSocket.AcceptTcpClient();
                    Console.WriteLine(" >> Accept connection from client");
                    requestCount = requestCount + 1;
                    NetworkStream networkStream = clientSocket.GetStream();
                    byte[] bytesFrom = new byte[10025];
                    networkStream.Read(bytesFrom, 0, bytesFrom.Length);
                    string dataFromClient = System.Text.Encoding.ASCII.GetString(bytesFrom);
                    
                    String[] array = dataFromClient.Split(",");
                    String ipOrigem = array[2];
                    Console.WriteLine("ipOrigem", ipOrigem);
                    String ipDestino = array[3];
                    String corpoMensagem = array[4];

                    string resposta = "Metodo nao encontrado";
                    if (corpoMensagem.Contains("/GETNOMESDOGRUPO")){
                        Console.WriteLine("Metodo /GET encontrado ... Mandando resposta ");
                        resposta = "Caio, Tulio, Felipao ";
                    }


                    Console.WriteLine(" >> Data from client - " + dataFromClient);
                    string serverResponse = "Response Message: " + resposta;
                    Byte[] sendBytes = Encoding.ASCII.GetBytes(serverResponse);
                    networkStream.Write(sendBytes, 0, sendBytes.Length);
                    networkStream.Flush();
                    Console.WriteLine(" >> " + serverResponse);
                    clientSocket.Close();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.ToString());
                }
            }

            serverSocket.Stop();
            Console.WriteLine(" >> exit");
            Console.ReadLine();
        
        }     

        
    }
}
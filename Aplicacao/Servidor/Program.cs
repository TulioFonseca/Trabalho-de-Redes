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
            TcpListener serverSocket= configuracaoInicialServer();
            serverSocket.Start();
            TcpClient clientSocket = default(TcpClient);
            Console.WriteLine(" Servidor escutando ...");
            while ((true))
            {
                try
                {
                    clientSocket = serverSocket.AcceptTcpClient();
                    Console.WriteLine(" Conectado com o Cliente");
                    NetworkStream networkStream = clientSocket.GetStream();
                    byte[] bytesFrom = new byte[10025];
                    networkStream.Read(bytesFrom, 0, bytesFrom.Length);
                    string dataFromClient = System.Text.Encoding.ASCII.GetString(bytesFrom);
                    String corpoMensagem = getCorpoMsg(dataFromClient);
                    string resposta = "";
                    if (corpoMensagem.Contains("/get")){
                        Console.WriteLine("Metodo /GET encontrado ... Mandando resposta... ");
                        resposta = "Caio, Tulio, Felipao  \n";
                    }
                    string serverResponse = resposta;
                    Byte[] sendBytes = Encoding.ASCII.GetBytes(serverResponse);
                    networkStream.Write(sendBytes, 0, sendBytes.Length);
                    networkStream.Flush();
                    Console.WriteLine(" -> " + serverResponse);
                    clientSocket.Close();
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.ToString());
                }
            }
        }   
        private static TcpListener configuracaoInicialServer(){
            Int32 port = 666;
            IPAddress localAddr = IPAddress.Parse("127.0.0.1");
            return new TcpListener(localAddr, port);
        }  

        private static String getCorpoMsg(String dataFromClient){
            String[] array = dataFromClient.Split(",");
            String ipOrigem = array[2];
            String ipDestino = array[3];
            String corpoMensagem = array[4];
            return corpoMensagem;
        }
    }
}
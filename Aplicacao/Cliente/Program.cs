using System;  
using System.Net;  
using System.Net.Sockets;  
using System.Text;

namespace Teste
{
    class Program
    {
        public static void StartClient() {  

        byte[] bytes = new byte[1024];
        try {
            Console.WriteLine("[APLICACAO - FISICA]");  
            IPAddress ipAddress = IPAddress.Parse("127.0.0.1");
            IPEndPoint remoteEP = new IPEndPoint(ipAddress,1111);  
  
            Socket sender = new Socket(ipAddress.AddressFamily,   
                SocketType.Stream, ProtocolType.Tcp );  
  
            try {  
                sender.Connect(remoteEP);  
  
                Console.WriteLine("Conectado");  
  
                byte[] msg = Encoding.ASCII.GetBytes("/getNomesDoGrupo");  

                Console.WriteLine("Enviando mensagem");  
                int bytesSent = sender.Send(msg);  
  
                int bytesRec = sender.Receive(bytes);  
                Console.WriteLine("Resposta Obtida = {0}", Encoding.ASCII.GetString(bytes,0,bytesRec));  
  
                sender.Shutdown(SocketShutdown.Both);  
                sender.Close();  
  
            } catch (ArgumentNullException ane) {  
                Console.WriteLine("ArgumentNullException : {0}",ane.ToString());  
            } catch (SocketException se) {  
                Console.WriteLine("SocketException : {0}",se.ToString());  
            } catch (Exception e) {  
                Console.WriteLine("Unexpected exception : {0}", e.ToString());  
            }  
  
        } catch (Exception e) {  
            Console.WriteLine( e.ToString());  
        }  
    }
        static void Main(string[] args)
        {
            StartClient();  
        }
    }
}

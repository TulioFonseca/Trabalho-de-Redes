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
            TcpListener server=null;   
            try {
                Int32 port = 666;
                IPAddress localAddr = IPAddress.Parse("127.0.0.1");
                //IPAddress localAddr = IPAddress.Parse("192.168.0.17");
                server = new TcpListener(localAddr, port);
                server.Start();
                Byte[] bytes = new Byte[256];
                String data = null;
                Console.WriteLine("Servidor em estado de espera ...");
                while(true) {
                    TcpClient client = server.AcceptTcpClient();            
                    Console.WriteLine("Connected!");
                    data = null;
                    NetworkStream stream = client.GetStream();
                    int i;
                    while((i = stream.Read(bytes, 0, bytes.Length))!=0){   
                        data = System.Text.Encoding.ASCII.GetString(bytes, 0, i);
                        //data = data.ToUpper();

                        /*String[] array = data.Split(",");
                        String ipOrigem = array[2];
                        Console.WriteLine("ipOrigem", ipOrigem);
                        String ipDestino = array[3];
                        String corpoMensagem = array[4];

                        if (corpoMensagem.Contains("/GET")){
                            Console.WriteLine("Metodo /GET encontrado ... Mandando resposta ");
                        }
                        */

                        byte[] msg = System.Text.Encoding.ASCII.GetBytes("BUCETA ATOMICA");

                        // Send back a response.
                        Console.WriteLine("Mensagem: ", data);   
                        stream.Write(msg, 0, msg.Length);
                        
                    }
                    client.Close();
                }
            }
            catch(SocketException e){
                Console.WriteLine("SocketException: ", e);
            }
            finally{
                server.Stop();
            }
            Console.WriteLine("\nHit enter to continue...");
            Console.Read();
        }     
        
        
    }

   
}

﻿using System;
using System.Net.Sockets;  
using System.Text;

namespace Servidor
{
    class Program
    {
    private const int portNum = 666;  
    
        public static int Main(String[] args) {  
            bool done = false;  
    
            TcpListener listener = new TcpListener(portNum);  
    
            listener.Start();  
    
            while (!done) {  
                Console.Write("Servidor Aplicação Rodando e esperando um bucetao ... ");  
                TcpClient client = listener.AcceptTcpClient();  
    
                Console.WriteLine("Connection accepted.");  
                NetworkStream ns = client.GetStream();  
    
                byte[] byteTime = Encoding.ASCII.GetBytes(DateTime.Now.ToString());  
    
                try {  
                    ns.Write(byteTime, 0, byteTime.Length);  
                    ns.Close();  
                    client.Close();  
                } catch (Exception e) {  
                    Console.WriteLine(e.ToString());  
                }  
            }  
    
            listener.Stop();  
    
            return 0;  
        }  
    }
}

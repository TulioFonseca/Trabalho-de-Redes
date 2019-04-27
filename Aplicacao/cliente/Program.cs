using System;

namespace cliente
{
    class Program
    {
        static void Main(string[] args)
        {
            string ip_servidor = "192.168.0.15";
            string porta_servidor = "1";
            Console.WriteLine("Hello World!");
            TcpClient cliente = new TcpClient(); 
            client.Connect(ip_servidor, porta_servidor);
            client.Close();
        }
    }
}

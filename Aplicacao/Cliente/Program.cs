using System;
using System.IO;
using System.Net;
using System.Text;
using System.Net.Sockets;

namespace Cliente
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("[ENVIO: APLICACAO - FISICO]");
            
            string ip_servidor = "localhost";
            int porta_servidor = 1111;

            string messagem = "/getNomesDoGrupo";
            Byte[] data = System.Text.Encoding.ASCII.GetBytes(messagem); 

            TcpClient client = new TcpClient(); 
            client.Connect(ip_servidor, porta_servidor);

            Console.WriteLine("Connected");

            Stream stm = client.GetStream();

            ASCIIEncoding asen= new ASCIIEncoding();
            byte[] ba=asen.GetBytes(messagem);
            Console.WriteLine("Transmitting.....");

            stm.Write(ba,0,ba.Length);

            // byte[] bb = new byte[100];
            // int k = stm.Read(bb,0,100);

            client.Close();
        }
    }
}

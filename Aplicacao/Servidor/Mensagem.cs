using System;
namespace Servidor
{
    class Mensagem
    {
        private static string ipOrigem;
        private static string ipDestino;
        private static string mensagem;

        public static void setIpOrigem (string ipOrigem){
            Mensagem.ipOrigem = ipOrigem;
        }

        public static void setIpDestino (string ipDestino){
            Mensagem.ipDestino = ipDestino;
        }

        public static void setMensagem (string mensagem){
            Mensagem.mensagem = mensagem;
        }

        public static String getIpOrigem(){
            return  Mensagem.ipOrigem;
        }
    }
}
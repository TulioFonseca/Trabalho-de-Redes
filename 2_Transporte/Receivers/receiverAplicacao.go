package main

import "net"
import "fmt"
import "bufio"
import "strings" // only needed below for sample processing

func main() {

    fmt.Println("Launching server...")

    // listen on all interfaces
    ln, _ := net.Listen("tcp", ":1122")
    for{    
        // accept connection on port
        conn, _ := ln.Accept()
        fmt.Println("Conected with client...")
        // will listen for message to process ending in newline (\n)
        message, _ := bufio.NewReader(conn).ReadString('\n')
        fmt.Print("Message Received:", string(message) + "\n")

        is_tcp := strings.TrimRight(strings.Split(message, ":")[1], "\n")
        if is_tcp == "1"{
            fmt.Print("Conexao TCP \n")
            balanga_tres_vezes()
        }else{
            fmt.Print("Conexao UDP \n")
        }
        message = strings.Split(message, ":")[0]
        // output message received

        response := sendRede(message)

        // send new string back to client
        conn.Write([]byte(response))
    }
}

func balanga_tres_vezes() {
    for i := 0; i < 2; i++ {
        fmt.Print("Message TCP: \n")
        sendRede("1")
	}
}


func sendRede(message string) string{
    // connect to this socket
    conn, _ := net.Dial("tcp", ":2233")
    // send to socket
    fmt.Fprintf(conn, message)
    // listen for reply
    response, _ := bufio.NewReader(conn).ReadString('\n')
    fmt.Print("Message from server: "+ response + "\n")
    return response
}
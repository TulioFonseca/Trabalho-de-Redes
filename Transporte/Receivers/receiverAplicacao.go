package main

import "net"
import "fmt"
import "bufio"
// import "strings" // only needed below for sample processing

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
        // output message received
        fmt.Print("Message Received:", string(message) + "\n")

        // response := strings.ToUpper(message)
        response := sendRede(message)

        // send new string back to client
        conn.Write([]byte(response))
    }

}

func sendRede(message string) string{
    // connect to this socket
    conn, _ := net.Dial("tcp", ":2233")
    // send to socket
    fmt.Fprintf(conn, message)
    // listen for reply
    response, _ := bufio.NewReader(conn).ReadString('\n')
    fmt.Print("Message from server: "+ response + "\n" )
    return response
}
package main

import "net"
import "fmt"
import "bufio"
import "strings" // only needed below for sample processing

func main() {

    fmt.Println("Launching server...")

    // listen on all interfaces
    ln, _ := net.Listen("tcp", ":3322")
    
    for{    
        // accept connection on port
        conn, _ := ln.Accept()
        fmt.Println("Conected with client...")
        // will listen for message to process ending in newline (\n)
        message, _ := bufio.NewReader(conn).ReadString('\n')
        // output message received
        fmt.Print("Message Received:", string(message) + "\n")

        // response := strings.ToUpper(message)
        response := ""

        array := strings.Split(message, ",")
        fmt.Print("Array: "+ array[0] + array[1] + array[2] + array[3] + array[4])
        if strings.Compare(array[4], "1") == 1 {
            response = strings.ToUpper("ok    ")
        }else {
            response = sendAplicacao(message)
        }
        fmt.Print("RESPOSTA: "+ response + "\n" )
        // send new string back to client
        conn.Write([]byte(response))
    }

}

func sendAplicacao(message string) string{
    // connect to this socket
    conn, _ := net.Dial("tcp", ":2211")
    // send to socket
    fmt.Fprintf(conn, message)
    // listen for reply
    response, _ := bufio.NewReader(conn).ReadString('\n')
    fmt.Print("Message from server: "+ response + "\n" )
    return response
}

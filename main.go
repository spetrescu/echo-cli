package main

import (
    "bufio"
    "fmt"
    "os"
)

func main() {
    reader := bufio.NewReader(os.Stdin)
    fmt.Println("Enter text to echo:")

    input, _ := reader.ReadString('\n')
    fmt.Printf("You entered: %s", input)
}


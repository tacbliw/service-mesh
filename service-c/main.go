package main

import (
	"fmt"
	"log"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello from service C  ")
	fmt.Println("Service c touched")
}

func main() {
	http.HandleFunc("/", handler)
	fmt.Println("Service C initializing...")
	log.Fatal(http.ListenAndServe("localhost:80", nil))
	fmt.Println("Service C stopped")
}

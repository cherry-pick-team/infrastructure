package main

import (
	"fmt"
	"net/http"
)

func init() {

}

func deployHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hi there, I love %s!", r.URL.Path[1:])
}

func main() {
	http.HandleFunc("/start_deploy", deployHandler)
}

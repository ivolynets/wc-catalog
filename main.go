package main

import (
	"github.com/gorilla/mux"
	"github.com/ivolynets/wc-catalog-service/info"
	"log"
	"net/http"
)

// Application entry point.
func main() {

	router := mux.NewRouter()
	router.HandleFunc("/info", info.GetInfo).Methods("GET")

	log.Fatal(http.ListenAndServe(":8080", router))
}

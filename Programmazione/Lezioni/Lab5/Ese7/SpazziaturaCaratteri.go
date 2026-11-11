package main

import "fmt"

func main() {
	var frase, s string

	fmt.Print("Inserisci una stringa di testo: ")
	fmt.Scan(&frase)

	for _, c := range frase {
		s += string(c) + " "
	}

	fmt.Println(s)
}

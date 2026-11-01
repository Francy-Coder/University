package main

import "fmt"

func main() {
	var n, a, b, somma int

	fmt.Print("Inserisci un numero intero: ")
	fmt.Scan(&n)

	a = 1
	b = 1

	for i := 0; i < n; i++ {
		fmt.Print(a, " ")

		somma = a + b
		a = b
		b = somma
	}

	fmt.Println()
}

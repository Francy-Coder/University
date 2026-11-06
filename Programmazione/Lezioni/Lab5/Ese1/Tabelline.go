package main

import "fmt"

func Tabellina(n int) bool {
	if n >= 1 && n <= 9 {
		fmt.Printf("Tabellina del %d:", n)

		for i := 0; i <= 10; i++ {
			prodotto := n * i
			fmt.Printf(" %d", prodotto)
		}
		fmt.Println()
		return true
	} else {
		return false
	}
}

func main() {
	var n int

	for {
		fmt.Print("Inserisci un numero: ")
		fmt.Scan(&n)

		controllo := Tabellina(n)

		if !controllo {
			fmt.Println("Programma terminato.")
			break
		}
	}
}

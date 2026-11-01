package main

import "fmt"

func main() {
	var n int

	fmt.Print("Inserisci un numero: ")
	fmt.Scan(&n)

	fmt.Printf("Divisori di %d:", n)
	for i := 1; i < n; i++ {
		if n%i == 0 {
			fmt.Printf(" %d", i)
		}
	}
	fmt.Println()
}

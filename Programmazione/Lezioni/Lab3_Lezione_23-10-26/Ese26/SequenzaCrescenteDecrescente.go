package main

import "fmt"

func main() {
	var n, c int

	fmt.Println("Inserisci una sequenza di numeri:")

	for {
		fmt.Scan(&n)

		if n <= -1 {
			break
		}

		if n >= c {
			fmt.Println("Crescente")
		} else {
			fmt.Println("Decrescente")
		}

		c = n
	}
}

package main

import "fmt"

func main() {
	var simbolo rune = 127153 // oppure 🂱

	for i := 0; i < 10; i++ {
		fmt.Printf("Simbolo: %c - Codice numerico in base 10: %d \n", simbolo, simbolo)
		simbolo++
	}
}



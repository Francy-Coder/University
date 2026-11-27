package main

import (
	"fmt"
	"os"
	"strconv"
)

func Calcola(sl []int) int {
	var risultato int

	for i := 0; i < len(sl); i++ {
		for j := i + 1; j < len(sl); j++ {
			prodotto := sl[i] * sl[j]

			if prodotto%2 == 0 {
				risultato += prodotto
			}
		}
	}

	return risultato
}

func main() {
	var numeri []int

	for _, arg := range os.Args[1:] {
		n, _ := strconv.Atoi(arg)
		numeri = append(numeri, n)
	}

	risultato := Calcola(numeri)
	fmt.Println("La somma è:", risultato)
}

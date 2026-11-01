package main

import (
	"fmt"
	"math"
)

func main() {
	var x, y int

	fmt.Print("Inserisci due numeri interi: ")
	fmt.Scan(&x, &y)

	fmt.Print("Maggiore: ")
	if x > y {
		fmt.Println(x)
	} else {
		fmt.Println(y)
	}

	fmt.Print("Minore: ")
	if x < y {
		fmt.Println(x)
	} else {
		fmt.Println(y)
	}

	fmt.Println("Somma:", x+y)

	fmt.Print("Differenza: ")
	if x > y {
		fmt.Println(x - y)
	} else {
		fmt.Println(y - x)
	}

	fmt.Println("Prodotto:", x*y)

	fmt.Println("Divisione:", float64(x)/float64(y))

	fmt.Println("Valore medio:", (float64(x)+float64(y))/2)

	var c int = 1
	for i := 0; i < y; i++ {
		c = c * x
	}
	fmt.Println("Potenza (ciclo for):", c)

	fmt.Println("Potenza (math.Pow):", math.Pow(float64(x), float64(y)))
}

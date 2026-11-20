package main

import "fmt"

func main() {
	var l, n int

	fmt.Print("Quanti numeri vuoi inserire? ")
	fmt.Scan(&l)

	a := make([]int, l)

	fmt.Printf("Inserisci %d numeri: \n", l)
	for i := 0; i < l; i++ {
		fmt.Scan(&n)
		a[i] = n
	}

	fmt.Println("Numeri in ordine inverso: ")
	for i := l - 1; i >= 0; i-- {
		fmt.Printf("%d ", a[i])
	}
	fmt.Println()
}

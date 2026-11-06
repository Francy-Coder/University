package main

import "fmt"

func ÈPrimo(n int) bool {
	if n < 2 {
		return false
	}

	for i := 2; i < n; i++ {
		if n%i == 0 {
			return false
		}
	}

	return true
}

func NumeriPrimi(limite int) {
	fmt.Println("Numeri primi inferiori a", limite)

	for i := 0; i < limite; i++ {
		if ÈPrimo(i) {
			fmt.Printf("%d ", i)
		}
	}
	fmt.Println()
}

func main() {
	var soglia int

	fmt.Print("Inserisci la dimensione: ")
	fmt.Scan(&soglia)

	if soglia > 0 {
		NumeriPrimi(soglia)
	} else {
		fmt.Println("La soglia inserita non è positiva")
	}
}

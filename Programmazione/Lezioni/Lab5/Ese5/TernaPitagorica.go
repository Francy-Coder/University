package main

import "fmt"
func ÈTernaPitagorica(a int, b int, c int) bool {
	return c*c == a*a+b*b
}

func TernePitagoriche(soglia int) {
	fmt.Println("Terne pitagoriche:")

	for a := 1; a <= soglia; a++ {
		for b := a + 1; b <= soglia; b++ {
			for c := b + 1; c <= soglia; c++ {
				if ÈTernaPitagorica(a, b, c) {
					fmt.Printf("(%d, %d, %d)\n", a, b, c)
				}
			}
		}
	}
}

func main() {
	var soglia int

	fmt.Print("Inserisci la soglia: ")
	fmt.Scan(&soglia)

	if soglia > 0 {
		TernePitagoriche(soglia)
	} else {
		fmt.Println("La soglia inserita non è positiva")
	}
}

package main

import "fmt"

func main() {
	var scelta, totale, quantita int
	var fine bool = false 

	for {
		fmt.Printf("Cosa vuoi ordinare? \n		1. patatine 2€ \n		2. hamburger 5€ \n		3. cocacola 2€ \n		0. termina \n")
		fmt.Scan(&scelta)

		switch scelta {
		case 0:
			fmt.Printf("Sono %d euro + 2 euro di consegna. Totale: %d\n", totale, totale+2)
			fine = true

		case 1:
			fmt.Println("Patatine? Ottimo, quante?")
			fmt.Scan(&quantita)
			totale += (quantita * 2)

		case 2:
			fmt.Println("Hamburger? Ottimo, quanti?")
			fmt.Scan(&quantita)
			totale += (quantita * 5)

		case 3:
			fmt.Println("Cocacola? Ottimo, quante?")
			fmt.Scan(&quantita)
			totale += (quantita * 2)

		default:
			fmt.Println("Valore non valido")
		}
		
		if fine {
			break		
		}
	}
}

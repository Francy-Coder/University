package main

import "fmt"

func StampaRigaInizioAsterisco(lunghezza int) {
	for i := 0; i < lunghezza; i++ {
		if i%2 == 0 {
			fmt.Print("*")
		} else {
			fmt.Print("+")
		}		
	}
	fmt.Println()
}

func StampaRigaInizioPiù(lunghezza int) {
	for i := 0; i < lunghezza; i++ {
		if i%2 == 0 {
			fmt.Print("+")
		} else {
			fmt.Print("*")
		}		
	}
	fmt.Println()
}

func StampaScacchiera(dimensione int) {
	if dimensione > 0 {
		for i := 0; i < dimensione; i++ {
			if i%2 == 0 {
				StampaRigaInizioAsterisco(dimensione)
			} else {
				StampaRigaInizioPiù(dimensione)
			}
		}
	} 
}

func main() {
	var n int

	fmt.Print("Inserisci la dimensione: ")
	fmt.Scan(&n)

	StampaScacchiera(n)
}

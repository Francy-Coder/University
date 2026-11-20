package main

import "fmt"

func main(){
	var s string
	var contatore, precedente int

	fmt.Scan(&s)

	for _, c := range s {
		if contatore != 0 {
			if c >= '0' && c <= '9' {
				if c % 2 == 0 {
					if c < precedente {
						fmt.Printf("Valore in posizione %d non valido \n", contatore)	
					}
				} else {
					if c > precedente {
						fmt.Printf("Valore in posizione %d non valido \n", contatore)	
					}
				}
			} else {
				fmt.Printf("Valore in posizione %d non valido \n", contatore)	
			}
		}
		precedente = c
		contatore++

		}
	}	
}

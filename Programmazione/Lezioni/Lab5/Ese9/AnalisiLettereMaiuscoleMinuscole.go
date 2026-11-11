package main

import "fmt"

func main() {
	var frase string
	var vocaliMaiuscole, vocaliMinuscole, consonantiMaiuscole, consonantiMinuscole int

	fmt.Print("Inserisci una frase: ")
	fmt.Scan(&frase)

	for _, c := range frase {
		if c >= 'A' && c <= 'Z' {
			if c == 'A' || c == 'E' || c == 'I' || c == 'O' || c == 'U' {
				vocaliMaiuscole++
			} else {
				consonantiMaiuscole++
			}
		}

		if c >= 'a' && c <= 'z' {
			if c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' {
				vocaliMinuscole++
			} else {
				consonantiMinuscole++
			}
		}	

	}

	fmt.Printf("Vocali maiuscole: %d \nConsonanti maiuscole: %d \nVocali minuscole: %d \nConsonanti minuscole: %d \n", vocaliMaiuscole, consonantiMaiuscole, vocaliMinuscole, consonantiMinuscole)
}

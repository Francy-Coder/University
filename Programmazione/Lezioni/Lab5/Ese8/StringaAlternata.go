package main

import "fmt"

func StringheAlternate(s1, s2 string) string {
	var s string

	lunghezza := len(s1)

	if len(s2) > lunghezza {
		lunghezza = len(s2)
	}

	for i := 0; i < lunghezza; i++ {
		if i < len(s1) {
			s += string(s1[i])
		} else {
			s += "-"
		}

		if i < len(s2) {
			s += string(s2[i])
		} else {
			s += "-"
		}

	}

	return s
}

func main() {
	var s1, s2 string

	fmt.Println("Inserisci due parole: ")
	fmt.Scan(&s1, &s2)

	fmt.Println(StringheAlternate(s1, s2))
}

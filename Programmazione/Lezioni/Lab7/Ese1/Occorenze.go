package main

import (
	"fmt"
	"strings"
)

func Occorenze(s string) [26]int {
	var a [26]int

	s = strings.ToLower(s)

	for _, c := range s {
		if c >= 'a' && c <= 'z' {
			a[c-'a']++
		}
	}

	return a
}

func main() {
	var s string

	fmt.Print("Inserisci un testo: ")
	fmt.Scan(&s)

	a := Occorenze(s)

	for i := 0; i < 26; i++ {
		fmt.Printf("%c %d | ", 'a'+i, a[i])
	}
	fmt.Println()
}

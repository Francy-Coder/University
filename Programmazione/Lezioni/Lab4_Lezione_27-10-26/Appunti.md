# Riepilogo Lezione
- Slide: [Lezione 4 - Cicli annidati, Stringhe/Rune](https://github.com/LabProgrammazione1/Lab_2026-27/blob/main/Lezione_4/Lab4.pdf)

# Riepilogo Lezione 4 - Cicli annidati, Stringhe e Rune

## 1. Cicli annidati (Cicli annidati - 1)
Un **ciclo annidato** è un `for` scritto dentro un altro `for`: a ogni iterazione del ciclo **esterno**, il ciclo **interno** viene eseguito **per intero**. Il numero totale di esecuzioni del corpo è il **prodotto** delle iterazioni dei due cicli.

```go
var n int = 3
var i, j int
for i = 0; i < n; i++ {
    for j = 0; j < n; j++ {
        fmt.Print("*")
    }
}
fmt.Println()
```
Output: **`*********`** (9 asterischi)

Spiegazione:
- Il ciclo esterno fa 3 giri (`i = 0, 1, 2`).
- A ogni giro il ciclo interno riparte da `j = 0` e stampa 3 asterischi.
- `3 * 3 = 9`. In generale stampa **n * n** asterischi.
- Nota: non c'è nessun `Println` dentro i cicli, quindi sono tutti sulla **stessa riga**.

## 2. Tre cicli annidati (Cicli annidati - 2)
Si possono annidare quanti cicli si vuole: le iterazioni complessive si **moltiplicano** a ogni livello.

```go
var n int = 3
var i, j, z int
for i = 0; i < n; i++ {
    for j = 0; j < n; j++ {
        for z = 0; z < n; z++ {
            fmt.Print("*")
        }
    }
}
fmt.Println()
```
Output: **27 asterischi** (`***************************`)

Spiegazione:
- `3 * 3 * 3 = 27`: in generale **n * n * n** asterischi.
- Il ciclo più interno (`z`) fa 3 giri per ogni valore di `j`, e `j` fa 3 giri per ogni valore di `i`.

## 3. Ciclo interno che dipende da quello esterno (Cicli annidati - 3)
L'inizializzazione (o la condizione) del ciclo interno può usare la **variabile del ciclo esterno**: così il numero di giri interni **cambia** a ogni iterazione esterna.

```go
var n int = 3
var i, j int
for i = 0; i < n; i++ {
    for j = i+1; j < n; j++ {
        fmt.Print("*")
    }
}
fmt.Println()
```
Output: **`***`** (3 asterischi)

Spiegazione:

| `i` | `j` parte da | valori di `j` (con `j < 3`) | asterischi |
|-----|--------------|------------------------------|------------|
| 0 | 1 | 1, 2 | 2 |
| 1 | 2 | 2 | 1 |
| 2 | 3 | nessuno | 0 |

- Totale: `2 + 1 + 0 = 3`. In generale **n(n-1)/2**.
- Con `i = 2`, `j = 3` e `3 < 3` è falso: il ciclo interno **non viene eseguito nemmeno una volta**.

## 4. Errore: incremento della variabile sbagliata (Cicli annidati - Trova l'errore 1)
Ogni ciclo deve **modificare la propria variabile di controllo**: se la condizione dipende da `j`, è `j` che deve avanzare.

Codice errato (dovrebbe stampare 4 asterischi con `n = 2`):
```go
for i = 0; i < n; i++ {
    for j = 0; j < n; i++ {
        fmt.Print("*")
    }
}
```
**Errore:** nel ciclo interno si scrive `i++` invece di `j++`.

Cosa succede:
- La condizione del ciclo interno è `j < n`, ma `j` resta sempre a 0, quindi la condizione è **sempre vera**.
- Il ciclo interno **non termina mai**: **ciclo infinito** che stampa asterischi (intanto `i` continua a crescere).

Correzione:
```go
for j = 0; j < n; j++ {
```

## 5. Errore: decremento al posto dell'incremento (Cicli annidati - Trova l'errore 2)
Anche se si modifica la variabile giusta, la **direzione** deve portare verso la fine della condizione.

Codice errato (dovrebbe stampare 4 asterischi con `n = 2`):
```go
for i = 0; i < n; i++ {
    for j = 0; j < n; j-- {
        fmt.Print("*")
    }
}
```
**Errore:** nel ciclo interno si scrive `j--` invece di `j++`.

Cosa succede:
- `j` assume i valori `0, -1, -2, -3, ...`: è sempre `< n`, quindi la condizione **non diventa mai falsa**.
- Anche qui si ha un **ciclo infinito**.

Correzione:
```go
for j = 0; j < n; j++ {
```

## 6. Rune e codici dei caratteri (Stringhe/Rune - 1)
Un carattere tra **apici singoli** (`'a'`) è una **rune**: un valore intero che indica il **codice Unicode** del carattere (ad esempio `'A'` = 65, `'a'` = 97). Si può usare come un normale numero. Se si stampa un `int`, si vede il **numero**, non il carattere.

```go
var x int
var y int = 'a'
x = 'A'
fmt.Print(x, " ")
for x := 1; x < 10; x++ {
    fmt.Print(x+y, " ")
}
fmt.Println()
```
Output: **`65 98 99 100 101 102 103 104 105 106 `**

Spiegazione:
- `y = 'a'` vale **97** e `x = 'A'` vale **65**.
- `fmt.Print(x, " ")` stampa `65` (è un `int`, non il carattere `A`).
- Nel `for`, `x := 1` **dichiara una nuova variabile** `x` (*shadowing*) che esiste solo dentro il ciclo e nasconde quella esterna: vale 1, 2, ..., 9.
- Si stampa `x + y` = `1 + 97 = 98`, `2 + 97 = 99`, ... fino a `9 + 97 = 106`.
- La `x` esterna resta a 65 e non viene modificata dal ciclo.

## 7. `for range` su una stringa (Stringhe/Rune - 2)
Con **`for _, c := range s`** si scorrono i **caratteri** della stringa `s` dal primo all'ultimo. `c` è una rune; il `_` serve a ignorare la posizione. Con **`string(c)`** si converte la rune nel carattere corrispondente, e con **`+`** si concatenano le stringhe.

```go
s := "Papà!"
var s1 string
for _, carattere := range s {
    s1 += string(carattere)
}
fmt.Println(s1)
var s2 string
for _, carattere := range s {
    s2 = string(carattere) + s2
}
fmt.Println(s2)
```
Output:
```
Papà!
!àpaP
```

Spiegazione:
- **Primo ciclo:** aggiunge ogni carattere **in coda** a `s1`: `P`, `Pa`, `Pap`, `Papà`, `Papà!` --> la stringa viene **copiata** uguale.
- **Secondo ciclo:** aggiunge ogni carattere **in testa** a `s2`: `P`, `aP`, `paP`, `àpaP`, `!àpaP` --> la stringa viene **invertita**.
- Funziona anche con `à` perché `range` lavora sui **caratteri**, non sui singoli byte.

## 8. Byte, caratteri e UTF-8 (Stringhe/Rune - 3)
Una stringa in Go è una **sequenza immutabile di byte** che codifica caratteri in **Unicode/UTF-8**: ogni carattere usa da **1 a 4 byte**. I caratteri **US-ASCII** usano 1 byte, gli altri (come `è`, `é`) ne usano 2 o più.
- **`len(s)`** restituisce il numero di **byte**, non di caratteri.
- Nel `for i, c := range s`, `i` è la **posizione del byte** in cui **inizia** il carattere e `c` è la rune.

```go
s := "Ciao René!"
numerocaratteri := 0
numeroiterazione := 0
for i, c := range s {
    fmt.Print("Iterazione ", numeroiterazione, ": In posizione ", i,
        " inizia la sottosequenza di byte che codifica il carattere ",
        string(c), "\n")
    numerocaratteri++
    numeroiterazione++
}
fmt.Println("Numero iterazioni:", numeroiterazione)
fmt.Println("Lunghezza della stringa:", len(s))
fmt.Println("Numero di caratteri che definiscono la stringa:", numerocaratteri)
```
Output:
```
Iterazione 0: In posizione 0 inizia la sottosequenza di byte che codifica il carattere C
Iterazione 1: In posizione 1 inizia la sottosequenza di byte che codifica il carattere i
Iterazione 2: In posizione 2 inizia la sottosequenza di byte che codifica il carattere a
Iterazione 3: In posizione 3 inizia la sottosequenza di byte che codifica il carattere o
Iterazione 4: In posizione 4 inizia la sottosequenza di byte che codifica il carattere  
Iterazione 5: In posizione 5 inizia la sottosequenza di byte che codifica il carattere R
Iterazione 6: In posizione 6 inizia la sottosequenza di byte che codifica il carattere e
Iterazione 7: In posizione 7 inizia la sottosequenza di byte che codifica il carattere n
Iterazione 8: In posizione 8 inizia la sottosequenza di byte che codifica il carattere é
Iterazione 9: In posizione 10 inizia la sottosequenza di byte che codifica il carattere !
Numero iterazioni: 10
Lunghezza della stringa: 11
Numero di caratteri che definiscono la stringa: 10
```

Spiegazione:
- I caratteri sono **10** (`C i a o`, spazio, `R e n é !`), ma i byte sono **11**: la `é` occupa **2 byte**.
- La `é` inizia alla posizione **8** e occupa i byte 8 e 9, per questo l'iterazione successiva (`!`) è in posizione **10** e non 9.
- Quindi `len(s)` (11) è diverso dal numero di caratteri (10): in generale **numero di caratteri <= len(s)**.
- Nota su `Print`: gli spazi tra gli operandi sono già dentro le stringhe, e non vengono aggiunti spazi automatici perché ogni numero è accanto a una stringa.

## 9. `s[i]` restituisce un byte, non un carattere (Stringhe/Rune - 4)
Scrivendo **`s[i]`** si ottiene il **byte** in posizione `i`, che **non corrisponde a un carattere** se questo occupa più di 1 byte. Per scorrere i caratteri di una stringa bisogna usare **`for range`**.

```go
s := "Ciao, come va?"
for i := 0; i < len(s); i++ {
    fmt.Print(string(s[i]))
}
fmt.Println()

s = "Ciao, come è andata?"
for i := 0; i < len(s); i++ {
    fmt.Print(string(s[i]))
}
fmt.Println()
```
Output:
```
Ciao, come va?
Ciao, come Ã¨ andata?
```

Spiegazione:
- **Prima stringa:** solo caratteri US-ASCII, ognuno è **1 byte**, quindi `s[i]` coincide col carattere e l'output è corretto.
- **Seconda stringa:** la `è` è codificata con **2 byte** (valori 195 e 168). Il ciclo li legge **separatamente**, e `string(s[i])` converte ogni byte come se fosse un codice Unicode a sé: 195 diventa `Ã` e 168 diventa `¨`.
- Il risultato è `Ã¨` al posto di `è`.
- Soluzione: usare `for _, c := range s`, che decodifica correttamente i caratteri multi-byte.

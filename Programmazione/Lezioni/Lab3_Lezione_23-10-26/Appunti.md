# Riepilogo Lezione
- Slide: [Lezione 3 - Selezione e Iterazione](https://github.com/LabProgrammazione1/Lab_2026-27/blob/main/Lezione_3/Lab3.pdf)

# Riepilogo Lezione 3 - Selezione e Iterazione

## 1. `if` / `else` (Selezione - 1)
**`if`** esegue un blocco di codice solo se la condizione è **vera**; l'**`else`** (facoltativo) viene eseguito quando la condizione è **falsa**. In Go la condizione **non ha parentesi** e le graffe `{}` sono **obbligatorie**.

```go
a, b, c := 10, 20, 30
if a > b {
    a = b
} else {
    b = a
}
c = c + b + a
fmt.Println(a, b, c)
```
Output: **`10 10 50`**

Spiegazione:
- `a > b` --> `10 > 20` è **falso**, quindi si salta l'`if` e si esegue l'`else`: `b = a` --> `b = 10`.
- `c = c + b + a` --> `30 + 10 + 10 = 50`.
- Nota: `a` non cambia, mentre `b` viene **modificata** prima del calcolo di `c`.

## 2. `if` annidati (Selezione - 2)
Un **`if` annidato** è un `if` scritto dentro un altro `if` (o `else`): il blocco interno viene valutato solo se si entra nel ramo esterno.

```go
var a, b, c int
var m int
fmt.Scan(&a, &b, &c)
if a < b {
    if a < c {
        m = a
    } else {
        m = c
    }
} else {
    if b < c {
        m = b
    } else {
        m = c
    }
}
fmt.Println(m)
```
Input `5 8 6` --> Output: **`5`**

Spiegazione:
- `a < b` --> `5 < 8` vero, si entra nel ramo esterno.
- `a < c` --> `5 < 6` vero --> `m = a = 5`.
- **Cosa fa il programma:** trova il **minimo** fra tre numeri.
- Attenzione: nel PDF l'input è scritto `586`; se venisse inserito senza spazi, `Scan` lo leggerebbe come **un solo numero** (`a = 586`) e resterebbe in attesa di `b` e `c`.

## 3. `else if` vs `if` separati (Selezione - 4)
**`else if`** crea una **catena**: appena una condizione è vera, le successive **non vengono controllate**. Con più **`if` separati**, invece, **ogni `if` viene valutato indipendentemente** dagli altri.

```go
// Programma 1: catena
if a < 100 {
    fmt.Println("a minore di 100")
} else if a < 200 {
    fmt.Println("a compreso tra 100 e 200")
} else {
    fmt.Println("a maggiore o uguale a 200")
}

// Programma 2: due if indipendenti
if a < 100 {
    fmt.Println("a minore di 100")
}
if a < 200 {
    fmt.Println("a compreso tra 100 e 200")
} else {
    fmt.Println("a maggiore o uguale a 200")
}
```

| Input | Programma 1 | Programma 2 |
|-------|-------------|-------------|
| `150` | "a compreso tra 100 e 200" | "a compreso tra 100 e 200" |
| `40`  | "a minore di 100" | "a minore di 100" **e poi** "a compreso tra 100 e 200" |

Spiegazione:
- Con `40`, nel Programma 2 il primo `if` è vero (`40 < 100`), ma il secondo `if` è un'istruzione **a parte** e viene valutato lo stesso: anche `40 < 200` è vero, quindi si stampano **due righe**.
- Nel Programma 1 il ramo `else if` viene saltato perché il primo `if` era già vero.
- **I due programmi non funzionano allo stesso modo:** danno lo stesso risultato solo per `a >= 100`.

## 4. Operatori logici (Selezione - Operatori logici)
Gli **operatori logici** combinano più condizioni in una sola:
- **`&&`** (AND): vero se **entrambe** le condizioni sono vere
- **`||`** (OR): vero se **almeno una** è vera
- **`!`** (NOT): inverte il valore della condizione

```go
numero := 15

if numero >= 10 && numero <= 20 {
    fmt.Println("Il numero è compreso tra 10 e 20.")
} else {
    fmt.Println("Il numero non è compreso tra 10 e 20.")
}

if numero < 5 || numero > 50 {
    fmt.Println("Il numero è minore di 5 o maggiore di 50.")
} else {
    fmt.Println("Il numero è compreso tra 5 e 50.")
}

if numero >= 10 && numero <= 20 && numero%2 != 0 {
    fmt.Println("Il numero è dispari e compreso tra 10 e 20.")
} else if numero >= 10 && numero <= 20 && numero%2 == 0 {
    fmt.Println("Il numero è pari e compreso tra 10 e 20.")
} else {
    fmt.Println("Il numero non è compreso tra 10 e 20.")
}
```
Output:
```
Il numero è compreso tra 10 e 20.
Il numero è compreso tra 5 e 50.
Il numero è dispari e compreso tra 10 e 20.
```

Spiegazione:
1. `15 >= 10` e `15 <= 20` sono entrambe vere --> l'AND è **vero**.
2. `15 < 5` è falso e `15 > 50` è falso --> l'OR è **falso**, quindi si stampa l'`else`.
3. `15 % 2 = 1`, quindi `numero%2 != 0` è vero (**dispari**) e anche le altre due condizioni lo sono --> primo ramo.
- Nota: `% 2 == 0` --> **pari**, `% 2 != 0` --> **dispari**.

## 5. Il ciclo `for` (Iterazione - 5)
In Go esiste **solo `for`**, ma si scrive in tre modi: con **sola condizione** (come il `while` di altri linguaggi), nella forma **classica** `inizializzazione; condizione; incremento`, oppure **infinito** (senza condizione), da cui si esce con **`break`**.

```go
// 1) Solo condizione
i := 1
for i <= 3 {
    fmt.Println(i)
    i = i + 1
}

// 2) Classico
for j := 7; j <= 9; j++ {
    fmt.Println(j)
}

// 3) Infinito con break
for {
    fmt.Println("loop")
    if 3 < 10 {
        break
    }
}
```
Output:
```
1
2
3
7
8
9
loop
```

Spiegazione:
- **Primo ciclo:** `i` parte da 1 e si ripete finché `i <= 3`, stampando 1, 2, 3 (l'incremento va scritto a mano nel corpo).
- **Secondo ciclo:** `j++` (equivale a `j = j + 1`) è nell'intestazione, stampa 7, 8, 9. La variabile `j` esiste **solo dentro il ciclo**.
- **Terzo ciclo:** stampa `loop` **una sola volta**, perché `3 < 10` è sempre vero e il `break` scatta subito alla prima iterazione, uscendo dal ciclo.

## 6. Numeri pari fino a n (Iterazione - 6)
Nel `for` classico, l'**incremento** può essere qualsiasi istruzione: con `i += 2` la variabile aumenta di 2 a ogni giro (`i += 2` equivale a `i = i + 2`).

```go
var n int
fmt.Print("Inserisci un numero: ")
fmt.Scan(&n)
var i int
for i = 0; i <= n; i += 2 {
    fmt.Print(i, " ")
}
fmt.Println()
```
- Input `10` --> Output: **`0 2 4 6 8 10 `**
- Input `11` --> Output: **`0 2 4 6 8 10 `**

Spiegazione:
- `i` parte da 0 e aumenta di 2 finché `i <= n`.
- Con `11`, dopo il 10 si passa a 12, che è `> 11`, quindi il ciclo termina: l'11 non viene mai raggiunto.
- **Cosa fa il programma:** stampa i **numeri pari da 0 a n**.
- Nota su `Print`: mette uno spazio automatico tra gli operandi solo se **nessuno dei due è una stringa**; qui `" "` è una stringa, quindi lo spazio lo aggiungiamo noi.

## 7. Potenze di 2 fino a n (Iterazione - 7)
L'incremento del `for` può anche essere **moltiplicativo**: con `i *= 2` la variabile raddoppia a ogni giro (`i *= 2` equivale a `i = i * 2`).

```go
var n int
fmt.Print("Inserisci un numero: ")
fmt.Scan(&n)
var i int
for i = 1; i <= n; i *= 2 {
    fmt.Print(i, " ")
}
fmt.Println()
```
- Input `36` --> Output: **`1 2 4 8 16 32 `**
- Input `32` --> Output: **`1 2 4 8 16 32 `**

Spiegazione:
- `i` parte da 1 e raddoppia: 1, 2, 4, 8, 16, 32, poi 64 che è `> 36` e il ciclo termina.
- Con `32` il 32 è **incluso**, perché la condizione è `<=`.
- **Cosa fa il programma:** stampa le **potenze di 2 minori o uguali a n**.
- **Differenze con l'esercizio 6:**
  - parte da **1** invece che da 0;
  - l'incremento è **moltiplicativo** (`*= 2`) invece che additivo (`+= 2`);
  - fa molte meno iterazioni (crescita esponenziale).
- Attenzione: partendo da 0 con `i *= 2` si avrebbe un **ciclo infinito** (`0 * 2 = 0`).

## 8. Trova gli errori (Iterazione - 8)
Il `for` classico ha **tre parti separate da due `;`**: `for inizializzazione; condizione; incremento {`. Se ne manca una, è un **errore di sintassi**.

Il programma deve stampare i numeri da **1 a n (estremi inclusi)** su una riga, separati da spazio.

Codice errato:
```go
var i int;
for i = 1; i < n {
    fmt.Print(i)
    i++
}
```

Errori individuati:
1. **Sintassi:** `for i = 1; i < n {` ha un solo `;`, **manca la parte dell'incremento** --> si scrive `for i = 1; i <= n; i++ {`.
2. **Logica:** `i < n` **esclude** `n`, ma gli estremi devono essere inclusi --> `i <= n`.
3. **Logica:** `fmt.Print(i)` stampa i numeri **attaccati** (`12345`) --> serve il separatore: `fmt.Print(i, " ")`.
- Nota: il `;` dopo `var i int` è legale ma inutile in Go.

Versione corretta:
```go
var n int
fmt.Print("Inserisci un numero: ")
fmt.Scan(&n)

for i := 1; i <= n; i++ {
    fmt.Print(i, " ")
}
fmt.Println()
```
Se `i++` è già nell'intestazione, **non va ripetuto** nel corpo, altrimenti `i` avanza di 2 a ogni giro.

# Riepilogo Lezione
- Slide: [Lezione 3 - Selezione e Iterazione](https://github.com/LabProgrammazione1/Lab_2026-27/blob/main/Lezione_3/Lab3.pdf)

## 1. `if` / `else` (Selezione - 1)
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
Passo per passo:
- `a > b` --> `10 > 20` è **falso**, quindi si esegue l'`else`: `b = a` --> `b = 10`
- `c = 30 + 10 + 10 = 50`

Stampa **`10 10 50`**.

Nota: in Go la condizione dell'`if` **non ha parentesi** e le graffe `{}` sono **obbligatorie**.

## 2. `if` annidati (Selezione - 2)
Input `5 8 6` (tre numeri separati da spazio, come visto in `fmt.Scan`):
- `a < b` --> `5 < 8` vero, entro nel ramo interno
- `a < c` --> `5 < 6` vero --> `m = a = 5`

Stampa **5**. **Cosa fa il programma:** trova il **minimo** fra tre numeri.

Attenzione: se l'input fosse scritto `586` (senza spazi) `Scan` lo leggerebbe come **un solo numero** (`a = 586`) e resterebbe in attesa di `b` e `c`.

## 3. `else if` vs `if` separati (Selezione - 4)
```go
// Programma 1: catena if / else if / else
if a < 100 { ... } else if a < 200 { ... } else { ... }

// Programma 2: due if indipendenti
if a < 100 { ... }
if a < 200 { ... } else { ... }
```

| Input | Programma 1 | Programma 2 |
|-------|-------------|-------------|
| `150` | "a compreso tra 100 e 200" | "a compreso tra 100 e 200" |
| `40`  | "a minore di 100" | "a minore di 100" **e poi** "a compreso tra 100 e 200" |

**Non funzionano allo stesso modo.**
- Nella catena `else if`, appena **un ramo è vero** gli altri vengono **saltati**.
- Con due `if` separati, **ogni `if` viene valutato sempre**: `40 < 100` è vero, ma anche `40 < 200` lo è, quindi si stampano **due righe**.
- Per `a >= 100` i due programmi danno lo stesso risultato.

## 4. Operatori logici
| Operatore | Significato |
|-----------|-------------|
| `&&` | AND: vero se **entrambe** le condizioni sono vere |
| `\|\|` | OR: vero se **almeno una** è vera |
| `!` | NOT: nega la condizione |

Con `numero := 15` il programma stampa:
1. `numero >= 10 && numero <= 20` --> vero --> "Il numero è compreso tra 10 e 20."
2. `numero < 5 || numero > 50` --> falso (entrambe false) --> "Il numero è compreso tra 5 e 50."
3. `15 % 2 != 0` --> dispari e nell'intervallo --> "Il numero è dispari e compreso tra 10 e 20."

Nota: `numero % 2 == 0` --> **pari**, `numero % 2 != 0` --> **dispari** (utile per molti esercizi).

## 5. Il ciclo `for` (Iterazione - 5)
In Go esiste **solo `for`**, ma ha tre forme:

```go
// 1) Solo condizione (come il while di altri linguaggi)
i := 1
for i <= 3 {
    fmt.Println(i)
    i = i + 1
}

// 2) Classico: inizializzazione; condizione; incremento
for j := 7; j <= 9; j++ {
    fmt.Println(j)
}

// 3) Infinito (senza condizione), si esce con break
for {
    fmt.Println("loop")
    if 3 < 10 {
        break
    }
}
```
Output (una riga per valore):
```
1
2
3
7
8
9
loop
```
- Il terzo ciclo stampa `loop` **una sola volta**: `3 < 10` è sempre vero, quindi il `break` scatta subito alla prima iterazione.
- **`break`** esce immediatamente dal ciclo.
- `j++` è equivalente a `j = j + 1` (e `i += 2` a `i = i + 2`).
- Una variabile dichiarata con `:=` nell'intestazione del `for` (`j`) esiste **solo dentro il ciclo**.

## 6. Numeri pari fino a n (Iterazione - 6)
```go
for i = 0; i <= n; i += 2 {
    fmt.Print(i, " ")
}
```
- Input `10` --> `0 2 4 6 8 10 `
- Input `11` --> `0 2 4 6 8 10 ` (11 non viene raggiunto: dopo 10 si arriva a 12, che è `> 11`)

**Cosa fa:** stampa i **numeri pari da 0 a n** (n compreso, se pari).

Nota su `Print`: mette uno spazio automatico fra gli operandi solo se **nessuno dei due è una stringa**. Qui `" "` è una stringa, quindi lo spazio lo aggiungiamo noi esplicitamente.

## 7. Potenze di 2 fino a n (Iterazione - 7)
```go
for i = 1; i <= n; i *= 2 {
    fmt.Print(i, " ")
}
```
- Input `36` --> `1 2 4 8 16 32 `
- Input `32` --> `1 2 4 8 16 32 ` (il 32 è incluso perché la condizione è `<=`)

**Cosa fa:** stampa le **potenze di 2 minori o uguali a n**.

**Differenze con l'esercizio 6:**
- Parte da **1** invece di 0.
- L'incremento è **moltiplicativo** (`i *= 2`) invece che additivo (`i += 2`).
- Si fanno molte meno iterazioni (crescita **esponenziale**, non lineare).
- Attenzione: partendo da 0 con `i *= 2` si avrebbe un **ciclo infinito** (0 * 2 = 0).

## 8. Trova gli errori (Iterazione - 8)
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
1. **Sintassi:** `for i = 1; i < n {` è incompleto. Con la forma a tre parti servono **due `;`**, quindi manca la parte di incremento (anche vuota). Soluzione: mettere `i++` nell'intestazione (`for i = 1; i <= n; i++`).
2. **Logica:** `i < n` esclude `n`, ma gli estremi devono essere **inclusi** --> `i <= n`.
3. **Logica:** `fmt.Print(i)` stampa i numeri **attaccati** (es. `12345`) --> serve il separatore: `fmt.Print(i, " ")`.

Nota: il `;` dopo `var i int` è legale ma inutile in Go.

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
(Se `i++` è già nell'intestazione, **non va ripetuto** dentro il ciclo, altrimenti `i` avanza di 2.)

## Riepilogo veloce
- **`if / else if / else`**: viene eseguito **un solo ramo**; **`if` separati**: ognuno viene valutato indipendentemente.
- **`&&`**, **`||`**, **`!`** per combinare condizioni; `%` per pari/dispari e multipli.
- **`for cond {}`** (tipo while), **`for init; cond; post {}`** (classico), **`for {}`** (infinito + `break`).
- Occhio a `<` vs `<=` per decidere se gli **estremi** sono inclusi.

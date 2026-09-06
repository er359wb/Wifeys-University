# C++ exam plan — updated Aug 27, exam Sep 11

## How the exam is structured

- Multiple choice — mostly "what does this print?" and "what is the type/value of X?"
- Fill in the blanks — missing loop headers, conditions, pointer syntax, `&`, `[]`, `*`
- Three programs written by hand

All three reward the same underlying skill: **being able to run code in your head**. That is what to practise, not typing speed.

---

## The nine techniques that cover everything

| # | Technique | Where it appears in your files |
|---|---|---|
| 1 | Digit extraction (`n % 10`, `n /= 10`) | Palindrome, digit sum−product, Armstrong, digit sum vs product, reverse number, improper fraction, palindrome function, 2 recursion tasks |
| 2 | Accumulator loop (sum / product / count) | Array sum & average, perfect number, digit sums, factorial sum |
| 3 | Guard-and-track (max, min, "found it") | Max/min of array, smallest of N, highest score, search element |
| 4 | Nested loops for patterns | Diamond (×3), multiplication table, Pascal's triangle, 2D array pattern |
| 5 | Divisor testing (`n % i == 0`) | GCD, LCM, perfect number, prime test, prime divisors, Goldbach |
| 6 | Function definition + prototype + return | GCD/LCM, Goldbach, `prime()`, `palindrome()`, all overloading tasks |
| 7 | Pass by value vs. pass by reference (`&`) | Sorting functions, swap, anything that modifies a caller's variable |
| 8 | Array traversal by pointer (`*(p+i)` ≡ `p[i]`) | Pointer homework, POINTER_FUNCTION, array reversal |
| 9 | Recursion (base case + smaller call) | All of the June 17 worksheet |

---

## Progress as of Aug 27

- [x] **Technique 1 — digit extraction.** Sum of digits, count of digits, reverse a number. Integer division truncation, operator precedence.
- [x] **Technique 2 — accumulators.** Digit sum minus digit product (product starts at 1, not 0). Armstrong number — built across several debugging rounds: two separate loops (count digits, then compute powers), original value preserved in a separate variable, `pow()` argument order bug found and fixed.
- [x] **Technique 4 — nested loops for patterns.** Solid square, right triangle (`col <= row`), then the full diamond — spaces (`4 - row`) + stars (`row`), then mirrored for the bottom half. Multiple debugging rounds; the "condition variable must match the variable being modified" error surfaced repeatedly and is now a named, watched-for mistake.

**Not started:** technique 3 (guard-and-track), 5 (divisor testing), 6 (functions), 7 (pass by reference), 8 (pointers), 9 (recursion). These map directly onto your three weakest areas — functions/scope, arrays/strings, pointers/references/structs — so the rest of the plan targets them in that order.

---

## Remaining schedule — Aug 27 to Sep 10

### Aug 28–29: Functions — definition, prototype, pass by reference
- Function prototype vs. definition vs. call — where each goes in the file
- Pass by value vs. pass by reference (`&`) — you started this, finish it with a real swap function
- GCD and LCM as functions (`20260529` worksheet)
- Goldbach's conjecture, using a `bool prime(int n)` function (technique 5 starts here)

### Aug 30–31: Function overloading + more divisor testing
- Overloading: `left()` for strings then ints, `Combine()`, `calculate()`
- Perfect number checker, prime divisors of N
- Delete common elements from two sorted arrays

### Sep 1–2: Arrays (technique 3 — guard and track)
- Search for a target value in an array
- Sum/average of positive numbers, with the divide-by-zero edge case
- Max and min of an array
- Reverse an array in place, without extra storage

### Sep 3: 2D arrays
- Pascal's triangle
- The combined number pattern
- Saddle point (optional but good practice — combines max-per-row and min-per-column)

### Sep 4–5: Pointers (technique 8 — your named weak spot)
- `*`, `&`, `p[i]` vs. `*(p+i)`, arrays decaying to pointers
- Work `homework_on_pointers` under timed conditions — midterm-style fill-in-the-blank and MCQ
- POINTER_FUNCTION: sort students by score, output highest, output above-average — without `<algorithm>`
- Palindrome-checking `m`, `m²`, `m³` using a helper function

### Sep 6: Structs
- Define `Student` with id, name, cstring array scores, computed average
- Sort descending by average, tie-break by ascending ID
- Class averages per course, highest average, below-60 list
- Optional: invalid-score handling (negative or >100 → average = -1.00, excluded from stats)

### Sep 7–8: Recursion (technique 9)
- Base case + recursive case — why a missing base case hangs
- Power, Fibonacci, minimum of a list, digit count, digit sum, reverse a number
- Length of a cstring, sum of an array, binary search
- Trace a recursive call by hand with a call-stack table — likely MCQ material

### Sep 9: Comprehensive practice + mixed review
- Read positive integers until -1, filter primes into a second array, output sorted
- One timed mixed session pulling from all nine techniques

### Sep 10 — light
- Re-read this plan and your mistakes list
- Rewrite two or three programs you already know, cold, on paper
- Sleep

---

## Daily rhythm (about 75 minutes, more on days you have time)

1. **10–15 min — cold recall.** Write yesterday's program on paper without looking.
2. **30 min — new technique.** Worked example, then you apply it.
3. **30 min — produce.** Write one program on paper, then type it in and check.

## Rules that matter for a paper exam

- Write on paper first, every time.
- **Named recurring error:** the variable in a loop's condition must be the same variable changed in its body. This has caused real bugs in Armstrong and the diamond — check for it every time you write a loop.
- When you make a syntax error, add it to a running mistakes list. Missing `for`-header assignments, missing `&`, `int` vs `double` division — these repeat.
- Trace code with a table: one column per variable, one row per iteration.
- Avoid `#include <bits/stdc++.h>` — not standard, won't compile in Visual Studio.

# Functions — Definition and Calling (2)

Source: `20260529_function_definition_and_calling_basic_2.docx`

## 1. GCD and LCM

Given two positive integers a and b, compute their GCD and LCM.

- GCD: largest positive integer dividing both a and b.
- LCM: smallest positive integer divisible by both a and b. `LCM(a,b) = a*b/GCD(a,b)`

Input: one line with two integers a, b. Output: GCD followed by LCM, space-separated.

| a | b | GCD | LCM |
|---|---|---|---|
| 12 | 18 | 6 | 36 |
| 7 | 13 | 1 | 91 |
| 100 | 35 | 5 | 700 |
| 48 | 72 | 24 | 144 |

## 2. Verify Goldbach's Conjecture

Every even integer greater than 6 can be expressed as the sum of two odd primes. Given an even number n (>6), find primes p and q with p+q=n, p≤q.

**Requirement:** define a function `bool prime(int n)` to test primality.

| n | p | q |
|---|---|---|
| 8 | 3 | 5 |
| 10 | 3 | 7 |
| 20 | 3 | 17 |
| 100 | 3 | 97 |

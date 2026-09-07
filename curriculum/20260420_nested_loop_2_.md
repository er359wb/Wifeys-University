# Nested Loops 2

Source: `20260420_nested_loop_2_.docx`

## 1. Diamond of asterisks

Same shape as the earlier while-loop diamond (odd line count required, 0 exits).

## 2. Multiplication table

Generate a triangular multiplication table from 1 to N.

```
Input: 5
Output:
1*1=1
2*1=2	2*2=4
3*1=3	3*2=6	3*3=9
4*1=4	4*2=8	4*3=12	4*4=16
5*1=5	5*2=10	5*3=15	5*4=20	5*5=25
```

## 3. Find Unique Pairs

Find all unique pairs of numbers between 1 and n where the sum equals a target k. **`break` is not allowed.**

| Input | Output |
|---|---|
| n=5, k=7 | (2,5),(3,4) |
| n=4, k=12 | no pair! |

## 4. Output Prime Numbers

Output all prime numbers between 1 and n.

```
Input: 200
Output: 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61,
67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139,
149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199
```

## 5. Goldbach's Conjecture — First Decomposition

Any even integer greater than 2 can be expressed as the sum of two primes. Read even *n* (4 ≤ n ≤ 10⁶); find primes *p* and *q* with p+q=n, p≤q, choosing the smallest possible *p*.

**Nested loops and `break` are required here** — stop searching once the first valid pair is found. (Contrast with problem 3 above, where `break` is disallowed.)

If input is not a valid even number in range, output "No solution".

| Input | Output |
|---|---|
| 10 | 3 7 |
| 28 | 5 23 |
| 3 | No solution |

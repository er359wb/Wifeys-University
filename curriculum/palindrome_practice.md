# Palindrome Practice

Source: `palindrome_practice.docx` (originally `回文数练习.docx`, renamed for consistency — contents unchanged). Low priority per the exam-week time budget; pick up only if everything else is done.

## 1. Improper Fraction to Mixed Number

Convert an improper fraction (numerator ≥ denominator) into a mixed number, format `aUb/c` — a = integer part, b = remainder numerator, c = denominator (unchanged).

Example: `10/3` → `3U1/3`.

Input: one line, two integers separated by `/` (numerator/denominator). Denominator is positive; numerator is non-negative.

## 2. Digit Sum Minus Digit Product

Enter a positive integer n (1≤n≤10⁹). Compute sum S of its digits and product P of its digits; output S−P.

| n | Output | Explanation |
|---|---|---|
| 234 | -15 | (2+3+4) - (2×3×4) = 9 - 24 = -15 |
| 100 | 1 | (1+0+0) - (1×0×0) = 1 - 0 = 1 |
| 5 | 0 | (5) - (5) = 0 |

## 3. Palindrome Number

Enter a positive integer n (1≤n≤10⁹); determine whether it's a palindrome. **No strings allowed** — extract digits using only `%` and `/`, then compare.

Output "yes" or "no".

| Input | Output |
|---|---|
| 12321 | yes |
| 12345 | no |
| 1 | yes |

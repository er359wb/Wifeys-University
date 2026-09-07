# CH1 Fundamental 1: Number Systems and Codes

Reformatted companion for `01_ch1_fd1_number_systems_and_codes.pdf` (55 slides).
See CLAUDE.md "Curriculum file formats" — read this file instead of the
original PDF; only open the PDF for a discrepancy, a gap, or if Wifey
asks to see it directly.

## 1.1 Number Systems

### 1.1.1 Unsigned numbers

Definition: numbers that are positive only. Two representations:
positional, and expansion in weights.

1. **Decimal** — radix-10, digits 0~9.
   Positional: (183)₁₀, (24.75)₁₀
   Expansion: 183 = 1×10² + 8×10¹ + 3×10⁰
   (24.75)₁₀ = 2×10¹ + 4×10⁰ + 7×10⁻¹ + 5×10⁻²

2. **Binary** — radix-2, digits 0, 1.
   Positional: (10110111)₂, (11000.11)₂
   Expansion: (10110111)₂ = 1×2⁷+1×2⁵+1×2⁴+1×2²+1×2¹+1×2⁰ = (183)₁₀
   (11000.011)₂ = 1×2⁴+1×2³+1×2⁻²+1×2⁻³

3. **Radix-R numbers** — general positional notation:
   (R_{n-1}R_{n-2}...R_0.R_{-1}R_{-2}...R_{-m})_R
   = R_{n-1}·R^{n-1} + R_{n-2}·R^{n-2} + ... + R_0·R^0 + R_{-1}·R^{-1} + ... + R_{-m}·R^{-m}

4. **Octal and Hexadecimal representation** — why: convenient shorthand
   for long binary numbers, with a clean bit-group relationship.

   **(1) Octal** — radix-8, digits 0~7.
   Positional: (267)₈. Expansion: (267)₈ = 2×8²+6×8¹+7×8⁰ = 128+48+7 = (183)₁₀
   1-to-1 correspondence with 3-bit binary:
   | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
   |---|---|---|---|---|---|---|---|
   | 000 | 001 | 010 | 011 | 100 | 101 | 110 | 111 |

   **(2) Hex** — radix-16, digits 0~9, A~F.
   Positional: (B7)₁₆. Expansion: (B7)₁₆ = 11×16¹+7×16⁰ = 176+7 = (183)₁₀
   Full 1-to-1 correspondence with 4-bit binary:
   | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |
   |---|---|---|---|---|---|---|---|
   | 0000 | 0001 | 0010 | 0011 | 0100 | 0101 | 0110 | 0111 |
   | 8 | 9 | A | B | C | D | E | F |
   | 1000 | 1001 | 1010 | 1011 | 1100 | 1101 | 1110 | 1111 |

   Figure 1.1 (Decimal/Binary/Octal/Hex counting table, 0-18 decimal) —
   confirms the four systems count in lockstep; useful as a self-check
   when drilling the tables.

### 1.1.2 Conversions

1. **Binary <-> Octal** (grouping):
   B→O: each 3-bit group → 1 octal digit. E.g. (1 100 110)₂ = (146)₈
   O→B: each octal digit → a 3-bit binary. E.g. (2751)₈ = (101 111 101 001)₂

2. **Binary <-> Hex** (grouping):
   B→H: each group of 4 bits → 1 hex digit. H→B: each hex digit → a 4-bit binary.
   E.g. (110 0110)₂ = (66)₁₆; (3A7B)₁₆ = (11 1010 0111 1011)₂

   *Question posed on slides*: conversion between octal and hex directly
   (go via binary), and how to handle the fraction part when grouping
   (pad with zeros on the correct side — right side for the fractional
   part, since grouping there also runs away from the point).

3. **Binary -> Decimal**: expansion in weights (see 1.1.1 examples above).
   E.g. (11010.101)₂ = 1×2⁴+1×2³+0×2²+1×2¹+0×2⁰+1×2⁻¹+0×2⁻²+1×2⁻³
   = 16+8+2+0.5+0.125 = (26.625)₁₀

4. **Decimal -> Binary**:
   **(1) Integer part**: successive division by 2, record the remainder
   (0 or 1) after every division, repeat until quotient = 0. The
   **bottom-to-top** sequence of remainders is the answer.
   E.g. (25)₁₀ = (11001)₂ — divisions: 25÷2=12 r1, 12÷2=6 r0, 6÷2=3 r0,
   3÷2=1 r1, 1÷2=0 r1 → read remainders bottom-to-top: 1 1 0 0 1.

   **(2) Fraction part**: successive multiplication by 2, record the
   integer part of the product (0 or 1) after each multiplication,
   clear the integer part (keep pure decimal) before the next
   multiplication, repeat till the fraction is all 0s or a desired
   accuracy is reached. The **top-to-bottom** sequence of integers is
   the answer.
   E.g. (0.625)₁₀ = (0.101)₂ — 0.625×2=1.250 (int 1), 0.250×2=0.500
   (int 0), 0.500×2=1.000 (int 1, fraction now all 0s, stop).
   E.g. 2 (repeating case): (0.8254)₁₀ = (0.11010011...)₂ (first bit
   produced is MSB, last is LSB — doesn't terminate exactly, this one
   is truncated after 8 bits).

5. **Summary of conversions**:
   - Binary, octal, hex: grouping (in either direction).
   - Any number system -> Decimal: expansion in weights.
   - Decimal -> binary and other systems: successive division for the
     integer part, successive multiplication for the fraction part.
   (Octal/hex <-> decimal directly is not shown on the slides — go via
   binary, or apply the same division/multiplication method with radix
   8 or 16 instead of 2.)

## 1.1.3 Signed Numbers

Unsigned number layout: all n bits are magnitude, MSB has no special role.
Signed (machine/computer) number layout: bit b_{n-1} is the **sign bit**
(0 = +, 1 = −), remaining bits b_{n-2}...b_0 are the magnitude.

Three representations for negative numbers (positive numbers are
identical in all three):

1. **Sign-and-magnitude**: 0 = '+', 1 = '−' in the sign bit; all
   significant (magnitude) bits are left unchanged.

2. **1's complement**: sign bit = 1; complement (flip) every
   significant bit. E.g. (−111)_1's = 1000 (from 0111).

3. **2's complement**: K2 = K1 + 1 (take the 1's complement, then add
   1). E.g. (−111)_2's = 1000 + 1 = 1001.

   **Quick way to find the 2's complement directly** (after fixing the
   sign bit to 1): scanning the significant bits from right to left,
   copy all the 0s and the first 1 unchanged, then complement everything
   to the left of that first 1.

Table 5.1 (4-bit signed integers, all three representations side by
side, 0111 down to 1111) — the key things it shows: sign-and-magnitude
and 1's complement both have two representations of zero (+0 and −0);
2's complement has only one zero and one extra negative value (−8, with
no matching +8) that has no positive counterpart.

## 1.1.4 Addition and Subtraction

The sign bit must be treated carefully, and efficiency is the whole point
of choosing a representation.

- **Sign-and-magnitude addition**: only two cases actually need real
  addition/subtraction logic (adding two operands with opposite sign
  bits, or subtracting two with the same sign bit) — complicated enough
  that this representation is essentially never used for arithmetic.

- **1's complement addition**: much better — the sign bit participates
  in the addition as an ordinary bit. Rule: [N1]_1's + [N2]_1's =
  [N1+N2]_1's. Two outcomes: no carry-out from the sign bit (done), or a
  carry-out from the sign bit occurs — add that carry back into the sum
  ("wrapped around" / end-around carry).
  Worked examples (4-bit, sign bit included): (+5)+(+2): 0101+0010=0111
  (+7), no carry. (+5)+(-2): 0101+1101=10010 → wrap the carry back in:
  0010+1=0011 (+3). (-5)+(+2): 1010+0010=1100 (-3), no carry. (-5)+(-2):
  1010+1101=10111 → wrap: 0111+1=1000 (-7). Addition may need to be
  performed twice (once, then again to fold in the wrapped carry) —
  this is the inefficiency that 2's complement fixes.

- **2's complement addition**: the best choice — similar to 1's
  complement, except if a carry-out occurs from the sign bit, just
  **drop it** (don't add it back). Addition of 2 numbers is performed
  only once in any case. Worked examples: (+5)+(+2): 0101+0010=0111
  (+7). (+5)+(-2): 0101+1110=10011 → drop the carry: 0011 (+3).
  (-5)+(+2): 1011+0010=1101 (-3). (-5)+(-2): 1011+1110=11001 → drop the
  carry: 1001 (-7).

- **2's complement subtraction**: easy to convert subtraction to
  addition — A - B = A + (-B). To subtract B, add its 2's complement
  (i.e. complement B including its sign bit, then add 1 — or just take
  the 2's complement of the whole signed number). Example given: 11-9 =
  11+(-9) = ... (worked numerically as an exercise). Four more worked
  cases: (+5)-(+2) = (+5)+(-2) → 0101 + 1110 = 10011 → drop carry → 0011
  (+3). (-5)-(+2) = (-5)+(-2) → 1011 + 1110 = 11001 → drop carry → 1001
  (-7). (+5)-(-2) = (+5)+(+2) → 0101 + 0010 = 0111 (+7). (-5)-(-2) =
  (-5)+(+2) → 1011 + 0010 = 1101 (-3).

## 1.2 Codes

### 1.2.1 Codes for signed numbers

Recap/heading only — this is exactly sign-and-magnitude, 1's complement,
and 2's complement from section 1.1.3 above, framed here as "codes."

### 1.2.2 BCD (Binary Coded Decimal)

Designed to represent a decimal digit with a 4-bit binary group. Each
decimal digit 0-9 maps to its own 4-bit binary value 0000-1001 (i.e.
identical to plain binary for single digits 0-9; unlike pure binary,
multi-digit decimal numbers are encoded **digit by digit**, not as one
big binary number).

E.g. of conversion between decimal and BCD:
(1991.7)₁₀ = (0001 1001 1001 0001.0111)_BCD
(0110 1000 0011.0101)_BCD = (683.5)₁₀

**BCD addition**: the sum of 2 BCD digits must itself be a valid BCD
code. A **plus-6 correction** is required whenever the raw binary sum
exceeds 9 (i.e. sum > 9, or a carry out of the 4-bit group occurred).
Practice cases posed on the slide: 4+5? (=9, no correction needed) and
8+9? (=17, correction needed — add 6 to skip the 6 invalid 4-bit
patterns 1010-1111).

### 1.2.3 Excess-3 code

Based on BCD: Excess-3 = BCD value + 3 (i.e. add 0011 to the 4-bit BCD
pattern, or equivalently encode digit+3 in binary).

| Decimal | Excess-3 |
|---|---|
| 0 | 0011 |
| 1 | 0100 |
| 2 | 0101 |
| 3 | 0110 |
| 4 | 0111 |
| 5 | 1000 |
| 6 | 1001 |
| 7 | 1010 |
| 8 | 1011 |
| 9 | 1100 |

E.g. of conversion with a decimal number: (1991.7)₁₀ = (0001 1001 1001
0001.0111)_BCD = (?)_ex-3 — posed as an exercise (add 3 to each BCD
digit: 0100 1100 1100 0100.1010).

### 1.2.4 Gray code

Adjacent codes differ in only 1 bit — this is the whole point: it
avoids instantaneous/transient errors when a mechanical or electronic
counter transitions between adjacent values (multiple bits changing at
once can be briefly read as a wrong, unrelated value mid-transition).

| Decimal | Binary | Gray |
|---|---|---|
| 0 | 0000 | 0000 |
| 1 | 0001 | 0001 |
| 2 | 0010 | 0011 |
| 3 | 0011 | 0010 |
| 4 | 0100 | 0110 |
| 5 | 0101 | 0111 |
| 6 | 0110 | 0101 |
| 7 | 0111 | 0100 |
| 8 | 1000 | 1100 |
| 9 | 1001 | 1101 |
| 10 | 1010 | 1111 |
| 11 | 1011 | 1110 |
| 12 | 1100 | 1010 |
| 13 | 1101 | 1011 |
| 14 | 1110 | 1001 |
| 15 | 1111 | 1000 |

**Conversion between binary and Gray code**

**1. B→G**: given B = B_n B_{n-1} ... B_0, the Gray code G = G_n G_{n-1}
... G_0 is obtained by: G_n = B_n; G_i = B_{i+1} ⊕ B_i for i = 0..n-1
(XOR each bit with the bit one position to its left, i.e. the
next-more-significant bit). XOR truth table: 0⊕0=0, 0⊕1=1⊕0=1, 1⊕1=0.
Worked examples: B=0111 → G=0100 (chain: G3=B3=0; G2=B3⊕B2=0⊕1=1;
G1=B2⊕B1=1⊕1=0; G0=B1⊕B0=1⊕1=0 → G=0100). B=1100 → G=1010 (G3=1;
G2=1⊕1=0; G1=1⊕0=1; G0=0⊕0=0 → G=1010).

**2. G→B**: B_n = G_n; B_i = B_{i+1} ⊕ G_i (each binary bit is the XOR
of the next-higher binary bit *already computed* and the same-position
Gray bit — this is why it must be computed left-to-right, MSB first,
each step feeding the next). Worked examples on the slide: G=0100 → B:
B3=G3=0, then chain of XORs gives B=0111. G=1010 → B=1100.

### 1.2.4 Parity Check Code

**Code composition**: data sequence + a check bit (Parity): C1 C2 ... Cn P

**Odd or even parity**:
- Odd parity: value of P (0 or 1) definitely makes an **odd** number of
  1s in the whole code.
- Even parity: value of P definitely makes an **even** number of 1s.

**How to get P**:
- Odd parity: P = C1 ⊕ C2 ⊕ C3 ⊕ ... ⊕ Cn ⊕ 1
- Even parity: P = C1 ⊕ C2 ⊕ C3 ⊕ ... ⊕ Cn

**How to check**: parity check equation S = C1 ⊕ C2 ⊕ ... ⊕ Cn ⊕ P
- For odd parity check: if S = 1, correct.
- For even parity check: if S = 0, correct.

### 1.2.5 Character Codes

**ASCII** (American Standard Code for Information Interchange) — 7-bit
code, addressed as b6 b5 b4 (high 3 bits, columns 000-111) by b3 b2 b1
b0 (low 4 bits, rows 0000-1111). Standard table shown on the slide
(control chars like NUL/SOH/... in the low columns, printable
digits/letters/punctuation in the higher columns — e.g. '0'-'9' at
column 011, 'A'-'Z' spanning columns 100-101, 'a'-'z' spanning columns
110-111). Refer to a standard ASCII table for exact codes if needed —
the slide table is the classic 128-entry chart.

## 1.2.5 Character Codes (ASCII)

See the ASCII section above (renumbered here to match the deck's own
"1.2.5" label used on that slide) — 7-bit code table addressed by
b6b5b4 (columns) and b3b2b1b0 (rows).

## Notes for tutoring

- Wifey has already covered radix/positional notation, binary<->octal
  and binary<->hex grouping conversions (incl. the direction point:
  group right-to-left, write left-to-right), and is drilling the octal
  and hex tables. See `handover/HANDOVER.md` for her exact status.
- The 8-4-2-1 bit-weight shortcut is NOT in this deck at all — it was
  something introduced ad hoc in an earlier tutoring session and then
  abandoned. Don't reintroduce it (per HANDOVER.md).
- Signed numbers, addition/subtraction, and the codes section (BCD,
  Excess-3, Gray, parity, ASCII) are all upcoming, not yet taught.

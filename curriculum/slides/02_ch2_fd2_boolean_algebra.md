# CH2 Fundamental 2: Boolean Algebra

Reformatted companion for `02_ch2_fd2_boolean_algebra.pdf` (76 slides).
See CLAUDE.md "Curriculum file formats" — read this file instead of the
original PDF; only open the PDF for a discrepancy, a gap, or if Wifey
asks to see it directly.

## 2.1 Variables and Functions

### 2.1.1 Switch Algebra

A switch has two states: x=0 (open) and x=1 (closed), drawn as a box
labeled S with input x. A simple application: switch S in series with a
light and power supply gives f(x) = x (light is on iff switch closed).

### 2.1.2 Basic Logic Functions (Operations)

- **AND** (logical product)
- **OR** (logical sum)
- **NOT** (logical complement)

**1. AND function**: two switches x1, x2 in series. f(x1,x2) = x1·x2 =
x1x2. f=1 only if x1=1 AND x2=1, otherwise f=0. Called "logical product
and product term" — note the difference from ordinary multiplication.

**2. OR function**: two switches x1, x2 in parallel. f(x1,x2) = x1+x2.
f=1 if x1=1 OR x2=1. Called "logical sum and sum term" — note the
difference from ordinary addition.

**3. NOT function**: a switch x in parallel with the light, with a
series resistor R from the supply. f(x) = x̄ = NOT x = !x = ~x = x'
(five equivalent notations shown).

**4. Example of composite functions**: switches x1, x2 in parallel,
that combination in series with switch x3. f(x1,x2,x3) = (x1+x2)x3.

## 2.2 Truth Table for Logic Functions

2-input AND/OR truth table:
| x1 | x2 | x1·x2 | x1+x2 |
|---|---|---|---|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 |
| 1 | 1 | 1 | 1 |

3-input AND/OR truth table (8 rows, x1x2x3 000-111): the AND column is
0 everywhere except row 111 (=1); the OR column is 0 only at row 000,
1 everywhere else.

Practice questions posed on the slides: truth table for NOT; truth
table for XOR; truth table for f(x1,x2,x3) = (x1+x2)x3 (worked answer
given: 0,0,0,1,0,1,0,1 for rows 000..111).

## 2.3 Basic Logic Gates

Graphical symbols: AND gate (2-input and general n-input), OR gate
(2-input and general n-input), NOT gate (triangle with a bubble on the
output, x → x̄).

## 2.4 Rules in Boolean Algebra

### 2.4.1 Axioms

1a. 0·0=0    1b. 1+1=1
2a. 1·1=1    2b. 0+0=0
3a. 0·1=1·0=0    3b. 1+0=0+1=1
4a. if x=0, x̄=1    4b. if x=1, x̄=0

### 2.4.2 Single-Variable Theorems

5a. x·0=0    5b. x+1=1
6a. x·1=x    6b. x+0=x
7a. x·x=x    7b. x+x=x
8a. x·x̄=0    8b. x+x̄=1
9. x̿ = x (double complement)

### 2.4.3 2- and 3-Variable ones (theorems) and identities

10a. xy=yx    10b. x+y=y+x  — *Commutative*
11a. x(yz)=(xy)z    11b. x+(y+z)=(x+y)+z  — *Associative*
12a. x(y+z)=xy+xz    12b. x+yz=(x+y)(x+z)  — *Distributive*
13a. x+xy=x    13b. x(x+y)=x  — *Absorption*
14a. x+x̄y=x+y    14b. x(x̄+y)=xy

**2- and 3-Variable Identities:**
15a. xy+xȳ=x    15b. (x+y)(x+ȳ)=x  — *Combining*
16a. (xy)‾ = x̄+ȳ    16b. (x+y)‾ = x̄·ȳ  — *DeMorgan's theorem*
17a. xy+x̄z+yz=xy+x̄z    17b. (x+y)(x̄+z)(y+z)=(x+y)(x̄+z)  — *Consensus*

**Simple applications (worked algebraic simplifications):**
1. AB̄+B+BCD = A+B+BCD (Absorption) = A+B (Absorption)
2. AB+Ā·B̄C+BC = AB+C(Ā·B̄+B) (Distributive/Commutative) = AB+C(Ā+B)
   (Absorption) = AB+ĀC+BC (Distributive) = AB+ĀC (Consensus)

### 2.4.4 Other theorems

**1. DeMorgan's theorem** (general n-variable form):
(x1+x2+...+xn)‾ = x̄1·x̄2·...·x̄n
(x1·x2·...·xn)‾ = x̄1+x̄2+...+x̄n

**2. Theorem of Duality**: if F = f(x1,...,xn, 0,1,+,·) then the dual
F_d = f(x1,...,xn, 1,0,·,+) — i.e. swap every 0↔1 and every +↔·,
**leaving the variables themselves and the order of operations
unchanged**.
Examples: F=ĀB+AB̄C̄ → Fd=(Ā+B)(A+B̄+C̄). F=A(B̄+CD)+E →
Fd=[A+B̄(C+D)]E. F=(A+0)(B+C·1) → Fd=A·1+B(C+0). F=A+B+C̄+D+Ē →
Fd=A·B·C̄·D·Ē.

**3. Theorem of inverse functions**: if F = f(x1,...,xn, 0,1,+,·) then
F̄ = f(x̄1,x̄2,...,x̄n, 1,0,·,+) — same swap as duality, **plus**
complementing every variable. Examples (same F's as above): F=ĀB+AB̄C̄
→ F̄=(A+B̄)(Ā+B+C). F=A(B̄+CD)+E → F̄=[Ā+B(C̄+D̄)]Ē. F=(A+0)(B+C·1) →
F̄=Ā·1+B̄(C̄+0). F=A+B+C̄+D+Ē → F̄=Ā·B̄·C·D̄·E.

## 2.5 General Forms of Logic Functions: Sum-of-Products (SOP) and Product-of-Sums (POS)

### 2.5.1 SOP: AND-OR

A function can be read directly off its truth table. For f(x1,x2) with
truth table rows (0,0)→1, (0,1)→1, (1,0)→0, (1,1)→1:
f(x1,x2) = x̄1x̄2 + x̄1x2 + x1x2 (one product term per row where output=1).

**Minterms**: a minterm is a product term in which each variable
appears once and only once, either uncomplemented or complemented.
Simplified notation m_i: fix the order of variables, write 0 for x̄,
1 for x, then i = the decimal value of that bit sequence (= the row
number). So for the example above: m0=x̄1x̄2, m1=x̄1x2, m3=x1x2, and
f(x1,x2) = m0+m1+m3 = Σm(0,1,3) — this sum-of-minterms form is called
**canonical SOP**.

**Canonical SOP**: consists of only minterms. To find it from an
arbitrary expression, e.g. F(A,B,C) = ĀB+AB̄C̄+BC — expand every term to
include all 3 variables (multiply by (x+x̄)=1 for any missing variable)
until only minterms remain.

Progression example: f(x1,x2) = x̄1x̄2+x̄1x2+x1x2 (Canonical SOP) =
x̄1(x̄2+x2)+x1x2 (Non-SOP, an intermediate step) = x̄1+x1x2 (SOP) =
x̄1+x2 (Minimum-cost SOP) — shows canonical → simplified SOP is a chain
of algebraic steps, each stage still equal to the original function but
progressively cheaper.

Three-variable minterm table (row 0-7, x1x2x3 000-111): m0=x̄1x̄2x̄3,
m1=x̄1x̄2x3, m2=x̄1x2x̄3, m3=x̄1x2x3, m4=x1x̄2x̄3, m5=x1x̄2x3, m6=x1x2x̄3,
m7=x1x2x3. Example: f(x1,x2,x3) with output 1 at rows 1,4,5,6 →
f = x̄1x̄2x3+x1x̄2x̄3+x1x̄2x3+x1x2x̄3 = Σm(1,4,5,6).

### 2.5.2 POS: OR-AND

For the same truth table, POS is built from the rows where f=0. f̄ = m2
(the only 0-row), so f = m2‾ = (x̄1x2)‾ = (x̄1+x2)‾... actually worked
as: f̄=m2 ⟹ f = m2‾ = x̄1x2‾ = (x̄1)‾ + x2‾, i.e. f = (x1+x2‾) — shown on
slide as f = M2 = x1+x̄2 after complementing.

**Maxterms**: a maxterm is a **sum term** in which each variable
appears once and only once, either uncomplemented or complemented.
Notation M_i: fix the order of variables, write 1 for x̄, 0 for x
(opposite convention from minterms), i = decimal value = row number.

Three-variable minterm/maxterm table (rows 0-7): m_i as above; M0=x1+x2+x3,
M1=x1+x2+x̄3, M2=x1+x̄2+x3, M3=x1+x̄2+x̄3, M4=x̄1+x2+x3, M5=x̄1+x2+x̄3,
M6=x̄1+x̄2+x3, M7=x̄1+x̄2+x̄3. Key relationship: M_i = (m_i)‾ for every i.

**Canonical POS** consists of only maxterms. Worked example:
f(x1,x2,x3) with output 0 at rows 0,2,3,7 (1 elsewhere) →
f̄ = m0+m2+m3+m7 ⟹ f = (m0+m2+m3+m7)‾ = m0‾·m2‾·m3‾·m7‾ = M0·M2·M3·M7
= (x1+x2+x3)(x1+x̄2+x3)(x1+x̄2+x̄3)(x̄1+x̄2+x̄3) = ΠM(0,2,3,7).

Minimum-cost POS from the same K-map: f(x1,x2,x3) = ΠM(0,2,3,7) =
(x1+x3)(x̄2+x̄3).

Worked algebraic canonical-POS derivation: given F(A,B,C)=ĀB+AB̄C̄+BC,
expand to full POS form step by step (distributing (A+Ā), (B+B̄), (C+C̄)
factors in) to reach F = (A+B+C)(A+B+C̄)(Ā+B+C̄)(Ā+B̄+C) = ΠM(0,1,5,6).

**Relationship between canonical SOP and canonical POS**: for the same
function, Σm(the 1-rows) and ΠM(the 0-rows) are two representations of
the same truth table — e.g. f(x1,x2,x3) = Σm(1,4,5,6) = ΠM(0,2,3,7) (the
minterm indices and maxterm indices between the two forms are always
exactly complementary, partitioning all 2ⁿ rows).

## 2.6 Finding the Minimum-Cost Functions: Algebraic Approach

Uses theorems 13-17 (Absorption, Combining, DeMorgan's, Consensus) as
the toolkit. Worked examples:
1. AB̄C+AB̄C̄ = AB̄; ABC̄+ABC̄‾ = A (typo-ish slide shorthand for a
   combining-type simplification)
2. B̄+AB̄D = B̄; ĀB+ĀBCD(E+F) = ĀB
3. AB+ĀC+B̄C = AB+(Ā+B̄)C = AB+ĀB̄C = AB+C
4. A more difficult one: AB̄+BC̄+B̄C+ĀB = AB̄+BC̄+(A+Ā)B̄C+ĀB(C+C̄)
   = AB̄+BC̄+AB̄C+ĀB̄C+ĀBC+ĀBC̄ = AB̄+BC̄+ĀC

Exercises posed (not worked on the slides):
1. F = AC̄+ABC+ACD̄+CD
2. F = AD+AD̄+AB+ĀC+BD+ACEF+B̄EF+DEFG
3. F = BC+D+D̄(B̄+C̄)(AC+B)

## 2.7 Karnaugh Map

Essentially a truth table redrawn as a matrix (2D truth table).
Variables are split into two groups (arbitrarily assigned to rows vs.
columns); values along each axis are arranged in **Gray-code order**
(so adjacent cells always differ by one variable). Every cell
corresponds to one row of the truth table.

### 2.7.1 Comparison between truth table and K-map

A 2-variable truth table (rows m0..m3) maps to a 2×2 K-map with the
same cells arranged by x1 (columns 0,1) and x2 (rows 0,1): m0 top-left,
m2 top-right, m1 bottom-left, m3 bottom-right.

### 2.7.2 Adjacency of minterms

For an n-variable function's minterm/maxterm, there are **n adjacent**
minterms/maxterms (each cell touches exactly n neighbors that differ in
exactly one variable — including wraparound at the map's edges).
Shown for 2-variable (m0/m1/m2/m3), 3-variable (8-cell map, columns
00/01/11/10, rows split by x3), 4-variable (16-cell map, both axes
00/01/11/10), and 5-variable (two side-by-side 4-variable maps,
addressed by ABC across the top split into two blocks of 4 columns and
CD down the side — labeled 0-31).

### 2.7.3 Denoting a function by K-map

1. **Canonical SOP**: fill every cell with '1' corresponding to every
   minterm. E.g. F(A,B,C)=Σm(2,3,5,7) → four cells marked 1.
2. **General SOP**: fill cells with '1's corresponding to every product
   term (a product term = a whole rectangular group of cells, not just
   one). E.g. F(A,B,C)=AB+AC̄ → the AB group and the AC̄ group of 1s.
3. **Canonical POS**: fill every cell with '0' corresponding to every
   maxterm. E.g. F(x1,x2,x3,x4)=ΠM(0,1,4,8,9,12,15).
4. **General POS**: fill cells with '0's corresponding to every sum
   term (a whole rectangular group of 0s). E.g.
   F(x1,x2,x3)=(x̄1+x3)(x̄1+x2) → two 0-groups on the map.

### 2.7.4 Key features of K-map

- **2^i adjacent 1s** can be merged into a single **product term**,
  from which **i variables are dropped** (the ones that differ across
  the group; the surviving variables are the ones constant across it).
- **2^i adjacent 0s** can be merged into a single **sum term**, from
  which i variables are dropped, the same way.

Illustrated for cases of 2 adjacent 1s (wraparound groups giving
B̄C̄ and ĀB̄), 4 adjacent 1s (three different shapes on a 4-variable map
giving B̄D̄+BD, BD̄+B̄D, and ĀB+CD respectively), and 8 adjacent 1s (a
full 2-column-wide band collapsing to just B).

### 2.7.5 Strategy for Minimization

**1. Finding the simplest SOP with a K-map**:
- Cover all 1s.
- Every circled group must be 2^i adjacent 1s.
- Find as **few groups** as possible to cover all 1s (**high priority**
  — fewer groups means fewer product terms in the expression).
- Make every group (circle) cover **as many 1s** as possible (**low
  priority** — larger groups mean fewer variables in that product term).

Worked examples:
1. F(x1,x2)=Σm(0,1,3) → f = x2 + x̄1
2. F(x1,x2,x3)=Σm(0,1,2,4,5,7) → F(x1,x2,x3) = x̄2 + x̄1x̄3 + x1x3 (three
   overlapping groups shown: a 4-cell x̄2 group, and two 2-cell groups)
3. F(x1,x2,x3,x4)=x̄1x̄2+x̄1x̄3x̄4+x1x3+x2x̄3 → simplifies (with a
   different/better grouping choice) to x̄1x̄2+x2x̄3+x1x3 — the slide
   explicitly asks "another solution?", i.e. more than one
   minimum-cost grouping can exist for the same map.

Exercises posed:
- F(A,B,C) = AB̄+BC̄+B̄C+ĀB
- F(A,B,C,D) = Σm(0,3,4,5,7,11,13,15)
- F(A,B,C,D) = Σm(0,1,2,3,4,6,7,8,9,11,15)

**2. Finding the simplest POS using a K-map** (dual procedure):
- Cover all 0s.
- Cover 2^i adjacent 0s one at a time.
- Find every group covering as many 0s as possible (low priority — the
  larger the group, the fewer variables in the corresponding sum term).
- Find as few groups as possible to cover all 0s (high priority — the
  fewer the groups, the fewer sum terms in the expression).

Worked example: F(x1,x2,x3,x4)=x̄1x̄2+x1x3x4+x1x3+x2x̄3 (same function as
minimization example 3 above) → minimum POS f =
(x1+x2+x3)(x̄1+x2+x3)... i.e. F(x1,x2,x3,x4) = x̄1x̄2+x2x̄3+x1x3 for SOP
and f=(x1+x̄2+x̄3)(x̄1+x2+x3) for POS (both forms shown side by side on
the same map, 0-groups circled in blue).

Exercises posed:
- F(A,B,C) = AB̄+BC̄+B̄C+ĀB
- F(A,B,C,D) = Σm(0,1,2,3,6,7,8,9,11,15)
- F(A,B,C,D) = ΠM(2,3,4,5,6,7,11,15)

## 2.8 Incompletely Specified Functions

Correspond to circuits where certain input combinations never occur —
called a **don't-care** condition. Every corresponding cell is filled
with a 'd' (don't-care term).

**Strategy for minimization**: make full use of d's **as 1s** when
minimizing f into SOP; make full use of d's **as 0s** when minimizing f
into POS (i.e. you're free to pick whichever value — 0 or 1 — for each
don't-care cell makes the grouping bigger/cheaper).

Worked example: f(x1,...,x4) = Σm(2,4,5,6,10) + d(12,13,14,15) — shown
with two different minimum implementations: (a) SOP grouping the d's in
as 1s to get bigger groups (x̄2x̄3, x2x̄3... labeled x̄2x3‾ style groups
on the slide), giving one SOP form; (b) POS grouping the same d's in as
0s to bound the 0-regions, giving (x2+x3)(x̄3+x̄4)-style groups —
demonstrating the SOP and POS minimum implementations of the same
incompletely-specified function can use the don't-cares differently.

Exercises posed:
- F(A,B,C,D) = Σm(0,2,7,13,15) + Σd(1,3,4,5,6,8,10)
- F(A,B,C,D) = Σm(0,2,3,5,7,8,10,11) + Σd(14,15)

## 2.9 Cost

A function has different implementations (SOP, POS, ...) — which one
entails the minimum cost? **Cost = number of gates plus the total
number of inputs (wires) to all gates.** Assumption: a single variable
in true and complemented forms is at equal cost (i.e. don't count NOT
gates for inverted inputs that are assumed freely available — though
worked examples below do count explicit inverter gates when drawn).

**Example of cost calculation**: f = x1x̄2+x3x̄4. Circuit: 2 AND2 gates
feeding 1 OR2 gate → 3 gates + 6 wires (inputs) = cost of **9**.

**Minimum-cost SOP or POS?** — worked comparison on a specific function
shows minimum SOP costing 2 gates + 4 wires = **6**, while the
corresponding minimum POS for the same function costs 3 gates + 6 wires
= **9** — i.e. the minimum SOP and minimum POS of the same function do
not necessarily cost the same, and the question "which one is better?"
is posed explicitly (no universal answer — check both). A second,
larger example (the F(x1,x2,x3,x4) function from section 2.7.5) shows
SOP = 4 gates + 9 wires = 13 vs. POS = 3 gates + 8 wires = 11 for that
particular function (POS cheaper this time) — reinforcing that neither
form is always cheaper.

## 2.10 Multiple-Output Functions

A group of functions that share variables corresponds to a
multiple-output circuit. **The whole system is not usually at minimum
cost if each function is simplified separately** — sharing terms across
outputs can reduce total cost.

**Example 1**: f1 = x1x̄3+x̄1x3+x2x̄3x4 and f2 = x1x̄3+x̄1x3+x2x3x4, each
minimized separately, cost 14+14 = **28** total. But f1 and f2 share
the product terms x1x̄3 and x̄1x3 — building one shared pair of AND
gates and feeding both OR gates (rather than duplicating those two AND
gates) drops the **integrated cost to 28-6 = 22**.

**Example 2**: f3 = x̄1x4+x2x4+x̄1x2x3 and f4 = x1x4+x̄2x4+x̄1x2x3x̄4,
each optimally realized alone with **no shared terms at all** — cost
14+15 = **29** total, with the slide explicitly noting "no sharing
terms!" as a possible outcome. But re-examining the two K-maps together
and deliberately choosing to group terms that *can* be shared (even if
each individual grouping isn't the cheapest for that one function
alone) gives f3 = x̄1x4+x1x2x4+x̄1x2x3x̄4 and
f4 = x̄2x4+x1x2x4+x̄1x2x3x̄4 — cost 11+6+6 = **23**, cheaper than 29
despite neither f3 nor f4 alone being in its individually-minimal form.
Lesson: search deliberately for shared terms across a multi-output
system rather than minimizing each output independently.

## 2.11 Concluding Remarks

- Theorems in Boolean algebra.
- Manipulation of logic functions: canonical SOP & POS; simplest SOP &
  POS.
- K-map: structure & features? How to build it given an arbitrary
  function? Principles of simplification? Special cases (don't-cares,
  multiple outputs)...

## Notes for tutoring

Not yet started — Unit 1 (Number Systems and Codes) is still in
progress. See `handover/HANDOVER.md` for current status. This deck
should not be taught until Unit 1 is confirmed complete via practice.

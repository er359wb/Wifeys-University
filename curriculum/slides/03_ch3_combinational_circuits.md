# CH3 Combinational Logic Circuits

Reformatted companion for `03_ch3_combinational_circuits.pdf` (50 slides).
See CLAUDE.md "Curriculum file formats" — read this file instead of the
original PDF; only open the PDF for a discrepancy, a gap, or if Wifey
asks to see it directly.

## 3.1 Features of Combinational Circuits

**Instantaneous response**: non-memorial (memoryless) circuits; outputs
determined only by current inputs; consisting of gates or building
blocks. f_i = f(x1,x2,...,xn), i = 1,2,...,n (n inputs feed a
combinational block producing outputs f1...fn, each depending only on
the present input values).

## 3.2 Issues on Combinational Circuits

- **Analysis** given circuit diagrams.
- **Design** and implementation according to requirements.
- Widely used **building blocks**: modular design.

## 3.3 Analysis of Basic Combinational Circuits

### 3.3.1 Approach

1. Find logical expressions for outputs (level by level from inputs to
   output).
2. Minimize.
3. Build the truth table (or K-map).
4. Describe functionalities verbally.

### 3.3.2 Examples

**Example 1** — a NAND3 → three AND2 → NOR3 circuit (inputs A,B,C):
P1 = (ABC)‾ (NAND3). P2 = A·P1, P3 = B·P1, P4 = C·P1 (three AND2 gates,
each combining one input with P1). F = (P2+P3+P4)‾ (NOR3).

Simplify: F = (P2+P3+P4)‾ = (A·(ABC)‾ + B·(ABC)‾ + C·(ABC)‾)‾
= ((A+B+C)·(ABC)‾)‾ = (A+B+C)‾ + ABC = ĀB̄C̄ + ABC.

Truth table (A,B,C → F): F=1 only at rows 000 and 111, F=0 elsewhere.

**Conclusion**: this circuit is designed to judge the **equivalence**
of its three inputs (output is 1 iff A, B, and C are all equal — all 0
or all 1).

**Practice circuit** posed for analysis (not worked): a network of
OR2/NOR2/XOR/OR2 gates feeding a NAND2 and an AND2, built from inputs
NOT A, NOT B, C, B (intermediate signals P1-P6, output F).

## 3.4 Design of Basic Combinational Circuits

### 3.4.1 Approach

1. Construct the truth table based on requirements.
2. Get the canonical or simplest form.
3. Draw the circuit diagram.

### 3.4.2 Examples

**E.g. 1 (single output) — implementation of a 3-input voting circuit**

Step 1: construct the truth table.
- Let x1, x2, x3 be the 3 inputs representing the 3 voters' choices.
  x_i = 1 = voting for a proposal; x_i = 0 = voting against it.
- Let f be the output = the voting result. f = 1 = the proposal is
  voted through; f = 0 = the proposal is vetoed.

Truth table (A,B,C → F, using A,B,C for x1,x2,x3): F=0 at rows
000,001,010,100; F=1 at rows 011,101,110,111 (i.e. majority rule — F=1
whenever 2 or more of A,B,C are 1).

Step 2: canonical SOP and simplify: f = Σm(3,5,6,7) → f = AB+AC+BC
(K-map grouping shown: pairwise AND of each two inputs).

Step 3: circuit diagram — three AND2 gates (AB, AC, BC) feeding one
OR3 gate → F.

**E.g. 2 (multi-output) — implementation of a coded lock**

Logical functions/requirements:
- No response if key A is solely pressed.
- **Unlocked** if key A and B, or A and C, or A, B, C are pressed
  simultaneously.
- **Alarm** otherwise.

Step 1: A, B, C = 1 representing pressed; = 0 representing released.
Let U = output for whether it's unlocked (U=1 unlocked, U=0 locked).
Let Alarm = output for whether it sounds an alarm (=1 if it does).

Truth table (A,B,C → U,Alarm): row 000→U=0,Alarm=0(marked with a note —
this is the "no response" case, effectively neither unlocked nor
alarmed since nothing was pressed... actually the slide shows Alarm=0
circled specially at row 000, i.e. this row is the true "no response"
case, distinct from the alarm cases); 001→U=0,Alarm=1; 010→U=0,Alarm=1;
011→U=0,Alarm=1; 100→U=0,Alarm=0 ("A solely pressed" = no response);
101→U=1,Alarm=0; 110→U=1,Alarm=0; 111→U=1,Alarm=0.

Step 2: canonical SOPs and simplify: U = Σm(5,6,7) → U = AB+AC.
Alarm = Σm(1,2,3) → Alarm = ĀB+ĀC.

Step 3: circuit diagram — AND2(A, B-or-C-via-OR2) feeding U; another
AND2(NOT A, B-or-C-via-the-same-OR2) feeding Alarm — the OR2(B,C) is
shared between the two output branches.

**E.g. 3 (incompletely specified) — implementation of a comparator**

Logical functions: inputs are BCD codes; output is 1 when the code > 4
and < 10, otherwise 0 (BCD codes 10-15 never occur as inputs → those
are don't-care rows).

K-map constructed directly (4 variables A,B,C,D) and simplified.
Simplest SOP: f = A+BD+BC (grouped from BD, BC, and A regions on the
map, using the don't-cares to enlarge groups).

**E.g. 4 (comprehensive) — design of a WLI (Water Level Indicator)**

Requirements: 3 sensor levels A, B, C (A highest, C lowest).
- **Green** light on if the water level is between A and B (normal).
- **Yellow** light on if between B and C, or above A (anomalous).
- **Red** light on if below C (dangerous).

Step 1: A,B,C = 1 representing the water level being above that
sensor; = 0 otherwise. Let G,Y,R be the pilot lights (=1 lights on).

Truth table (A,B,C → G,Y,R): row 000→R=1 (below C, dangerous);
001→Y=1 (between B and C — impossible physically to be below C's
sensor-not-tripped but above... this is the "between B,C" case per the
labeling); row 010→don't-care (physically impossible: below B's level
but above C's — inconsistent since level is continuous, C is below B);
row 011→G=1 (between A and B... actually the slide labels row 011 as
G=1, matching "normal"); rows 100,101,110→don't-care (physically
impossible combinations); row 111→Y=1 (above A, anomalous).
*(Exact impossible-row reasoning follows from the physical setup: water
level is a single continuous quantity, so certain A/B/C sensor
combinations can never occur — those become don't-cares 'd'.)*

"Successive implementation omitted" on the slide — i.e. the K-map
minimization and final circuit for G, Y, R were not carried through in
this deck; treat this as an exercise if it comes up in tutoring.

## 3.5 Combinational-Circuit Building Blocks

### 3.5.1 Adders

**1. Half adder (HA)** — performs addition of 2 1-bit binary numbers
(no carry-in). Four cases: 0+0=00, 0+1=01, 1+0=01, 1+1=10 (top bit =
carry c, bottom bit = sum s).

Truth table (x,y → c,s): 00→0,0; 01→0,1; 10→0,1; 11→1,0.

Equations: s = x̄y+xȳ = x⊕y; c = xy.

Circuit: one XOR gate (x,y → s), one AND gate (x,y → c). Graphical
symbol: box "HA" with inputs x,y and outputs s,c.

**2. Full adder (FA)** — performs addition of 2 1-bit binary numbers
**with carry-in from the lower bit position** involved.

Truth table (c_i, x_i, y_i → c_{i+1}, s_i), 8 rows 000-111:
000→0,0; 001→0,1; 010→0,1; 011→1,0; 100→0,1; 101→1,0; 110→1,0; 111→1,1.

Derivation: s_i = x̄_iȳ_ic_i + x̄_iy_ic̄_i + x_iȳ_ic̄_i + x_iy_ic_i
= (x̄_iy_i+x_iȳ_i)c_i + (x̄_iȳ_i+x_iy_i)c̄_i = (x_i⊕y_i)c_i + (x_i⊕y_i)‾c̄_i
= x_i ⊕ y_i ⊕ c_i.

c_{i+1} = x_iy_i + x_ic_i + y_ic_i  ...(1) [the direct SOP-minimized form]
c_{i+1} = x̄_iy_ic_i + x_iȳ_ic_i + x_iy_ic̄_i + x_iy_ic_i
= (x_i⊕y_i)c_i + x_iy_i  ...(2) [an algebraically-rearranged
equivalent, useful for a modular HA-based build]

**Circuit 1** (built directly from expression (1)): XOR(x_i,y_i)→s_i;
three AND2 gates (x_iy_i, x_ic_i, y_ic_i) feeding an OR3 gate → c_{i+1}.

**Circuit 2 — modular design with HAs as components**: first HA takes
(x_i,y_i) → intermediate sum/carry; second HA takes (that sum, c_i) →
final s_i and an intermediate carry; an OR2 gate combines the two HA
carry outputs → c_{i+1}. Block diagram and detailed gate-level diagram
both shown, matching equation (2)'s structure.

**Linking FAs (ripple-carry) to implement multi-bit addition**: a chain
of FA blocks, LSB position first (c0 in) up through MSB position (c_n
out), each FA's carry-out feeding the next FA's carry-in — x_0y_0 at
the LSB end, x_{n-1}y_{n-1} at the MSB end.

### 3.5.2 Multiplexer

Components of a 2ⁿ-to-1 multiplexer: 2ⁿ data inputs, n select inputs,
1 data output. Functionality: passes one of the data inputs through to
the single output, selected by the value of the select inputs.

**A 2-to-1 multiplexer**: inputs w0, w1, select s, output f.
Truth table: s=0→f=w0; s=1→f=w1.
Sum-of-products circuit: f = s̄w0 + sw1 = Σ_{i=0}^{1} m_i w_i.

**A 4-to-1 multiplexer**: inputs w0-w3, selects s1,s0, output f.
Truth table: s1s0=00→f=w0; 01→f=w1; 10→f=w2; 11→f=w3.
f = s̄1s̄0w0 + s̄1s0w1 + s1s̄0w2 + s1s0w3 = Σ_{i=0}^{3} m_i w_i.

**General pattern**: for an 8-to-1 multiplexer, f = Σ_{i=0}^{7} m_i w_i
(one minterm-of-the-selects times each data input). For any multiplexer
with n select inputs: f = Σ_{i=0}^{2ⁿ-1} m_i w_i. **A multiplexer's
output is directly relevant to (structured exactly like) the canonical
SOP** — each data input plays the role of "gating" one minterm.

**Realizing logic functions using multiplexers** — approach:
1. Find the canonical SOP of the function to implement.
2. List the output expression of the MUX to be used.
3. Compare them.
4. Make them equal by setting values (0, 1, or a variable) for the data
   inputs.
5. Draw the circuit.

**E.g. 1**: implement XOR2 using a 4-to-1 multiplexer. f1 = x̄1x0+x1x̄0.
Match to f2 = s̄1s̄0w0+s̄1s0w1+s1s̄0w2+s1s0w3 by connecting x1→s1, x0→s0,
and setting w0=w3=0, w1=w2=1.
A more efficient realization using only a 2-to-1 multiplexer: f1 =
x̄1x2+x1x̄2 → f2 = s̄w0+sw1, matched by linking x1→s, x2→w0, x̄2→w1 (i.e.
feed x2 into w0 directly and its inverse into w1).

**E.g. 2**: implement the 3-input majority function using a 4-to-1
multiplexer. f1 = Σm(3,5,6,7) = ĀBC+AB̄C+ABC̄+ABC =
ĀB̄·0 + ĀBC + AB̄C + AB·1 (rewritten to line up with the 4-to-1 MUX's
four s1s0 cases). Match by linking A→s1, B→s0, and setting the four
data inputs to 0, C, C, 1 respectively.

**Consider: how about using a 2-to-1 multiplexer?** — f =
x̄1x̄2x3+x1x̄2x̄3+x1x2x̄3+x1x2x3, algebraically factored down to
x̄1(x̄2·0+x2x3) + x1(x2x3+x2·1), realized with three 2-to-1 muxes
cascaded (two feeding a third), each selected by x2, x1 respectively.

Exercise posed: implement a full adder using multiplexers (full adder
truth table given again as reference).

**Modular design: build a larger multiplexer with smaller ones** — a
4-to-1 multiplexer built from three 2-to-1 multiplexers (two first-stage
muxes selected by s0, feeding a third mux selected by s1). Generalizes
to a 16-to-1 multiplexer built from five 4-to-1 multiplexers (four
first-stage muxes selected by s0,s1, feeding one final mux selected by
s2,s3).

### 3.5.3 Decoders

Components: n inputs, 2ⁿ outputs, an En(able) input. Functionality:
**one-hot encoded outputs** — only 1 output is asserted (active-high or
active-low) under the control of the input values, if enabled; no
output is asserted if disabled.

**A 2-to-4 decoder**: inputs w1,w0,En; outputs y0-y3.
Truth table (active-high): En=1 → exactly one of y0..y3 = 1 matching
w1w0's binary value (00→y0, 01→y1, 10→y2, 11→y3); En=0 → all outputs 0
regardless of w1,w0 (shown as "x,x").
Logic circuit: two inverters (for w̄0, w̄1) feeding four AND3 gates
(each combining En with the appropriate combination of w1/w̄1 and
w0/w̄0) → y0-y3.
Regardless of En's specific role in the equation, it gives: y0=w̄1w̄0=m0,
y1=w̄1w0=m1, y2=w1w̄0=m2, y3=w1w0=m3 — **every output matches every m_i
with the inputs as variables!**

**Any n-to-2ⁿ decoder**: generalizes the same pattern — **one-to-one
correspondence between outputs and minterms with the inputs as
variables.**

**Implementation of functions with decoders** — e.g. 3-input majority
built with a 3-to-8 decoder: feed w1,w2,w3 into the decoder's x0,x1,x2;
OR together the decoder outputs y3,y5,y6,y7 (the minterms where
majority=1) → f = Σm(3,5,6,7).

Practice exercise posed: implement a full adder using a 3-to-8 decoder.

**Hierarchy of decoders**: a 3-to-8 decoder built from two 2-to-4
decoders — w0,w1 feed both 2-to-4 decoders directly; w2 (inverted and
un-inverted) ANDed with En selects which of the two 2-to-4 decoders is
actually enabled, producing y0-y3 from one and y4-y7 from the other.
Generalizes to a **decoder tree**: a 4-to-16 decoder built from one
small 2-to-4 "selector" decoder (on w2,w3) whose 4 outputs enable four
more 2-to-4 decoders (each on w0,w1), together producing y0-y15.

### 3.5.4 Code Converters

**A typical example: BCD-to-7-segment decoder.** Inputs w0-w3 (a BCD
digit), outputs a-g (the seven segments of a 7-segment display, arranged
a top, f/b upper sides, g middle, e/c lower sides, d bottom).

Truth table (w3w2w1w0 → a,b,c,d,e,f,g) for BCD digits 0-9 (only the
first 10 of 16 possible input rows are valid BCD — the rest are
don't-cares, though not marked as such on this particular truth table):
0000→1111110; 0001→0110000; 0010→1101101; 0011→1111001;
0100→0110011; 0101→1011011; 0110→1011111; 0111→1110000;
1000→1111111; 1001→1111011 (each row: a b c d e f g).

## Notes for tutoring

Not yet started — Unit 1 (Number Systems and Codes) is still in
progress. See `handover/HANDOVER.md` for current status.

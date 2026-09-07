# CH6 Synchronous Sequential Logic Circuits

Reformatted companion for `06_ch6_sequential_circuits.pdf` (41 slides).
See CLAUDE.md "Curriculum file formats" — read this file instead of the
original PDF; only open the PDF for a discrepancy, a gap, or if Wifey
asks to see it directly.

**Note on ordering**: the deck's own section numbers are not in
strictly increasing slide order — section **6.5** (the vending-machine
example) physically appears **before** section **6.4** (VHDL
implementation) in the slides. This file preserves the actual slide
order (6.1, 6.2, 6.3, 6.5, then 6.4) rather than renumbering anything.

## 6.1 A General Structure

Block diagram: primary input W feeds a Combinational circuit, whose
output feeds Flip-flops (an "edge triggered network"), whose output Q
feeds a second Combinational circuit producing primary output Z; Q also
feeds back into the first combinational circuit; a shared Clock drives
the flip-flops. This whole structure is a **Finite State Machine
(FSM)**.

- Outputs **may** depend on both inputs & present states of flip-flops.
  - External (Primary) outputs (e.g. Z).
  - Internal outputs: inputs of flip-flops (D, T, JK...).
- Inputs:
  - External (primary) inputs (e.g. W).
  - Internal inputs: feedback inputs from flip-flops (present state).

**Moore type & Mealy type**:
- **Moore type**: whose external outputs **only** depend on the present
  state.
- **Mealy type**: whose external outputs depend on **both** the present
  state and primary inputs.

## 6.2 Basic Design Steps

**Implementation of a "11" sequence detector:**
- A primary input *w*, and an output, *z*.
- Serial input and output synchronized by clock signal.
- A single clk synchronizing rising-edge-triggered flip-flops.
- Z=1 if w=1 during **two or more** consecutive clock cycles; z=0
  otherwise.

Example input/output sequence:
| Clock cycle | t0 | t1 | t2 | t3 | t4 | t5 | t6 | t7 | t8 | t9 | t10 |
|---|---|---|---|---|---|---|---|---|---|---|---|
| w | 0 | 1 | 0 | 1 | 1 | 0 | 1 | 1 | 1 | 0 | 1 |
| z | 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 | 1 | 0 |

### 6.2.1 State Diagram

Determine the number of states needed; set a starting state first;
consider state transitions from the starting state to the last, which
covers all cases.
- Assume **A** is the initial state: w=0 at the beginning; z=0.
- Assume **B** is the 2nd state: the 1st '1' occurs at the input; z=0.
- Assume **C** is the 3rd state: the 2nd '1' occurs at the input; z=1.
- **Z is determined only by the state! → Moore type.**

State diagram: A has a self-loop on w=0; A→B on w=1; B→A on w=0; B→C
on w=1; C has a self-loop on w=1; C→A on w=0. States labeled A/z=0,
B/z=0, C/z=1.

### 6.2.2 State Table

| Present state | Next state (w=0) | Next state (w=1) | Output z |
|---|---|---|---|
| A | A | B | 0 |
| B | A | C | 0 |
| C | A | C | 1 |

### 6.2.3 State Assignment

Letter states in the table; binary states in flip-flops — each letter
must be assigned a binary value.
- **How many flip-flops at least? 2.** 2 state variables (y1, y0)
  correspond to 2 flip-flops. Possible codes: 00, 01, 10, 11 — choose 3
  of them! **More than one assignment is possible.**
- **Choose one arbitrarily: let A=00, B=01, C=10, value 11 not used.**

Binary state table (y2y1 present state; Y2Y1 next state for w=0 and
w=1; output z):
| Present y2y1 | Next (w=0) | Next (w=1) | z |
|---|---|---|---|
| A=00 | 00 | 01 | 0 |
| B=01 | 00 | 10 | 0 |
| C=10 | 00 | 10 | 1 |
| 11 | dd | dd | d |

### 6.2.4 Derivation of Next-State & Output Expressions

A slight modification is made to the state table (re-ordering rows to
00, 01, 11, 10 — standard K-map order — rather than 00, 01, 10, 11)
before building K-maps. From the K-maps:

**Y2 = w·y1 + w·y2**
**Y1 = w·y̅1·y̅2** (w AND NOT-y1 AND NOT-y2)
**z = y2**

### Choice of Flip-Flops

D? T? JK? — E.g.: choose **D flip-flops**. Since Q^(n+1) = D, the
excitation (internal output) functions are simply:
**D2 = Y2 = w·y1 + w·y2**
**D1 = Y1 = w·y̅1·y̅2**

### 6.2.5 Build the Circuit Diagram

Two D flip-flops (y2/z output, y1 output). D2 is built from an OR gate
(feedback of y1 and y2) ANDed with w; D1 is built from an AND gate
combining w with the complement of both y1 and y2 (fed via the D
flip-flops' Q̄ outputs). Clock and an active-low **Resetn** line feed
both flip-flops. z is taken directly from y2 (z = y2).

### 6.2.6 The Timing Diagram

Clock, w, y1, y2, z waveforms shown across t0-t10, matching the
original input/output table — confirms z=1 exactly during the cycles
following two-or-more consecutive w=1's, consistent with the "11"
detector specification.

### 6.2.7 Some Detailed Issues

**1. Set the starting state**: the circuit can start with any state:
00, 01, 10, or *11*. Setting "00" as the initial state is a good way
(this is what the active-low **Resetn** input is for).

**2. The potential impact of unused states**: the "11" state is not
used during the derivation of state diagrams. However, it may occur
typically during startup. It's necessary to check the behavior of the
circuit once it's in the "11" state.
Substituting y2=1 and y1=1 into the derived equations Y2=w·y1+w·y2,
Y1=w·y̅1·y̅2, z=y2 gives: **Y2 = w, Y1 = 0, z = 1**. Which indicates: the
circuit changes its state to "00" if w=0, and to "10" if w=1 →
**Self-restoring!** — the capability of automatically entering any
valid state.

**3. State-assignment problem**: a state table corresponds to more
than one assignment. Consider another one: states A, B, **C** are
represented with valuations y2y1 = 00, 01, and **11** respectively (C
now = 11 instead of 10). This alternative assignment gives:
**Y1 = D1 = w**, **Y2 = D2 = w·y1**, **z = y2** — a visibly simpler set
of expressions than the first assignment, illustrating that the choice
of state assignment affects circuit cost/complexity.

**4. Selecting other flip-flops**: "How about JK flip-flop?" (posed as
an open question, not worked through in this deck).

### 6.2.8 Summary of Design Steps

- Derive the state diagram by setting an initial state.
- State diagram → state table.
- *State minimization → optimal state table.* (mentioned, not covered
  in depth in this deck)
- State assignment.
- Deriving next-state functions and external output functions.
- Choice of flip-flops.
- Deriving excitation functions (D, J, K, T...).
- Build the circuit diagram.
- Analysis of impact of unused states.

## 6.3 Mealy Type Implementation

Implementation of the same "**11**" sequence detector, but as a Mealy
machine this time:
- A primary input *w*, and an output, *z*.
- Rising-edge triggered.
- Z=1 if w=1 during two or more consecutive clock cycles; z=0
  otherwise. (Two slightly different example input/output tables shown
  — the output z shifts by one position relative to the Moore version,
  since a Mealy output can respond within the same cycle as the
  triggering input rather than one cycle later.)

### 6.3.1 State Diagram

Only **2** states needed this time (fewer than the Moore version's 3,
since output no longer needs its own dedicated state): A has a
self-loop on w=0/z=0; A→B on w=1/z=0; B→A on w=0/z=0; B has a
self-loop on w=1/z=1. **Z is determined by both the inputs and the
present state.**

### 6.3.2 State Table

| Present state | Next (w=0) | Next (w=1) | Output (w=0) | Output (w=1) |
|---|---|---|---|---|
| A | A | B | 0 | 0 |
| B | A | B | 0 | 1 |

### 6.3.3 State Assignment

**Only 1 flip-flop is needed** (2 states → 1 bit). Let A=0, B=1 (state
variable y).
| Present y | Next (w=0) | Next (w=1) | Output z (w=0) | Output z (w=1) |
|---|---|---|---|---|
| A=0 | 0 | 1 | 0 | 0 |
| B=1 | 0 | 1 | 0 | 1 |

### 6.3.4 Derivation of Next-State & Output Expressions

**Y = D = w**
**z = w·y**

### 6.3.5 Circuit & Timing Diagram

A single D flip-flop: D input = w directly; an AND gate combines w and
the flip-flop's Q output (y) to produce z. Clock and active-low Resetn
drive the flip-flop. Timing diagram across t0-t10 confirms z pulses
exactly matching "two-or-more consecutive w=1" runs, now possibly
overlapping/adjacent since Mealy output can assert one cycle earlier
than the Moore version.

## 6.5 Another Example (Mealy Type)

**Implementation of a vending coffee machine:**
- ¥1.5 for each cup.
- Either a 50-cent coin or a ¥1 coin is accepted.
- Sell a coffee if ¥1.5 deposited, or return ¥0.5 change besides
  sending out a coffee if ¥2 deposited.
- Considerations: which inputs and what do they represent? Which
  outputs and what do they represent? State changes?

### 6.5.1 State Diagram

Determine number of primary inputs and external outputs:
- Input **A**: deposit a ¥1 coin or not.
- Input **B**: deposit a ¥0.5 coin or not.
- Output **Y**: sell a cup of coffee or not.
- Output **Z**: return a ¥0.5 change or not.
- Starting state **S0**.
- 2nd state **S1**: a ¥0.5 coin is deposited.
- 3rd state **S2**: a ¥1 coin is deposited.
- **S0 is the final state as well!**

State diagram (transitions labeled AB/YZ; **AB=11 never occurs**, since
only one coin can be deposited per cycle):
- S0: self-loop 00/00; S0→S1 on 01/00; S1→S0 on 10/10; S0→S2 on 10/00;
  S1→S2 on 01/00; S1 self-loop 00/00; S2→S0 on 01/10; S2→S0 on 10/11;
  S2 self-loop 00/00.

(Reading the transitions: from S0, depositing ¥0.5 (01) goes to S1
producing no output yet; depositing ¥1 (10) goes to S2 with no output.
From S1 [¥0.5 already in], depositing ¥1 (10) returns to S0 and
outputs 10 = sell coffee, no change [0.5+1=1.5 exactly]; depositing
¥0.5 again (01) goes to S2 with no output [total ¥1 so far]. From S2
[¥1 already in], depositing ¥0.5 (01) returns to S0 outputting 10 =
sell coffee, no change [1+0.5=1.5]; depositing ¥1 again (10) returns to
S0 outputting 11 = sell coffee **and** return change [1+1=2, so sell
coffee for 1.5 and return 0.5].)

### 6.5.2 State Table

| Q (state) | AB=00 | AB=01 | AB=11 | AB=10 |
|---|---|---|---|---|
| S0 | S0/00 | S1/00 | d/dd | S2/00 |
| S1 | S1/00 | S2/00 | d/dd | S0/10 |
| S2 | S2/00 | S0/10 | d/dd | S0/11 |

### 6.5.3 State Assignment

Let S0=00, S1=01, S2=10, **11 left unused**. (Q1&Q0 as state
variables.) Binary state table (rows/cols Q1Q0 × AB, each cell =
next-state/output):
00→(00/00, 01/00, dd/dd, 10/00); 01→(01/00, 10/00, dd/dd, 00/10);
11→(dd/dd, dd/dd, dd/dd, dd/dd); 10→(10/00, 00/10, dd/dd, 00/11).

### 6.5.4 Finding Expressions for Outputs

From K-maps built on the binary state table:
**D1 = Q1·Ā·B̄ + Q̄1·Q̄0·A + Q0·B**
**D0 = Q̄1·Q̄0·B + Q0·Ā·B̄**
**Y = Q1·B + Q1·A + Q0·A**
**Z = Q1·A**

(Labeled "implication of using D flip-flops" — i.e. these ARE the
excitation functions directly, since Q^(n+1)=D for a D flip-flop.)

### 6.5.5 The Circuit

Built from AND/OR gates and 2 D flip-flops (labeled with international
IEC-style symbols: "1D", "C1" clock, "R" reset) producing Q1 and Q0,
combined via AND/OR-NOT gate trees to realize D1, D0, Y, and Z per the
expressions above, driven by inputs A, B, CP (clock), and an active-low
reset R̄D.

### 6.5.6 The Impact of the State "11"

Substituting Q1Q0=11 into the expressions above gives:
**D1 = Q1^(n+1) = Ā + B**
**D0 = Q0^(n+1) = Ā·B̄**
**Y = A + B**
**Z = A**

State-diagram check (all 4 binary states 00,01,11,10 shown together):
from state 11, transitions are 10/11 or 01/10 → still ends up cycling
among {11, 10} rather than reliably reaching a valid normal state —
**Anything wrong? 1. Incapable of self-restoring. 2. Errors in [output].
Resetting when power-on is required.** — a direct contrast with the
"11" sequence detector's earlier self-restoring result: this vending-
machine design, with this particular state assignment, does **not**
self-recover from the unused state and needs an explicit reset at
power-on.

## 6.4 Implementation in VHDL

**Code for Moore-type implementation** (the "11" sequence detector
from section 6.2):
```vhdl
1  LIBRARY ieee;
2  USE ieee.std_logic_1164.all;
3  ENTITY simple IS
4    PORT (Clock, Resetn, w: IN STD_LOGIC;
           z: OUT STD_LOGIC);
5  END simple;

7  ARCHITECTURE Behavior OF simple IS
8    TYPE State_type IS (A, B, C);
9    SIGNAL y: State_type;
10 BEGIN
   PROCESS (Resetn, Clock)
   BEGIN
13     IF Resetn = '0' THEN
14       y <= A;
15     ELSIF (Clock'EVENT AND Clock = '1') THEN
16       CASE y IS
17         WHEN A =>
18           IF w = '0' THEN
19             y <= A;
20           ELSE
21             y <= B;
22           END IF;
23         WHEN B =>
24           IF w = '0' THEN
25             y <= A;
26           ELSE
27             y <= C;
28           END IF;
29         WHEN C =>
30           IF w = '0' THEN
31             y <= A;
32           ELSE
33             y <= C;
34           END IF;
35       END CASE;             -- WHEN OTHERS not required
36     END IF;
37   END PROCESS;
38   z <= '1' WHEN y = C ELSE '0';
39 END Behavior;
```

**Code for Mealy-type implementation** (the "11" sequence detector
from section 6.3):
```vhdl
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mealy IS
  PORT (Clock, Resetn, w: IN STD_LOGIC;
        z: OUT STD_LOGIC);
END mealy;

ARCHITECTURE Behavior OF mealy IS
  TYPE State_type IS (A, B);
  SIGNAL y: State_type;
BEGIN
  PROCESS (Resetn, Clock)
  BEGIN
    IF Resetn = '0' THEN
      y <= A;
    ELSIF (Clock'EVENT AND Clock = '1') THEN
      CASE y IS
        WHEN A =>
          IF w = '0' THEN
            y <= A;
          ELSE
            y <= B;
          END IF;
        WHEN B =>
          IF w = '0' THEN y <= A;
          ELSE y <= B;
          END IF;
      END CASE;
    END IF;
  END PROCESS;

  PROCESS (y, w)
  BEGIN
    CASE y IS
      WHEN A =>
        z <= '0';
      WHEN B =>
        z <= w;
    END CASE;
  END PROCESS;
END Behavior;
```
(Note the structural difference from the Moore code: the Mealy version
needs a **second, separate process** — sensitive to `y` and `w` both —
to compute `z`, since a Mealy output depends on the input directly and
not just the clocked state; the Moore version could set `z` with one
concurrent statement outside any process, since it only depends on
state `y`.)

## Notes for tutoring

Not yet started — Unit 1 (Number Systems and Codes) is still in
progress. See `handover/HANDOVER.md` for current status.

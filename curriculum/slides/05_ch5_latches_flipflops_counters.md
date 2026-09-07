# CH5 Basic Storage Units: Latches, Flip-flops and Counters

Reformatted companion for `05_ch5_latches_flipflops_counters.pdf`
(58 slides). See CLAUDE.md "Curriculum file formats" — read this file
instead of the original PDF; only open the PDF for a discrepancy, a
gap, or if Wifey asks to see it directly.

## 5.1 A Brief Introduction

Motivating example: an alarm system. Sensor drives a "Set" input,
a "Reset" input can turn it off, both feed a memory element whose
On/Off output drives the alarm.
- 'Set' triggers the alarm.
- The alarm **remains active** even if Set returns to 0 — the memory
  element must **store the state**; the present On/Off output is
  determined by not only the inputs but also the past state.
- The alarm is turned off if Reset = 1.

Review of NOR and NAND truth tables (used to build the basic latch):
NOR(x1,x2): 00→1, 01→0, 10→0, 11→0. NAND(x1,x2): 00→1, 01→1, 10→1, 11→0.

## 5.2 Basic Latch

Built from two cross-coupled NOR gates: R and S feed one NOR gate each
(cross-coupled so each gate's output feeds the other gate's second
input), giving outputs Qa and Qb — complements of each other in the
normal state.

Characteristic table (S,R → Qa,Qb):
00 → 0/1, 1/0 (no change — whichever it was, it stays); 01 → 0,1;
10 → 1,0; 11 → 0,0 (**anomalous state** — Qa=Qb, breaking the normal
complementary relationship; explicitly marked "state stored!" as the
row to watch out for even in the 00 no-change case).

**More about the anomalous state**: what if S and R go back to 0
simultaneously (from 1,1)? Outputs **oscillate** between 0 and 1;
although S and R do not change simultaneously in reality, the next
state is not easily predicted. **Critical to avoid having both S & R
= 1.**

**Logic expression**: Q^(n+1) = S + R̄·Q^n, with **constraint RS = 0**
(this constraint is exactly what excludes the anomalous S=R=1 case).
K-map (Q^n vs. RS = 00,01,11,10): 00→0/1(unchanged, shown as 0 and 1
row-dependent), 01→1, 11→d (don't-care, excluded by the constraint),
10→0.

**State diagram**: two states (0 and 1) with self-loops labeled
RS=10,00 (state 0) and RS=01,00 (state 1), and cross-transitions
labeled RS=01 (0→1) and RS=10 (1→0).

**Timing diagram**: shows the basic latch changing state on *any*
change in either input while the other is held such that a change can
propagate — the slide's point is this leads to **irregularity of
waveforms** (unpredictable timing of state changes) since there's no
clock to control *when* changes may occur.

## 5.2 Gated SR Latch

(Numbered 5.2 again on the slide, following straight on from the basic
latch — not a typo to "fix," just how the deck numbers it.)

An input disturbance may affect the state of a basic latch at any
time — state cannot be retained consistently. Adding a **Clk** signal
(via two AND gates gating R and S into R' and S' before the
cross-coupled NOR pair) means the clock signal only **allows changes
in state to occur at periodic time intervals**.

Characteristic table (Clk, S, R → Q(t+1)):
Clk=0: x,x → Q(t) (no change, regardless of S/R).
Clk=1: 0,0 → Q(t) (no change); 0,1 → 0; 1,0 → 1; 1,1 → x (still
undefined/forbidden even with the clock).

**Timing diagram of gated SR latch**: shows Q/Q̄ changing only during
clock pulses, giving "more regular" waveforms than the unclocked
basic latch — but the very last clock pulse shown has both S=1,R=1
during that pulse, leaving Q and Q̄ marked "?" (still breaks down in
the forbidden case).

**Gated SR with NAND gates**: an alternative circuit — S and R each
gated with Clk through a NAND gate (giving active-low S', R'), feeding
a cross-coupled NAND pair (instead of NOR) for Q/Q̄. Functionally
equivalent gated SR latch, built with all-NAND logic.

## 5.3 Gated D Latch

A gated SR latch in essence, but with a single input D — S is derived
directly from D and Clk (via an AND gate), R is derived from D̄ and Clk
(D inverted, then ANDed with Clk) — S and R are **always complements
of each other**, which is exactly what eliminates the SR latch's
forbidden state.

Characteristic table (Clk, D → Q(t+1)): 0,x → Q(t) (no change);
1,0 → 0; 1,1 → 1. Characteristic equation: **Q^(n+1) = D**.

Timing diagram shows Q following D whenever Clk=1, and holding when
Clk=0 — explicitly labeled **"level sensitive"** (Q can change multiple
times during one clock pulse if D changes during that pulse — shown
circled at t3). The slide concludes: **basic SR, gated SR and gated D
are all level sensitive!** — motivating the need for edge-triggered
storage in the next section.

## 5.4 Master-Slave and Edge-Triggered D Flip-Flop

**Master-slave D flip-flop**: a "Master" gated D latch (clocked
directly by Clock) feeds a "Slave" gated D latch (clocked by the
*inverted* Clock) — Qm doesn't change when Clock=0; Qs (=Q) doesn't
change when Clock=1; **Q changes only when Clock changes from 1 to 0
(falling edge)**. This is the definition given for a **flip-flop: an
edge-triggered storage element that changes its output state only at
the edge of Clock.**

Timing diagram: shows D can change freely while Clock=1 (Qm tracks it
mid-pulse) but Q=Qs only updates at the falling edge, i.e. **Q does not
change** during the rest of the pulse even though D and Qm do.

**A different edge-triggered D flip-flop** (an alternative direct
circuit, not master-slave): built from 6 NAND gates numbered 1-6.
Gates 1/2 and 3/4 form two cross-coupled NAND pairs (each gated by
Clock and D or D̄) producing intermediate signals P3(=D-ish), P1, P2,
P4(=D̄-ish); gates 5/6 form a final cross-coupled NAND pair taking P1
and P2 to produce Q and Q̄.
- **When Clock=0**: Q is frozen, because P1=P2=1 regardless of D.
- **Just before Clock=1**: P3 and P4 were preset (based on D)
  beforehand.
- **When Clock=1** (D held steady): it gives P1 = (D·1)‾ = D̄, P2 =
  (D̄·D̄·1)‾... resolving to give **Q^(n+1) = D**, as required.
- **If D changes from 0→1 during Clk=1**: Q ends up unchanged (P4
  becomes "locked" once P2/P1 have already resolved) — demonstrating
  the circuit only truly captures D at the moment Clock transitions,
  not throughout the whole Clock=1 level.
- **If D changes from 1→0 during Clk=1**: symmetric result — Q is
  again unchanged ("state is retained!"), with P3 locked this time.
- General principle demonstrated across these cases: **during Clk=1,
  once the internal gates lock, the output is retained regardless of
  further changes to D** — this is what makes the circuit genuinely
  edge-triggered rather than level-sensitive.

**Level-sensitive vs. edge-triggered storage element** (side-by-side
timing comparison): three D-type elements — Qa (a plain gated D latch,
level-sensitive, tracks every D pulse while Clock=1), Qb (a
rising-edge-triggered D flip-flop, small triangle clock symbol),
Qc (a falling-edge-triggered D flip-flop, triangle-with-bubble clock
symbol) — all driven by the same Clock and D waveforms, visibly
updating at different times from each other, illustrating the
distinction concretely.

**D flip-flop with Clear and Preset**: built from 8 NAND gates (4 in
the master stage gated by Preset/Clear lines, 4 in the slave stage).
Active low, **asynchronous** Clear and Preset (they override D/Clock
immediately, independent of clocking), **falling-edge triggered** in
this particular circuit. A second variant is also shown built to be
**rising-edge triggered** instead, with the same Preset/Clear/Clock/D
port structure — graphical symbol: box with D, Clock (triangle), Q, Q̄,
plus Preset (top, bubble) and Clear (bottom, bubble) for active-low.

## 5.5 T Flip-Flop

Single input T, built internally from two AND gates (T with Q̄, T̄ with
Q) feeding an OR gate into a D flip-flop's D input, with Clock going to
both the AND gates and the flip-flop's clock.

Truth table: T=0 → Q(t+1)=Q(t) (hold); T=1 → Q(t+1)=Q̄(t) (**toggle**).
Characteristic equation: **Q^(n+1) = T·Q̄^n + T̄·Q^n**, labeled the
**"Toggle flip-flop."** Timing diagram confirms: Q flips only on clock
edges where T was 1 during that cycle.

## 5.6 JK Flip-Flop

Inputs J, K, built from two AND gates (J with Q̄, K̄ [K inverted] with
Q) feeding an OR gate into a D flip-flop, Clock again routed to both
the AND gates and the flip-flop.

Truth table (J,K → Q(t+1)): 00→Q(t) (hold); 01→0 (reset); 10→1 (set);
11→Q̄(t) (**toggle**). Characteristic equation:
**Q^(n+1) = J·Q̄^n + K̄·Q^n**, also labeled a "Toggle flip-flop" — the
key advantage over SR being that J=K=1 has a well-defined (toggle)
meaning instead of being forbidden.

## 5.7 Synchronous Counters

Purpose: counting, timing, generating controlling signals (e.g. a
derived clock). Usually consists of **toggle flip-flops**.

**Understanding counters' behavior**: a flip-flop stores 1 bit of
state stably. An n-bit (modulo-2ⁿ) counter consists of n flip-flops
synchronized by a shared clock. The counting sequence is formed by
simultaneously toggling one or more flip-flops in the counter, all
controlled by that shared clock.

### 5.7.1 Counting behavior

A 3-bit (modulo-8) up-counter, clock cycles 0-8, Q2Q1Q0: 000, 001, 010,
011, 100, 101, 110, 111, 000 (wraps). Observation: Q1 changes (toggles)
every other cycle; Q2 changes even less often — motivating: how many
flip-flops are needed, and what type? (Answer: T or JK flip-flops.)

### 5.7.2 Implementation of an n-bit up-counter

Using Q^(n+1) = T·Q̄^n + T̄·Q^n (when T=1 it toggles): consider Q0 which
toggles every clock cycle → **T0 = 1** (always toggles). Consider Q1
which toggles only if Q0=1 → **T1 = Q0**. Consider Q2 which toggles
only if Q1=1 & Q0=1 → **T2 = Q1·Q0**. Consider Q3, toggling if
Q2=Q1=Q0=1 → **T3 = Q2·Q1·Q0**. General rule: **Q_n toggles if
Q_{n-1}=...=Q1=Q0=1 → T_n = Q_{n-1}·Q_{n-2}···Q1·Q0** (AND of all lower
bits).

### 5.7.3 A 4-bit (modulo-16) counter with T flip-flops

Four T flip-flops chained: first T tied to constant 1 (always
toggles, produces Q0); an AND gate combines Q0 with the next stage's
feedback to form each successive T input (T1=Q0, T2=Q1·Q0, T3=Q2·Q1·Q0
realized via cascaded 2-input ANDs). Timing diagram confirms the
standard binary count sequence 0-15 then wraps to 0.

### 5.7.4 Enable and Clear Capability

Adds an **Enable** line ANDed into each stage's toggle-driving AND
gates, and a **Clear** line tied to each flip-flop's asynchronous clear
input. When Enable=0, the counting process is **paused**. When Clear=0
(active low), the counter is **reset to all 0s**. **Enable is
synchronized by clock, while Clear is not (asynchronous)!**

### 5.7.5 A 4-bit counter with D flip-flops

Same modulo-16 counting behavior, but each stage is built from an XOR
gate (combining the running AND-chain signal with the current Q) feeding
a D flip-flop's D input — explicitly labeled on the diagram as
implementing "T flip-flop" behavior (D = T⊕Q) using D-flip-flop
hardware, one XOR+D-FF pair per bit, cascaded via the same AND-chain
pattern as the T-flip-flop version, plus an Output carry line from the
final AND gate.

### 5.7.6 Counters with Parallel Load

Motivation: it's unnecessary to always count from 0 — desirable to
start with any value and count from it. Each bit position gets a
2-to-1 multiplexer (selected by Load) ahead of its D flip-flop's D
input: input 0 = the normal toggle/XOR-derived next-count value, input
1 = the corresponding external Data input (D0-D3). **When load=0**,
counting proceeds normally if Enabled. **When load=1**, D3~D0 are
selected and loaded into the counter on the next rising clock edge —
the counter is reset to D3D2D1D0 and counts from there.

### 5.7.7 Implementation of any modulo-N counter

An n-bit up-counter naturally functions as modulo-2ⁿ. To get a
modulo-N counter with N < 2ⁿ: **skip some counts** from the full
2ⁿ sequence by linking some outputs to the *load* input so as to reset
the counter to "D_{n-1}...D0" (typically all zero) before it counts up
to all 1s — called **reset synchronization**. Worked circuit: a 3-bit
counter with Enable=1, D0=D1=D2=0, and an AND gate watching for the
count reaching a specific value (here producing a **modulo-6**
counter — counts 0,1,2,3,4,5,0,1,... per the shown timing diagram).

**Modulo-10 counter (BCD counter)**: based on a 4-bit (modulo-16)
counter with reset synchronization — an AND gate (labeled with the
right bit pattern for reaching 9) feeds back into Load to reset to
0000 right after count 9, giving a 0-9 repeating BCD counter (shown
abstracted as a "BCD" block with Enable/D0-D3/Load/Clock in, Q0-Q3
out).

**Modulo-10 counter with carry out**: same BCD block, plus a Carry
output that is asserted when Q=9 — used to build counters with a
larger modulo value by chaining.

**Cascading 2 BCD counters** → a **modulo-100** counter: left BCD
counter's Enable tied to 1 (works every clock cycle); its Carry output
drives the right BCD counter's Enable (right one only advances once
per 10 cycles of the left one, i.e. is "driven by the Carry of the
left one"). Questions posed: what's the ratio of counting frequency
between the two? (10:1) The Carry-out is generated every how many
clock cycles? (100) What's the overall range of counts? (00-99). This
is a **synchronous system**, achieved **without loading** — the left
counter just runs continuously and the right one is gated by its carry.

**Modulo-24 counter** (answering "what if N ≠ A×B for two BCD
counters"): two BCD counters again, but this time with **integral
parallel load** — note the extra AND gate whose inputs are wired so
that both counters' Loads are enabled **simultaneously** exactly when
the combined count reaches 24, resetting both back to 00 together
(rather than letting the tens counter simply free-run to 9). Result:
counts from **00 to 23** (2 BCD digit-groups). Posed as a further
exercise: how to implement other modulo-X counters, e.g. modulo-60
(as needed for a clock's seconds/minutes counter)?

### 5.7.8 Modulo-X Counters in QUARTUS II

Example: the modulo-10 counter using the **74160** chip (74161 is the
analogous plain 4-bit up counter without BCD wraparound). Pin
functions: **LDN** (Load, active low), **A,B,C,D** (parallel data
inputs, ordered D3~D0 informally as D~A), **ENT & ENP** (two separate
Enable pins, both must be asserted to count), **RCO** (ripple carry
out), **CLRN** (Clear, active low), **CLK**, **QA~QD** (outputs,
QD~QA = Q3~Q0).

The **modulo-24 counter with two 74160s** in Quartus II: both chips'
LDN driven from a shared NAND3 gate (inputs QL0, QL1, QR1 — i.e. it
detects reaching binary 24 across the two 4-bit groups: left nibble's
bits 0,1 and right nibble's bit 1) that pulls LDN low to reload both
counters to 0 simultaneously once the combined count would reach 24;
ENT/ENP tied to VCC (always enabled) with the left counter's RCO
driving the right counter's chain; outputs relabeled QL0-QL3 (left/
tens digit) and QR0-QR3 (right/units digit) plus a combined carry
output. A simulation waveform is shown confirming the counter cycles
0-23 correctly (labeled QL/GH groups going 0,1,2,then wrapping, with a
brief carry pulse each wrap).

**Exercise 1** and **Exercise 2** (posed, not worked): wiring diagrams
of a single 74160 with various D0-D3/EP/ET/CP connections (Exercise 2
adds an extra NOT gate on an "M" mode-select input) — asking the
learner to determine the resulting modulo/behavior.

**Exercise 3**: two cascaded **74161** chips (each a plain modulo-16
counter, no BCD wraparound) with an AND gate feeding back into both
LD‾ lines from Q1 of the second chip — question posed: "what if both
counters are replaced with 2 BCD counters?"

## 5.8 Storage Elements in VHDL

### 5.8.1 Code for the gated D latch

```vhdl
LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Dlatch IS                    --D latch as an example
  PORT (D, Clk: IN STD_LOGIC;
        Q: OUT STD_LOGIC);
END Dlatch;
ARCHITECTURE Behavior OF Dlatch IS
BEGIN
  PROCESS (D, Clk)          -- D or Clk can cause an output change!
  BEGIN
    IF Clk = '1' THEN       -- level sensitive
      Q <= D;
    END IF;                 -- implied memory
  END PROCESS;
END Behavior;
```
(The missing `ELSE` branch on the `IF Clk='1'` is exactly what gives
this **implied memory** — Q simply keeps its last value when Clk≠1.)

### 5.8.2 Code for the D flip-flop

```vhdl
LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY D_ff IS                      --D flip-flop as an example
  PORT (D, Clk: IN STD_LOGIC;
        Q: OUT STD_LOGIC);
END D_ff;
ARCHITECTURE Behavior OF D_ff IS
BEGIN
  PROCESS (Clk)              -- Only an active edge can cause an output change
  BEGIN
    IF Clk'EVENT AND Clk = '1' THEN   -- rising-edge triggered
      Q <= D;
    END IF;
  END PROCESS;
END Behavior;
```

**Code for the D flip-flop with asynchronous clear:**
```vhdl
LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY DFF IS
  PORT (D, Clk, Clr: IN STD_LOGIC;
        Q: OUT STD_LOGIC);
END DFF;
ARCHITECTURE Behavior OF DFF IS
BEGIN
  PROCESS (Clk, Clr)          -- Clr signal NOT clocked
  BEGIN
    IF Clr = '0' THEN         -- Clr signal NOT clocked
      Q <= '0';
    ELSIF Clk'EVENT AND Clk = '1' THEN
      Q <= D;
    END IF;
  END PROCESS;
END Behavior;
```

### 5.8.3 Code for a counter

```vhdl
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
ENTITY upcount IS                          --a 4-bit up counter as an example
  PORT (Clock, Clr, En: IN STD_LOGIC;      --with clear & enable capability
        Q: OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END upcount;
ARCHITECTURE Behavior OF upcount IS
  SIGNAL Count: STD_LOGIC_VECTOR (3 DOWNTO 0);   --internal signal
BEGIN
  PROCESS (Clock, Clr)
  BEGIN
    IF Clr = '0' THEN                 --asynchronous clear
      Count <= "0000";
    ELSIF (Clock'EVENT AND Clock = '1') THEN
      IF En = '1' THEN                --synchronous enable
        Count <= Count + 1;
      END IF;
    END IF;
  END PROCESS;
  Q <= Count;      -- The Count signal passes the result to Q outside the clock process
END Behavior;
```

**Alternative code (using the BUFFER mode)** — avoids needing the
separate internal `Count` signal, since a `BUFFER` port can be read
back inside its own architecture (unlike a plain `OUT` port):
```vhdl
ENTITY upcount IS
  PORT (Clock, Clr, En: IN STD_LOGIC;
        Q: BUFFER STD_LOGIC_VECTOR (3 DOWNTO 0));  -- the BUFFER mode
END upcount;
ARCHITECTURE Behavior OF upcount IS
BEGIN
  PROCESS (Clock, Clr)
  BEGIN
    IF Clr = '0' THEN
      Q <= "0000";
    ELSIF (Clock'EVENT AND Clock = '1') THEN
      IF En = '1' THEN
        Q <= Q + 1;      -- Q is directly used, being of mode BUFFER
      END IF;
    END IF;
  END PROCESS;
END Behavior;
```

**Code for a counter with parallel load:**
```vhdl
ENTITY upcount IS
  PORT (Data: IN STD_LOGIC_VECTOR(3 downto 0);   --parallel data inputs
        Clock, Clear, Ld: IN STD_LOGIC;
        Q: BUFFER STD_LOGIC_VECTOR(3 downto 0));
END upcount;
ARCHITECTURE Behavior OF upcount IS
BEGIN
  PROCESS (Clock, Clear)
  BEGIN
    IF Clear = '0' THEN
      Q <= "0000";
    ELSIF (Clock'EVENT AND Clock = '1') THEN
      IF Ld = '1' THEN            --parallel load (active high)
        Q <= Data;
      ELSE
        Q <= Q + 1;
      END IF;
    END IF;
  END PROCESS;
END Behavior;
```

**Code for a modulo-N counter with the 74160 chip:**
```vhdl
-- with 74160 counter as the example
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
entity T74LS160 is
  Port ( Clk: in std_logic;
         Q: buffer std_logic_vector(3 downto 0);  --QD,QC,QB,QA
         Carry: out std_logic;
         Clr: in std_logic;
         Data: in std_logic_vector(3 downto 0);   --D,C,B,A
         Ld: in std_logic;                        --active low
         p: in std_logic;                         --ENP
         t: in std_logic);                        --ENT
end T74LS160;
architecture BEHAVIORAL of T74LS160 is
begin
  Carry <= '1' when (Q="1001" and t='1' and Clr='1') else '0';
  process(clk,clr)
  begin
    if Clr='0' then Q<="0000";              --asynchronous clear
    elsif(rising_edge(clk)) then            --the rising_edge function
      if(ld='1') then                        --active low
        if(p='1') then
          if(t='1') then
            if(Q="1001") then               --modulo-10 counter
              Q<="0000";
            else Q<=Q+1;
            end if;
          else Q<=Q;                         --state kept if t=0
          end if;
        else Q<=Q;                           --state kept if p=0
        end if;
      else Q<=Data;                          --parallel load (active low)
      end if;
    end if;
  end process;
end BEHAVIORAL;
```

## Notes for tutoring

Not yet started — Unit 1 (Number Systems and Codes) is still in
progress. See `handover/HANDOVER.md` for current status.

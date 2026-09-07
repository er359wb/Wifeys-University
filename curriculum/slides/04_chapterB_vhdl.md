# CH4 VHDL Language

Reformatted companion for `04_chapterB_vhdl.pdf` (43 slides — titled
"CH4 VHDL Language" internally despite the filename's "chapterB").
See CLAUDE.md "Curriculum file formats" — read this file instead of the
original PDF; only open the PDF for a discrepancy, a gap, or if Wifey
asks to see it directly.

## 4.1 What is VHDL?

VHDL = **V**ery-**H**igh-speed-integrated-circuits **H**ardware
**D**escription **L**anguage. An industry standard of IEEE & U.S. DoD
used to model digital systems at many levels. Two standard versions:
VHDL 87 and VHDL 93 (this course studies a core subset).

## 4.2 Design Units

- **Entity** and **Architecture** (covered here)
- *Configuration* (not covered — greyed out on the slide)
- **Library** and **Package** (covered here)

### 4.2.1 Entity Declaration

Specifies the device name and external interfaces.

```vhdl
ENTITY half_adder IS
  PORT (x, y: IN BIT;      --signal name, mode & type
        s, c: OUT BIT);
END half_adder;
-- This is a comment line
```

**4 modes for VHDL signals** (i.e. port directions):
- **IN**: an input port
- **OUT**: an output port
- *INOUT* (not detailed here)
- *BUFFER*: to be detailed in later chapters

Another example — a 2-to-4 decoder:
```vhdl
ENTITY dec2to4 IS               --a 2-to-4 decoder
  PORT(w1, w0, en: IN BIT;
       y: OUT BIT_VECTOR(3 DOWNTO 0)  --one of the array types
      );
END dec2to4;
```

### 4.2.2 Architecture Body

Specifies the internal details with one of these styles:
- **Dataflow**: a set of **concurrent** assignment statements.
- **Behavioral**: a set of **sequential** assignment statements.
- **Structural**: a set of interconnected components.

**1. Dataflow** example (half adder):
```vhdl
--E.g.1: dataflow description of HA
ARCHITECTURE ha_concurrent OF half_adder IS  --start of ARC
--Declarative part in between
BEGIN
  s <= x XOR y;   --2 concurrent signal assignment statements in arbitrary order
  c <= x AND y;
END ha_concurrent;
```

Second example (2-to-4 decoder, dataflow):
```vhdl
--E.g.2: dataflow description of dec2to4
ARCHITECTURE behavior OF dec2to4 IS
BEGIN
  y(0) <= en AND NOT (w(1) OR w(0));
  y(1) <= en AND (NOT w(1)) AND w(0);
  y(2) <= en AND w(1) AND (NOT w(0));
  y(3) <= en AND w(1) AND w(0));
END ha_concurrent;
```

**2. Behavioral**: specify internal details with a set of statements
executed **sequentially**, encapsulated inside a `PROCESS` statement.

```vhdl
--E.g.: behavioral description of 4-to-1 multiplexer
ENTITY mux4to1 IS
  PORT(w: IN BIT_VECTOR(3 DOWNTO 0);
       s: IN BIT_VECTOR(1 DOWNTO 0);
       f: OUT BIT);
END mux4to1;
ARCHITECTURE behave OF mux4to1 IS
BEGIN
  PROCESS(s, w)   --process statement followed by a sensitivity list;
                  --any event on any signal in the list triggers the process
  BEGIN
    CASE s IS
      WHEN "00" => f <= w(0);   --sequential signal assignment statement
      WHEN "01" => f <= w(1);
      WHEN "10" => f <= w(2);
      WHEN "11" => f <= w(3);
    END CASE;
  END PROCESS;
END behave;
```

**3. Structural**: an entity (high level) is described as a set of
interconnected components (low level).
- Every component should be implemented in advance.
- Declare components in the declarative part of the architecture body.
- Link instantiated components to build the top-level circuit.

E.g. of structural modeling: implementation of a full adder (FA) using
two half adders (HA) as components:
```vhdl
ENTITY full_adder IS
  PORT (x,y,cin: IN BIT;       --interfaces of FA
        sum,carry: OUT BIT);
END full_adder;
ARCHITECTURE f_adder OF full_adder IS
  COMPONENT half_adder          --HA has its own entity and architecture already realized
    PORT(a,b: IN BIT;           --copied from the PORT clause in HA's entity declaration
         s,c: OUT BIT);
  END COMPONENT;
  SIGNAL h1_s, h1_c, h2_c: BIT; --internal signals in FA
BEGIN
  --2 PORT MAP clauses used to instantiate 2 components
  h1: half_adder PORT MAP(a=>x, b=>y, s=>h1_s, c=>h1_c);   --mappings in parenthesis
  -- (a second instantiation h2, and an OR2 to combine h1_c/h2_c into carry,
  --  continues beyond what's captured here)
END f_adder;
```
(Wiring per the block diagram: cin and h1's sum s feed a second HA;
that HA's carry plus h1's carry feed an OR gate to produce `carry`;
the second HA's sum is the final `sum`.)

## 4.3 Identifiers

- Case insensitive.
- Composed of letters, digits, or `_`.
- Beginning with a letter is required.
- Ending with `_` is illegal.
- A double underscore `__` is illegal.

## 4.4 Data Objects

### 4.4.1 Constant declarations
```vhdl
CONSTANT rise_time: TIME := 10ns;
CONSTANT bus_width: INTEGER := 8;
```

### 4.4.2 Variable declarations
```vhdl
VARIABLE ctrl_status: BIT_VECTOR(10 DOWNTO 0);
VARIABLE sum: INTEGER RANGE 0 to 100 := 10;
VARIABLE found, done: BOOLEAN;
```

### 4.4.3 Signal declarations
```vhdl
SIGNAL h1_s, h1_c, h2_c: BIT;
SIGNAL data_bus: BIT_VECTOR(0 TO 7);
SIGNAL gate_delay: TIME := 10 NS;
```
Note: interfaces declared in a `PORT` clause are signals, where the
keyword `SIGNAL` is optional.

### Variables vs. Signals

- **Signals are global, variables are local.**
  - Signals are declared outside a subprogram and can be used anywhere
    in the architecture body.
  - Variables can be declared and used **only** inside a subprogram
    (e.g. inside a process).
- `<=` for signals; `:=` for variables.
- **Delayed** value assignment for signals; **instantaneous** one for
  variables.

Worked illustration (order-of-effect gotcha): given
```vhdl
d <= a;
x <= c XOR d;
d <= b;
y <= c XOR d;
```
with `d` a **signal**: because signal assignment is delayed, both `x`
and `y` end up computed against `d`'s *old* value at the time each
statement was evaluated within the process — result: x = c XOR b,
y = c XOR b (both branches effectively see the value **last scheduled**,
not each intermediate assignment in sequence — the slide labels this
outcome "Result: x = c XOR b, y = c XOR b").
If `d` were a **variable** instead, each `:=` takes effect immediately,
so x = c XOR a (using d's value right after the first assignment) and
y = c XOR b (using d's value right after the second assignment) — the
two differ specifically because of variables' immediate vs. signals'
delayed update timing.

## 4.5 Operators

| Logical | Relational | Arithmetical | Catenation |
|---|---|---|---|
| AND | = | + | |
| OR | /= | - | |
| NOT | < | * | |
| NAND | <= (also for signal assignment) | / | & |
| NOR | > | ** (exponentiation) | |
| XOR | >= | MOD | |
| XNOR | | REM | |
| | | ABS | |

## 4.6 Data Types

### 4.6.1 Part of Predefined Data Types

- `BIT` (0, 1)
- `BIT_VECTOR` — predefined array type
- `INTEGER` — range -(2^31 - 1) ~ (2^31 - 1)
- `BOOLEAN` (TRUE, FALSE)
- `CHARACTER`
- ...

**STD_LOGIC** — one of the most frequently used types, a 9-valued
logic system:
```
( 'U',  -- Uninitialized
  'X',  -- Forcing Unknown
  '0',  -- Forcing 0
  '1',  -- Forcing 1
  'Z',  -- High Impedance
  'W',  -- Weak Unknown
  'L',  -- Weak 0
  'H',  -- Weak 1
  '-'   -- Don't care
)
```
`STD_LOGIC_VECTOR` — array-of-`STD_LOGIC` version, analogous to
`BIT_VECTOR`.

### 4.6.2 User Defined Data Types (self-studying)

**Enumeration types**: any type with a set of user-defined values
consisting of identifiers and character literals.
```vhdl
TYPE bit_logic IS ('0','1','Z','X');
TYPE traffic_light IS (red, green, yellow);
TYPE micro_op IS (load, store, add, sub, mul, div);
```

**Array types**: consist of elements of the same type.
```vhdl
TYPE register IS ARRAY(0 TO 7) OF BIT;
TYPE register_1 IS ARRAY(7 DOWNTO 0) OF BIT;
TYPE rom IS ARRAY(0 TO 7) OF register;
TYPE rom IS ARRAY(0 TO 7, 0 TO 7) OF BIT;
TYPE std_logic_vector IS ARRAY(natural range <>) OF std_logic;
```

## 4.7 Libraries and Packages

A library includes packages. A package encapsulates a set of related
declarations of: types, constants, functions, subcircuits (components), ...

### 4.7.1 Examples of packages in certain libraries

```vhdl
package STANDARD is        --in library STD
  type BOOLEAN is (FALSE, TRUE);    --enumeration type
  type BIT is ('0', '1');
  type CHARACTER IS (...);
  type INTEGER is range -2147483648 to 2147483647;
  type BIT_VECTOR is array (NATURAL range <>) of BIT;
  ...
end STANDARD;
```

```vhdl
PACKAGE std_logic_1164 IS   --in library IEEE
  ...
  SUBTYPE std_logic IS resolved std_ulogic;
  TYPE std_logic_vector IS ARRAY (NATURAL RANGE <>) OF std_logic;
  FUNCTION "and"  (l, r: std_logic_vector) RETURN std_logic_vector;
  FUNCTION "nand" (l, r: std_logic_vector) RETURN std_logic_vector;
  FUNCTION "or"   (l, r: std_logic_vector) RETURN std_logic_vector;
  FUNCTION "nor"  (l, r: std_logic_vector) RETURN std_logic_vector;
  FUNCTION "xor"  (l, r: std_logic_vector) RETURN std_logic_vector;
  FUNCTION "xnor" (l, r: std_logic_vector) RETURN std_logic_vector;
  FUNCTION "not"  (l: std_logic_vector) RETURN std_logic_vector;
```

### 4.7.2 Declarations of libraries and packages

Syntax: `LIBRARY library-name;` e.g. `LIBRARY IEEE;`
`USE library-name.package-name.item;` e.g. `USE IEEE.STD_LOGIC_1164.ALL;`

By the way: declaration of library **STD is implicit** (always
available); declaration of library **IEEE is explicit** (must write
`LIBRARY IEEE;` yourself).

## 4.8 VHDL Statements

### 4.8.1 Concurrent statements

**1. Signal assignment statement** — plain `<=`, as already shown for
dataflow architectures (half adder, decoder examples above).

**2. Conditional signal assignment (when...else clauses)**
```
Syntax:
Target-signal <= [value1 when condition1 else]
                 [value2 when condition2 else]
                 ...
                 valueN;
```
```vhdl
--Implement 4-to-1 multiplexer using when-else clauses
ENTITY mux4to1 IS
  PORT(w: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
       s: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
       f: OUT STD_LOGIC);
END mux4to1;
ARCHITECTURE behave OF mux4to1 IS
BEGIN
  f <= w(0) when s="00" else
       w(1) when s="01" else
       w(2) when s="10" else
       w(3);   -- when s="11" (the final else-value, no "when" needed)
END behave;
```
Note: **when...else must enumerate all the conditions** (i.e. there
must always be a final unconditional value covering every remaining
case — a real gate can't have an undefined output).

**3. Selected Signal Assignment Statement (with...select)**
```
Syntax:
with expression select      --using all valuations as select conditions
  target-signal <= value1 when condition1,
                   value2 when condition2,
                   ...
                   valueN when conditionN,
                   [valueN+1 when others];
```
```vhdl
--Implement 4-to-1 multiplexer using with-select clauses
ARCHITECTURE behave OF mux4to1 IS
BEGIN
  WITH s SELECT
    y <= w(0) WHEN "00",
         w(1) WHEN "01",
         w(2) WHEN "10",
         w(3) WHEN "11",
         'X'  WHEN OTHERS;
END behave;
```

### 4.8.2 Sequential statements

Everything below is used **inside** a `PROCESS`.

**1. PROCESS statement**
```
Syntax:
[process-label:] PROCESS [(sensitivity-list)]
  [process-item-declarations]
begin
  various kinds of sequential-statements
end process [process-label];
```
```vhdl
ARCHITECTURE ha_concurrent OF half_adder IS
BEGIN
  PROCESS(a,b)              --process statement followed by a sensitivity list
  BEGIN
    s <= a XOR b;           --statements inside a process run sequentially
    c <= a AND b;
  END PROCESS;
END ha_concurrent;
```

**2. Signal assignment statement** (inside a process) — same `<=`
syntax, but now executes sequentially, one line at a time, rather than
all at once as in a dataflow architecture.

**3. Variable assignment statement** — `:=`, only valid inside a
process/subprogram; takes effect immediately (see the Variables vs.
Signals timing example in section 4.4 above).

**4. IF statement**
```
Syntax:
IF boolean-expression1 THEN
  sequential-statements
[ELSIF boolean-expression2 THEN   -- elsif clause; 0 or more allowed
  sequential-statements]
...
[ELSE                              -- else clause
  sequential-statements]
END IF;
```
**IF statements can only be used in behavioral description!**
```vhdl
--Implement 4-to-1 multiplexer using IF-ELSE statement
ARCHITECTURE behave OF mux4to1 IS
BEGIN
  PROCESS(w, s)
  BEGIN
    IF s = "00" THEN
      f <= w(0);
    ELSIF s = "01" THEN
      f <= w(1);
    ELSIF s = "10" THEN
      f <= w(2);
    ELSE
      f <= w(3);
    END IF;
  END PROCESS;
END behave;
```

**5. CASE statement**
```
Syntax:
CASE expression IS
  WHEN choice1 => sequential-statements  -- branch #1
  WHEN choice2 => sequential-statements  -- branch #2, any number of branches
  ...
  [WHEN OTHERS => sequential-statements] -- last branch if necessary
END CASE;
```
**CASE statements can only be used in behavioral description!**
```vhdl
--Implement 4-to-1 multiplexer using CASE statement
ARCHITECTURE behave OF mux4to1 IS
BEGIN
  PROCESS(s, w)
  BEGIN
    CASE s IS                       --suppose s is of type BIT
      WHEN "00" => f <= w(0);
      WHEN "01" => f <= w(1);
      WHEN "10" => f <= w(2);
      WHEN "11" => f <= w(3);        --here the "WHEN OTHERS" branch is optional
    END CASE;
  END PROCESS;
END behave;
```

**6. LOOP statement**
```
Syntax:
[loop-label:] iteration-scheme LOOP    --types of iteration-schemes
  sequential-statements
END LOOP [loop-label];

Syntax of FOR:
[loop-label:] FOR identifier in range LOOP    --Type 1: FOR LOOP
  sequential-statements
END LOOP [loop-label];

Syntax of WHILE:
[loop-label:] WHILE boolean-expression LOOP   --Type 2: WHILE LOOP
  sequential-statements
END LOOP [loop-label];
```
```vhdl
--E.g. 1 of LOOP statement
FACTORIAL := 1;              --variable
FOR number in 2 to N loop    --"number" used without explicit declaration
  FACTORIAL := FACTORIAL * NUMBER;
end loop;                    --"number" increments implicitly

--E.g. 2 of LOOP statement
J := 0; SUM := 10;            --variables
WH_LOOP: while J < 20 loop    --this loop has a label, WH_LOOP
  SUM := SUM * 2;
  J := J + 3;
end loop WH_LOOP;
```

### 4.8.3 A Comprehensive Example: Implementation of a 7-input Majority Voting circuit

```vhdl
Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;
Entity vote7 is
  port (men: IN std_logic_vector(6 downto 0);  --let element value 1 = voting for
        Vote_result: OUT std_logic);            --let value 1 = voted through
End vote7;
Architecture vote of vote7 is
  signal pass: std_logic;
begin
  Process (men)
    variable temp: std_logic_vector(2 downto 0);  --set a counter to record votes
  begin
    temp := "000";
    For i in 0 to 6 loop           --loop variable without declaration in advance
      if (men(i) = '1') then
        temp := temp + 1;
      end if;
    end loop;
    pass <= temp(2);                -- determine whether votes reach 4
  End Process;
  Vote_result <= pass;              -- pass the result to the output interface
End vote;
```

## Notes for tutoring

Not yet started — Unit 1 (Number Systems and Codes) is still in
progress. See `handover/HANDOVER.md` for current status.

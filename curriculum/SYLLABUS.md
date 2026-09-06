# Syllabus

Derived from the 6 lecture slide decks in `curriculum/slides/` (numbered
01-06, the actual study order), cross-referenced against the textbook
*Fundamentals of Digital Logic with VHDL Design*, 3rd ed. (Brown &
Vranesic) in `curriculum/textbook/`.

Note on textbook references: the slide decks use their own course
numbering (Fundamental 1, Fundamental 2, Chapter 3, Chapter B, Chapter
5, Chapter 6), which does not match the textbook's chapter numbers.
References below point to the closest matching textbook
chapter/section for background reading and extra practice problems —
they are pointers, not a claim that the slides and textbook are
organized identically. Where a slide topic has no dedicated textbook
section (mostly general framing/intro material), that's noted.

## Unit 1 — Number Systems and Codes
`curriculum/slides/01_ch1_fd1_number_systems_and_codes.pdf`

1. Number systems: decimal, binary, octal, hexadecimal; radix/base,
   positional notation, weight — Textbook 1.6, 5.1
2. Conversions: binary <-> octal, binary <-> hex, decimal <-> binary —
   Textbook 5.1, 5.7
3. Signed numbers: sign-magnitude, 1's complement, 2's complement —
   Textbook 5.3
4. Addition/subtraction of signed numbers via complements — Textbook
   5.2, 5.3
5. Codes: BCD, Excess-3, Gray code, parity-check codes, ASCII —
   Textbook 5.7, 5.8

## Unit 2 — Boolean Algebra
`curriculum/slides/02_ch2_fd2_boolean_algebra.pdf`

1. Variables and functions (switch algebra, basic logic functions,
   composite functions) — Textbook 2.1
2. Truth tables for logic functions — Textbook 2.3
3. Basic logic gates — Textbook 2.4
4. Rules of Boolean algebra: axioms, single-variable theorems,
   2/3-variable theorems and identities, DeMorgan's theorem, duality,
   inverse functions — Textbook 2.5
5. General forms of logic functions: SOP and POS, minterms, maxterms,
   canonical SOP/POS — Textbook 2.6
6. Finding minimum-cost functions by algebraic manipulation — Textbook
   2.5-2.6
7. Karnaugh maps: adjacency, denoting a function on a K-map, key
   features, minimization strategy — Textbook 4.1, 4.2
8. Incompletely specified functions (don't-cares) — Textbook 4.4
9. Cost of a logic implementation — Textbook 4.11
10. Multiple-output functions — Textbook 4.5

## Unit 3 — Combinational Circuits
`curriculum/slides/03_ch3_combinational_circuits.pdf`

1. Features of combinational circuits — general framing, no dedicated
   textbook section
2. Issues in combinational-circuit design — same
3. Analysis of basic combinational circuits (worked examples) — same
4. Design of basic combinational circuits (examples: voting circuit,
   coded lock, water-level indicator) — same
5. Building blocks — half-adder, full-adder — Textbook 5.2
6. Multiplexers: 2-to-1, 4-to-1, larger via modular design, realizing
   logic functions with multiplexers — Textbook 6.1
7. Decoders: 2-to-4, n-to-2^n, implementing functions with decoders,
   hierarchy of decoders — Textbook 6.2
8. Code converters: BCD-to-7-segment decoder — Textbook 6.4

## Unit 4 — VHDL
`curriculum/slides/04_chapterB_vhdl.pdf`

1. What is VHDL — Textbook 2.10 (intro)
2. Design units: entity declaration (port modes IN/OUT/INOUT/BUFFER),
   architecture body (dataflow/behavioral/structural) — Appendix A
3. Identifiers — Appendix A
4. Data objects: constant, variable, and signal declarations,
   variables vs. signals — Appendix A
5. Operators (logical, relational, arithmetic, catenation) — Appendix A
6. Data types: predefined (BIT, BIT_VECTOR, INTEGER, BOOLEAN,
   CHARACTER, STD_LOGIC) and user-defined (enumeration types, array
   types) — Appendix A
7. Libraries and packages — Appendix A
8. VHDL statements: concurrent (signal assignment, when-else,
   with-select) and sequential (process, signal/variable assignment,
   if, case, loop — for/while) — Appendix A; applied examples also at
   Textbook 6.6, 7.12-7.13, 8.4
9. Comprehensive example: 7-input majority voting circuit — Appendix A
   / Textbook 6.6

## Unit 5 — Latches, Flip-Flops, Counters
`curriculum/slides/05_ch5_latches_flipflops_counters.pdf`

1. Basic latch (cross-coupled NOR gates), anomalous state — Textbook
   7.1
2. Gated SR latch (NAND-gate version) — Textbook 7.2
3. Gated D latch — Textbook 7.3
4. Master-slave and edge-triggered D flip-flop; D flip-flop with clear
   and preset — Textbook 7.4
5. T flip-flop — Textbook 7.5
6. JK flip-flop — Textbook 7.6
7. Synchronous counters: counting behavior, implementing an n-bit
   up-counter, 4-bit counter with T flip-flops, enable/clear
   capability, 4-bit counter with D flip-flops, counters with parallel
   load, modulo-N counters (cascading, e.g. modulo-24), modulo-X
   counters in Quartus II (74160/74161) — Textbook 7.9, 7.10, 7.11
8. Storage elements in VHDL: gated D latch, D flip-flop (incl.
   asynchronous clear), counter (incl. parallel load, modulo-N) —
   Textbook 7.12, 7.13

## Unit 6 — Synchronous Sequential Circuits
`curriculum/slides/06_ch6_sequential_circuits.pdf`

1. General FSM structure; Moore type vs. Mealy type — Textbook 8.1
   (intro), 8.3
2. Basic design steps, worked as a Moore-type "11" sequence detector:
   state diagram, state table, state assignment, derivation of
   next-state/output expressions, choice of flip-flops, building the
   circuit diagram, timing diagram, setting the starting state, impact
   of unused states, the state-assignment problem, summary of design
   steps — Textbook 8.1, 8.2
3. Mealy-type implementation of the same "11" sequence detector: state
   diagram, state table, state assignment, next-state/output
   expressions, circuit and timing diagram — Textbook 8.3
4. Implementation in VHDL: Moore-type code and Mealy-type code —
   Textbook 8.4
5. Second worked example (Mealy type): vending coffee machine — state
   diagram, state table, state assignment, output expressions,
   circuit, impact of the unused state "11" — Textbook 8.1, 8.3

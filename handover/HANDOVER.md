# Handover

Last updated: 2026-10-26 (Monday, exam day: the midterm is today.
Earlier: Unit 2 algebraic simplification with her teacher's "add /
split" method, canonical SOP via Σm, K-map intro, the Unit 3 coded-lock
slide. Then she chose to go through everything in order from Ch1: Ch1
and Ch2 done, Ch3 done up to the full adder; ended with a cheat sheet in
chat on exam morning).

## Progress so far

Curriculum in place: `curriculum/slides/` (6 decks, each with a `.md`
companion — read those, not the PDFs), `curriculum/textbook/`, and
`curriculum/SYLLABUS.md`. Prior tutoring transcripts in
`conversation_history/`.

**Midterm exam: Monday 2026-10-26** (she told me on Saturday
2026-10-24). Scope never confirmed: she was asked three times and did not
answer. Earlier she mentioned a test on "Chapter 2 fd2" (the Boolean
algebra deck) and said her teacher will NOT examine canonical SOP / POS.

Her decision: go through everything in order from the beginning (Ch1,
then Ch2, then Ch3), learning through worked examples and many mock sets
("пробники"), "to perfection". She also asked to cover canonical SOP /
POS in its place (2.5) even though it is not examined. Pace agreed: what
she already solved correctly gets a fast check, new material gets the
time. Plan for the end: a mixed mock over each chapter and a one-page
formula sheet.

### Unit 1 — Number Systems and Codes: done (except ASCII)

**Solid:**
- Radix/base, positional notation.
- binary <-> octal, binary <-> hex conversion (grouping method), incl.
  the direction point (group right-to-left, write left-to-right).
- Octal tables memorized by rote. Hex letters A-F were NOT solid
  (wrote A as 1001, 1101 as E, E as 15); fixed by a table plus a drill,
  and a repeat of the same 1101 case then came out right. Keep
  re-checking A-F.
- **Conversions (1.1.2), verified with mock sets this session:**
  grouping with padding in both directions, including numbers with a
  point (integer part right-to-left from the point, fraction
  left-to-right, pad zeros on the right); decimal -> binary by division
  by 2 (45, 100 correct); fractions by multiplication by 2 (0.375, 0.25
  correct; 0.8 had the right working but a mis-copied answer, and the
  non-terminating case was explained); binary -> decimal with
  fractions; hex -> decimal as digit x 16 + digit. Faster method that
  worked for her: use hex as the hub (binary <-> hex by table, hex ->
  decimal by x 16), because position labels in long expansions were
  error-prone. Octal -> decimal directly and decimal -> hex/octal were
  not drilled.
- **BCD**: what it is, digit-by-digit encoding, valid vs invalid 4-bit
  codes. Verified: (39)₁₀ → 0011 1001 correct; identified 1100/1011 as
  invalid.
- **BCD addition, single digit**: the plus-6 correction, both branches
  (result lands in 1010-1111, or carry-out of the 4-bit group).
  Verified 3/3 (3+4 no correction, 6+7 → 0001 0011, 9+9 → 0001 1000),
  including remembering the tens group.
- **Signed numbers and complement arithmetic (1.1.3-1.1.4), verified
  with handwritten sets:** writing negatives in sign-and-magnitude, 1's
  and 2's complement; reading a record back to a signed decimal (the
  first bit gives the sign; for a 1 in 1's/2's flip all bits [+1 for
  2's], read as binary, put the minus; positive records are read as
  plain binary); 2's complement addition and subtraction (A - B =
  A + (-B), drop the carry); 1's complement addition with end-around
  carry. It took several attempts; see the errors below.

- **Codes (1.2), verified 2026-10-25:** multi-digit BCD addition
  (48 + 27, and 67 + 58 with a carry into a new hundreds group; once
  forgot the +6 when the carry came out of the group, 59 + 38);
  Excess-3 both ways (once read the decoded groups as one binary number
  instead of digit by digit); Gray B -> G and G -> B with the XOR chain
  and a round-trip check; parity with the slide's XOR formulas (P for
  even/odd, check S). ASCII skipped as a pure lookup table.
- **Ch1 mixed test (2026-10-25): 11 of 13 fully correct.** Errors: Gray
  1110 -> binary gave 1010 (last bit; no round-trip check this time),
  and the odd-parity code was written without P.

### Unit 2 — Boolean Algebra: in progress

**2.1 Variables and functions** — she stated she understands it
(AND/OR/NOT, the 1+1=1 point). Taken on her word, not drilled.

**2.4 Rules — mastered, all verified by practice:**
- Single-variable theorems — initially confused `x + x = x` with
  `x + x̄ = 1`, and answered `C·C̄ = C̄`. Fixed by splitting into three
  groups (with constant / with itself / with its complement). Re-verified
  5/5.
- **Absorption** (`x + xy = x`, `x(x+y) = x`) — 3/3 incl. recognising
  when it does NOT apply (`M + N`).
- **Bar-forms** (`x + x̄y = x + y`, `x(x̄+y) = xy`) — full 4-shape
  discrimination matrix 4/4.
- **DeMorgan** — 3/3 incl. `(C̄D)‾ = C + D̄`.
- **Combining** (`xy + xȳ = x`) — 3/3 incl. spotting when the common
  factor is the *second* variable.
- **Duality & Inverse** — 3/3 after fixing a clean label swap (she
  executed both transformations perfectly but had the names attached to
  the wrong procedures).

**2.4 Consensus — NOT solid.** First explanation failed ("не поняла").
Re-taught concretely (when the third term would fire, one of the first
two already gives 1). She then gave the right verdict but the **wrong
reason** ("потому что даёт ноль"). Needs redoing.

**Algebraic simplification with her teacher's method — working, with
guidance.** The method: (a) write a term twice (`x = x + x`) so it can
join two different pairs; (b) split a term by multiplying by `(x + x̄)`
to manufacture a pair; (c) then combine pairs (`xy + xȳ = x`), absorb,
or use the bar-form. I once showed Shannon expansion; she asked why not
her teacher's way, so I named it, said it is not in the slides, and
dropped it. Stay with her teacher's method.
- Teacher's list of 5 exercises, worked together (reference answers):
  1) F = A + CD; 2) F = A + C + BD + B̄EF; 3) F = B + AC + D; 4) F = 1;
  5) F = ĀC + AC̄ + AB (also valid: ĀC + AC̄ + BC).
- Exercise 5 was given as Σm(1,3,4,6,7). She wrote the five minterms
  and paired them herself. Her written answer, ĀC + AB̄C̄ + AB, is
  correct but one step short of minimal (AB̄C̄ pairs with ABC̄ to give
  AC̄). The sticking point was "a minterm already used in a pair is
  gone" — it is not; `x = x + x` lets it be used again.
- Practice set 1 (A + C; B + A; (AB)‾ + AB = 1; Σm(1,2,5,6) =
  B̄C + BC̄) and set 2 items 1-3 were done by hand, with corrections
  (see recurring errors below). **Set 2 items 4 and 5 were never
  answered** (reference: Σm(2,3,6,7) = B; Σm(0,1,3,7) = ĀB̄ + BC).

**2.5 Canonical SOP (Σm) — usable, low exam priority.** The earlier
direct explanations (long, then compact) failed; what worked was meeting
it inside the exercises: Σm number → binary → letters (1 = plain letter,
0 = barred letter), done correctly for Σm(1,3,4,6,7) and Σm(1,2,5,6).
Building a canonical SOP from a truth table (check: F = 1 at rows 00
and 10) was posed but never answered. Her teacher said it is not
examined.

**2.7 K-map — started only.** 2-variable: a K-map is a redrawn truth
table, adjacent cells differ in one variable, merging adjacent 1s is
combining done visually. Check question F(A,B) = Σm(0,1) was never
answered. She then sent the 3-variable K-maps from the Unit 3 coded-lock
slide; the 3-variable method itself has not been taught.

**Ch2 second pass, 2026-10-25, in order:**
- 2.4 rules: first attempt she peeked and mixed up absorption and
  bar-form (R + RS = RS, X(X + Y) = XY); fixed with a one-page rule
  table, a side-by-side absorption/bar-form table and factoring
  (R + RS = R(1 + S) = R). Learned that a substitution check must use a
  set containing a 0 (all-ones sets passed wrong answers). Re-verified on
  new items without peeking. Teacher's emphasis: combining is the most
  important rule; b-versions are the duals of a-versions.
- 2.5 canonical SOP/POS (Σm/ΠM): correct; she mixes up the labels f and
  f̄ when she reads the zeros.
- 2.6 simplification: DeMorgan + bar-form (PQ + P̄R + Q̄R = PQ + R) and
  consensus via the teacher's (x + x̄) split, done independently on new
  items after one worked pair. She asked why only BC is multiplied out;
  explained that expanding everything gives canonical SOP (same answer,
  longer), which led straight into K-maps.
- 2.7 K-maps, SOP, 3 and 4 variables, incl. wrap-around and corners:
  verified. Early habit of making groups smaller than possible (would
  not reuse covered cells); fixed with the search order 8 -> 4 -> 2 -> 1.
  POS via K-map: once grouped the Σm cells instead of the zeros;
  understood, further practice skipped for time.
- 2.8 don't-cares: she skipped it ("same thing"), not verified.
- 2.9 cost (gates + inputs): explained via the slide 19 circuit after she
  asked for English terms (gate, input, output); 1 of 2 right first time.
- 2.10 multiple-output: her teacher said it is not needed.

### Unit 3 — Combinational Circuits: just started

She is following her live lecture, which is now at the coded-lock
example (`03_ch3_combinational_circuits.md`, E.g. 2) and sent that slide.
Her question: "how do I make this circuit myself?" Nothing is verified
yet.

Facts for teaching it:
- Inputs A, B, C (1 = pressed). Unlocked U = 1 at rows 101, 110, 111;
  Alarm = 1 at rows 001, 010, 011; rows 000 and 100 give nothing.
- U = Σm(5,6,7) = AB + AC = A(B + C). Alarm = Σm(1,2,3) = ĀB + ĀC =
  Ā(B + C).
- Slide map (PDF): 17 = truth table, 18 = Step 2 (two 3-variable
  K-maps: U = AB + AC, Alarm = ĀB + ĀC), 19 = Step 3 (the circuit).
- The slide's circuit: one OR2 on (B, C), shared; one AND2 of (A, OR
  output) driving U; one AND2 of (NOT A, OR output) driving Alarm. NOT A
  is drawn as a separate input terminal, not as a NOT gate. Slides 18-19
  name the Alarm output "A" (e.g. "A = Σm(1,2,3)"): the left-hand A is
  Alarm, not the input A. On slide 17 the Alarm cell of row 000 has a
  red 0 over an older digit; Σm(1,2,3) confirms it is 0.
- Likely snag: the written answer is AB + AC (two ANDs into an OR) but
  the drawn circuit is OR first, then AND. No slide writes the step
  AB + AC = A(B + C); it is skipped. That factoring lets one OR2 serve
  both outputs (3 gates drawn, 4 with a NOT gate for Ā; the two-level
  version needs 6, or 7 with the NOT).

Teaching so far: sent the gates table (AND2 / OR2 / NOT, one operation =
one gate) with three questions (OR2 and AND2 on inputs 1,0; NOT on 0;
gates for A(B + C)) — never answered, because she asked to be walked
through slides 17-19 instead. Order now: 17 -> 18 (table -> Σm ->
simplify with her pairing method; she repeats it for Alarm), then 19
(formula -> gates, the skipped factoring, the shared OR2), trace one row
through the circuit, then a small design she does alone.

**Units 4-6: not started.**

## Learner profile

- **Language**: Russian, casual/informal. Technical terms stay in
  English with a short Russian gloss on first appearance. Her answers
  are clipped, transliterated shorthand ("не а плюс б", "ху", "де") and
  photos of handwritten work — read both loosely. The handwritten photos
  are the best view of her real working; ask for them on anything
  multi-step.
- **Message length is the single biggest failure mode.** Every hard
  shutdown ("нихуя не понятно", "да похуй") followed a block that did
  more than one step: canonical SOP, K-map, consensus, the first walk-
  through of exercise 1. Short blocks — one idea, a worked line or two,
  then 2-4 questions — work reliably. When she stalls, the fix is almost
  always *shorter*, not *more*. One rule per step.
- **Mechanics are reliable; picking the right rule is not.** Substituting
  values, opening brackets and spotting a combining pair are solid. What
  breaks is the choice of rule and the labels attached to it.
- **She follows her teacher's method.** She asked outright why a
  different method was shown. Use the method and notation from her
  lecture; mention alternatives only in passing.
- **Derive, don't decree.** Rules presented as consequences of things
  she already verified (e.g. combining derived from `y+ȳ=1` and `x·1=x`)
  land immediately. Rules presented as a list to memorize don't.
- **Substitution is her best self-check.** Plugging x=0 and x=1 to test
  a theorem clicked hard and she can run it independently. It also
  disproves wrong answers convincingly.
- **"Open the bracket" beats formula recall.** For any `x(...)`
  expression she does better distributing than pattern-matching a
  formula. Give her procedures over lookups where possible.
- **She jumps to whatever the live lecture is showing.** She has sent
  slide photos from Unit 1 (BCD, Gray code), Unit 2 (canonical SOP,
  exercises) and now Unit 3 (coded lock) and wants each explained *now*.
  Follow her lead; the planned order is secondary.
- **Under time pressure she abandons rather than pushes through.** When
  a test is close and something isn't landing, a compact written
  reference is worth more than continued drilling.
- **Table memorization over shortcuts**: the 8-4-2-1 bit-weight
  shortcut was tried long ago, confused her badly, and is **abandoned —
  do not reintroduce it in any form.**
- **Direction confusion** (group right-to-left, write left-to-right)
  recurs; restate it explicitly in every new context.
- **Notation**: always use proper subscripts — (101)₂, (7)₈, (2F)₁₆.
- **No emojis.**
- **Numbered lists, not bullets.** She asked that points, especially the
  list of her mistakes, be numbered 1, 2, 3 rather than bulleted.
- **Write the answer's base first.** Twice she converted to the wrong
  base (asked hex, gave decimal; asked decimal, gave binary) while the
  conversions themselves were correct. Her base subscripts were also
  unclear in handwriting (octal looked like ₆, hex like ₁₀) and missing
  on some answers; after a reminder she wrote them clearly.
- **Concrete drill sets suit her.** Short worked example, then 4-8
  items, photo of handwritten work, results explained as a numbered
  list. She asks for more mock sets when she wants to be sure.
- **A representation is not an operation.** With signed numbers she
  first treated "1's/2's complement" as an operation to apply to any bit
  string and answered "read this record" tasks by re-encoding it. What
  fixed it: each representation has a "change sign" action; writing -N =
  change the sign of +N; reading = change the sign again; then a
  one-step worked example.
- **Dense feedback shuts her down.** After a four-point correction she
  wrote "Не понимаю твои объяснения". One idea per message, a small
  table, and a tiny drill that isolates the failing sub-skill worked.
- **She sometimes invents a valid variant.** For reading 2's records she
  kept the sign bit, flipped the rest, added 1 and read sign-and-
  magnitude; it fails only on 1000 (-8). Agreed rule: negative records
  only, flip all bits.
- **Typed answers hide the method.** When she types only final answers
  (doable in decimal in her head), ask for photos of the binary steps.
- **Practice should look like the slides.** She asked for problems of
  the same type as in the presentation (own numbers are fine) and for
  the slide's own method, e.g. parity by the XOR formula rather than by
  counting ones. When she says the presentation does it differently,
  switch to the slide's method and wording.

**Recurring errors to target:**
- Swapping `x + x = x` with `x + x̄ = 1`.
- Applying `x + x̄ = 1` to a pair of *different products*:
  `B̄C + BC̄ = 1` and `ĀB̄ + AB = 1` are both wrong; nothing cancels.
- Losing a bar when merging a pair (writing B where B̄ belongs).
- Reaching for the bar-form on `B̄ + AB̄C`; it is absorption (answer B̄).
- Deleting one letter instead of the whole term (`B + BCD → B + CD` is
  wrong; absorption gives `B`).
- Believing a term used once is gone, instead of reusing it via
  `x = x + x`.
- Consensus: right verdict, wrong reason.
- Mixing the names "duality" and "inverse" while executing both
  correctly.
- Answering the wrong conversion target (see above).
- Position labels in long binary expansions: off by one at the top bit
  or a skipped label (gave 114 instead of 178, 373 instead of 187). Use
  the hex hub instead of labelling bits.
- Slips when copying or adding the final answer despite correct working
  (0.1100 written as 0.1001; 15×16 + 7 written as 240; 32+16+8+4+2 for a
  bit that was 0).
- Signed numbers: writing negatives in sign-and-magnitude when 2's
  complement was asked; writing 0 for 1 + 1 + 1 in a binary column
  (should be 1, carry 1; fixed); forgetting the minus when the result's
  first bit is 1; applying flip + 1 to a positive result; treating the
  dropped carry as a sign bit.

## Next steps

The agreed order is Ch1 -> Ch2 -> Ch3, example-driven, with a final
mixed mock and a one-page formula sheet before Monday.

1. **Ch1 is done.** If there is a spare minute before the exam: one
   more Gray -> binary with the round-trip check, and an odd-parity code.
2. **Ch2 is done** (2.10 not needed per her teacher; 2.8 skipped by her).
3. **Ch3, done 2026-10-25/26:** gates incl. NAND/NOR/XOR; 3.3 analysis
   (4-NAND XOR; needed help with the final DeMorgan step); 3.4 design
   end to end (once read ≥ as ≤ and drew OR-then-AND for a sum, then a
   fully correct design with circuit and cost); she drew the coded-lock
   circuit herself and understood the factored form via cost; 3.5.1 half
   adder correct, full adder truth table and carry correct (one misplaced
   cell in the s map). Ripple-carry check questions were not answered.
   Not done: multiplexers, decoders, code converters (she did not know
   whether they are examined).
4. **After the exam:** ask how it went and what was on it, then re-plan
   from her answer.
Per CLAUDE.md: nothing above is "done" unless it says verified with her
own correct answers. Consensus, canonical SOP from a truth table, K-map
and the circuit-building topic are explicitly not done.

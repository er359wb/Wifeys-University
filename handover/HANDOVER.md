# Handover

Last updated: 2026-09-21 (session: Unit 1 BCD/Gray partial, Unit 2
Boolean algebra rules largely mastered; session ended when she ran out
of time/energy before a test).

## Progress so far

Curriculum in place: `curriculum/slides/` (6 decks, each with a `.md`
companion — read those, not the PDFs), `curriculum/textbook/`, and
`curriculum/SYLLABUS.md`. Prior tutoring transcripts in
`conversation_history/`.

### Unit 1 — Number Systems and Codes: in progress

**Solid:**
- Radix/base, positional notation.
- binary <-> octal, binary <-> hex conversion (grouping method), incl.
  the direction point (group right-to-left, write left-to-right).
- Octal/hex tables memorized by rote.
- **BCD**: what it is, digit-by-digit encoding, valid vs invalid 4-bit
  codes. Verified: (39)₁₀ → 0011 1001 correct; identified 1100/1011 as
  invalid.
- **BCD addition, single digit**: the plus-6 correction, both branches
  (result lands in 1010-1111, or carry-out of the 4-bit group).
  Verified 3/3 (3+4 no correction, 6+7 → 0001 0011, 9+9 → 0001 1000),
  including remembering the tens group.

**Taught but NOT verified:**
- **Multi-digit BCD addition** (carry propagates into the next BCD
  group, each group checked separately). Worked example 27+35 shown;
  her exercise **48 + 27 was never answered** — open.
- **Gray code**: why it exists (avoids instantaneous errors — only 1
  bit changes between adjacent values), the "differs in 1 bit" property
  shown column-by-column, MSB/LSB explained (she did not know these
  terms — that was a real gap, now covered). **XOR introduced** (rule:
  1 if bits differ, 0 if same) but her answers were never given.
- **B → G conversion formula (G_n = B_n; G_i = B_{i+1} ⊕ B_i)** — not
  reached. This is where Gray code stopped.

**Not started in Unit 1:** signed numbers (sign-magnitude, 1's/2's
complement), addition/subtraction via complements, Excess-3, parity,
ASCII.

### Unit 2 — Boolean Algebra: in progress

**2.1 Variables and functions** — she stated she understands it
(AND/OR/NOT, the 1+1=1 point). Taken on her word, not drilled.

**2.4 Rules — largely mastered, all verified by practice:**
- Single-variable theorems — 
  initially confused `x + x = x` with `x + x̄ = 1`, and answered
  `C·C̄ = C̄`. Fixed by splitting into three groups (with constant / with
  itself / with its complement). Re-verified 5/5.
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

**2.5 Canonical SOP — FAILED, needs a fresh approach.** Her lecture hit
it mid-session. Minterm definition + the (x+x̄) expansion trick were
explained twice (once long, once as a compact 3-step recipe); her
response was "нихуя не понятно". Do not simply re-present the same
explanation. She never got to Σm notation.

**2.7 K-map — barely started.** Got as far as: it's a redrawn truth
table, 2-variable layout, adjacent cells differ by one variable, and
merging two adjacent 1s = applying combining visually. She disengaged
before answering anything. Nothing verified.

**Not started in Unit 2:** 2.2 truth tables, 2.3 gates, 2.6 algebraic
simplification, 2.8 don't-cares, 2.9 cost, 2.10 multiple-output.

**Units 3-6: not started.**

## Learner profile

- **Language**: Russian, casual/informal. Technical terms stay in
  English with a short Russian gloss on first appearance. She answers in
  clipped transliterated shorthand ("не а плюс б", "ху", "де") — read it
  loosely, it's fine.
- **Message length is the single biggest failure mode.** Long, dense
  blocks cause a hard shutdown ("нихуя не понятно", "да похуй"). Short
  blocks — one idea, a worked line or two, then 2-4 questions — work
  reliably. When she stalls, the fix is almost always *shorter*, not
  *more*.
- **Mechanics are reliable; labels and form-selection are not.** This
  was the pattern all session: she swapped duality/inverse names while
  executing both perfectly; she swapped the OR-form and AND-form
  answers of the same theorem pair. Her algebra is sound — what breaks
  is picking *which* rule applies. Teach the discrimination explicitly
  (side-by-side tables of near-identical cases work very well).
- **Derive, don't decree.** Rules presented as consequences of things
  she already verified (e.g. combining derived from `y+ȳ=1` and `x·1=x`)
  land immediately. Rules presented as a list to memorize don't.
- **Substitution is her best self-check.** Plugging x=0 and x=1 to test
  a theorem clicked hard and she can run it independently. Lean on it —
  it also disproves wrong answers convincingly.
- **"Open the bracket" beats formula recall.** For any `x(...)`
  expression she does better distributing than pattern-matching a
  formula. Give her procedures over lookups where possible.
- **She jumps to whatever the live lecture is showing.** Mid-session she
  sent slide photos (BCD addition, Gray code, canonical SOP) and wanted
  those *now*. Follow her lead; the planned order is secondary.
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

## Next steps

1. **Unit 2 first** — that's where her course and tests are. Open items
   in priority order:
   - **Canonical SOP (2.5)** — needs a genuinely different approach, not
     a re-explanation. Consider building it from a truth table she fills
     in herself rather than from expanding an algebraic expression.
   - **K-map (2.7)** — highest test value, barely begun. The hook that
     worked: a K-map is just combining done visually. Continue from the
     2-variable map.
   - **Consensus (2.4)** — verdict right, reasoning wrong; redo.
   - Then 2.2/2.3 (quick), 2.6, 2.8, 2.9, 2.10.
2. **Unit 1 leftovers** when there's slack: the 48+27 multi-digit BCD
   exercise, XOR check, Gray code B→G formula, then signed numbers and
   the remaining codes.
3. Ask early what a test actually covers — she was asked twice this
   session and never answered, which made prioritising guesswork.

Per CLAUDE.md: nothing above is "done" unless it says verified with her
own correct answers. Consensus, canonical SOP and K-map are explicitly
not done.

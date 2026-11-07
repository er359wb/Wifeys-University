# Handover

Last updated: 2026-11-06 (21.1–21.3 completed; starting 21.4).

Push every update to BOTH `physics-tutoring` (the branch other sessions
read) and the session's working branch.

## EXAM: about 2026-11-13

On 2026-11-07 she said her exam is in 6 days. Scope and format not yet
confirmed (assumed Ch 21–24, mixed multiple-choice/true-false and
calculations like her worksheets). Plan agreed for speed: bigger steps,
fewer check rounds, exam-style checks, focus on formulas and common traps.
- 11-07: finish Ch 21 (21.4 rest, 21.5 field superposition, 21.6 field
  lines, 21.7 dipoles)
- 11-08: Ch 22 Gauss's law
- 11-09: Ch 23 potential (her Ch 23 worksheet as practice)
- 11-10: Ch 24 capacitance (her Ch 24 test as practice)
- 11-11: mixed exam-style practice across 21–24
- 11-12: weak spots + short review; 11-13 exam

## Progress so far

### Topics taught (curriculum order)

- **21.1 Electric Charge — DONE (2026-11-04), verified.** Covered: two
  kinds of charge, like repel / unlike attract (and "like" = same sign, not
  same size); atoms, protons/neutrons/electrons, ions, net charge; only
  electrons move between bodies; conservation of charge (rubbing gives
  ±Q); quantization, e = 1.602×10⁻¹⁹ C, n = |Q|/e; SI prefixes (m, μ, n,
  p) and dividing powers of ten. Evidence: she solved sign chains, ion
  counts, rubbing problems and the full "identical spheres touch" algorithm
  (sum → ÷2 → change = after − before → sign of change → n = |change|/e)
  correctly on her own on the last problem.
- **21.2 Conductors, Insulators, Induced Charges — DONE (2026-11-04),
  verified.** Covered: conductors/insulators/semiconductors, which
  particles move (electrons in metals; both ions in solutions); charging by
  contact (same sign); grounding (grounded body with nothing nearby → 0;
  electrons move, never protons); induction with ground, incl. order of
  steps (remove wire before rod); polarization of insulators (either sign
  attracts a neutral body; attraction doesn't prove charge, repulsion
  does). The independent exercise first exposed a gap: she treated two
  TOUCHING metal spheres as separately polarized and used the ÷2 sharing
  rule while a rod was nearby. Fixed with "two touching metals = one
  conductor" plus a mapping table to the grounding case (far sphere ↔
  earth, contact point ↔ wire, separating ↔ removing wire). Then she passed
  an unscaffolded check fully.
- **21.3 Coulomb's Law — DONE (2026-11-06), verified.** Covered:
  F = k|q₁q₂|/r², direction from signs, Newton's 3rd law (equal force on
  both, even for unequal charges); proportional reasoning ("set everything
  to 1, write (q-factors)/(r-factor)²"); SI conversion (nC, μC, cm, mm);
  superposition on a line (signed sum, distance = |x_other − x_ours|); in a
  plane via components (Δ = other − ours for attraction, ours − other for
  repulsion; Fx = F·Δx/r, Fy = F·Δy/r; F = √(Fx² + Fy²)). Independent
  exercise: plane superposition fully correct. Slips there: dropped the
  distance factor in a proportion question (2nd time), and the calculator
  −0.173² trap. She passed the proportion re-check once she wrote the
  fraction line.
- **21.4 Electric Field and Electric Forces — in progress.**

### Curriculum and homework received

- Lecture slides for Ch 21–24 of a university electromagnetism course
  (*University Physics*, Young & Freedman), stored in `curriculum/` with
  `.md` companions — see `navigation/NAVIGATION.md`.
  - Ch 21 Electric Charge and Electric Field (slides dated 2026/9/3)
  - Ch 22 Gauss's Law (dated 2026/10/10)
  - Ch 23 Electric Potential (dated 2026/10/10)
  - Ch 24 Capacitance and Dielectrics (dated 2026/10/30, 24.1–24.4 only)
- Assigned homework in the slides: 21.33, 21.44, 23.20 ("Hand in your
  homework every Tuesday!"); the Ch 24 deck ends with problems 24.59 and
  24.71. Problem text is at the bottom of each chapter's `.md`. Teach the
  concepts these need; don't solve the homework for her unless she asks.
- 2026-10-23: Ch 23 homework worksheet (photos, not committed): 8
  multiple-choice + 5 true/false on potential. After one guided step she
  asked for the answers; all 13 were given with reasoning. Understanding NOT
  verified — Ch 23 topics are still open.
- 2026-10-30: `curriculum/Chapter_24.pdf`, a blank Ch 24 test paper (18
  multiple-choice). She asked for the answers; all 18 given with one-line
  working. Understanding of Ch 24 NOT verified.
- 2026-11-03: she also sent Pearson's "ConcepTest" clicker questions for
  Ch 21 (Giancoli PSE4). NOT in the repo: its copyright notice forbids
  posting it on the web and the repo is public. I asked her whether to make
  the repo private or keep only a short own-words summary; no answer yet.
- The `.md` companions flag slide typos (`[slide typo: ...]`), each checked
  by recalculation. Watch for them if she's confused by a number on a slide.

## Learner profile

- **Language:** writes in Russian (sometimes answers in short English).
  Explain in Russian, but write units and abbreviations in English (C, nC,
  μC, N, m) — she asked for this, to match her course. She also asked
  (2026-11-07) for key terms and the check/practice problems themselves in
  English (source charge, test charge, field point, toward/away from, …),
  so she can read her English problem sheets. Write practice problems in
  English and give an English–Russian glossary for each new topic's terms.
- **Pace and style:** answers fast and tersely, often as a numbered list.
  Good at chained sign logic (A repels B, B attracts C(+) → A negative) and
  picks up a procedure quickly once shown.
- **What works:** "было → стало" (before → after) tables; a numbered
  step-by-step algorithm for a problem type; mapping a new situation onto
  one she already solved, with a side-by-side table; pinpointing exactly which
  number her wrong answer came from (e.g. "1.25×10¹⁰ is 2 nC / e, you used
  the starting charge, not the change") — she corrects right away after
  that.
- **Typical slips (watch for these):**
  - signed arithmetic, especially subtracting a negative: (+3) − (−1);
  - skipping a step in a procedure (forgot to divide the total by 2);
  - reusing a number from the previous problem instead of recomputing;
  - leaving out the sign or the final conclusion ("по 4" instead of
    "+4 nC"; computing 1.50 but not saying "so impossible");
  - a misconception can come back in a new context: she knew "protons
    don't move" in the abstract but then wrote "silk has fewer protons".
    Recheck key misconceptions in applied problems;
  - over-applies a recently learned rule outside its conditions (÷2 sharing
    used with a rod nearby; "polarization" used for metals). When teaching a
    rule, state when it does NOT apply;
  - sometimes skips a sub-question (missed 21.2 d) or gives only part of the
    answer (principle without value/direction; no units) — check every part
    was answered;
  - in "several things change" proportion questions she drops one factor
    (usually the distance) unless she writes the fraction line
    (q-factors)/(r-factor)² — insist on writing it;
  - calculator: typed −0.173² (calculator does −(0.173²)); square of a
    negative needs brackets, or drop the sign;
  - sometimes reads extra conditions into a question (thought r also
    changed) — remind her to reread what changes and what stays;
  - wrote "+" instead of "×" between charges (result was right).
- **Works well:** drawing a quick sketch of the charge positions herself,
  and filling a table (pair | attract/repel | Δ | r | F | Fx | Fy).
- **Prerequisites:** she needed SI prefixes (nano, micro) and the rule for
  dividing powers of ten explained; she now handles them fine.
- **Before any teaching** she answered "a free negative charge moves away
  from infinity" (Ch 23 worksheet) — watch sign reasoning with negative
  charges when Ch 23 comes.
- **Homework/tests:** for graded sheets she asks for the answers outright
  ("Ответы дай", "Просто дай ответы") and prefers a bare answer list. Give
  the list first, short working underneath. In topic lessons she does
  engage and attempts the checks.

## Current level / notes

21.1–21.3 solid. The course assumes vectors (components, unit vectors, dot/cross
product), Newton's laws, constant-acceleration kinematics, energy
conservation, and basic calculus (integration over a charge distribution,
partial derivatives in 23.5). Check these prerequisites as they come up —
the prefix/powers-of-ten gap suggests math basics may need short refreshers.

## Next steps

1. Continue 21.4 Electric field: E = F/q₀ → field of a point charge →
   vector form → charge in a uniform field (a = qE/m + kinematics; needed
   for homework 21.33) → independent exercise. Then 21.5 onward in
   curriculum order.
2. Her class is ahead (Ch 23–24 already). Ch 23 worksheet reasoning and the
   Ch 24 test answers are not verified — revisit when the course order
   reaches them, or earlier if she asks.

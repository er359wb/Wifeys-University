# Handover

Last updated: 2026-10-19.

## Progress so far

- **6.1 Area between Curves: COMPLETE** (the prerequisite diagnostic is
  closed too). Exercises 1(a)-(d) solved, then redone a second time with
  Wifey doing the arithmetic while I pointed at specific wrong steps: (b)
  had two errors (antiderivative of `3x` written as `x³`; `24+16` as `43`);
  (d) had several (axis order on her sketch; `cos(π/4)` vs `cos(π/6)` values
  swapped; missing the `1/2` on the `cos 2x` antiderivative; `cos(π/3)` vs
  `cos(π/6)` swapped; the `cos π = -1` sign). She fixed all of them herself.
  Then Exercises 2(a), 2(b) and 3(a) were each solved **fully independently
  and correctly, first try**. That repeated, unprompted evidence is why the
  topic is closed. Exercises 3(b)-(d) are optional extra practice.
- **6.2 Volumes.** Example 1 (sphere), Example 3 (`y=x³` about the y-axis),
  Example 6 (equilateral-triangle cross-sections) covered with diagrams.
  Exercises 1(a)/(b) done. Exercises 1(c) (about `y=-1`) and 1(d) (about
  `x=3`) were guided, not independent: in 1(c) she wrote the radius as `x²-1`
  instead of `x²+1` (distance to a line below the axis is `y+1`) and left out
  the inner radius of the washer; in 1(d) her split into two y-zones was
  right but zone 2's outer radius was wrong (should be `3-√y`). Final answers
  were given when she asked for them. **Exercises 2(a) and 2(b)** (`y=2x`,
  `y=0`, `x=1` about the x-axis and about `x=1`) were solved by her fully
  correctly (`4π/3` and `2π/3`; for (b) I set up the radius `1-y/2` and the
  bounds, she did the rest). **Exercises 3 (pyramid, A(x)=(Lx/h)²) is still
  open.**
- **6.3 Arc Length.** Exercises 1(a) and 1(b) solved in full (with a long
  deep-dive into what `du`/`dx` mean, why substitution bounds change, and a
  6-step u-substitution recipe). **1(c) and 1(d) still open.** The slide for
  1(d) has a typo in point P; `P=(-1, 1/2)` is recorded by symmetry in
  `curriculum/6_3_Arc_Length.md`.
- **6.4**: not touched yet.
- **8.2 Vectors (new deck, Chapter 8 of her course; `curriculum/8.2_Vectors.md`,
  original PDF deliberately not committed for privacy).** Taught in small
  steps:
  - Step 1, what a vector is (slides 2-5): done. Scalar vs vector: she first
    called temperature a vector, corrected it after a nudge, and asked a good
    question (a thermometer goes "up/down", isn't that direction?). That was
    answered as "up/down = bigger/smaller, the sign of a number, not a
    direction in space". Equal vectors: picked the right ones from a picture
    with the right reason (same length and same direction).
  - Step 2, combining vectors: done. Triangle Law, Parallelogram Law, sums
    and scalar multiples in component notation (`⟨2,3⟩+⟨4,1⟩=⟨6,4⟩`,
    `2⟨3,-1⟩=⟨6,-2⟩`, `-⟨3,-1⟩=⟨-3,1⟩`), subtraction
    (`⟨1,4⟩-⟨3,-2⟩=⟨-2,6⟩`, with the `4-(-2)=6` step right). Slide 25
    exercises: (a) AC, (b) CB, (d) DB right; (c) first answered DB (ignored
    the minus), then DA right after I pointed at `-AB=BA`. She first drew the
    sum instead of writing the two-letter answer; one format example fixed it.
  - Step 3, components (slides 12-16): taught `AB = ⟨x2-x1, y2-y1, z2-z1⟩`
    ("end minus start"). **Pending question: `A(1,-2,3)`, `B(4,0,-1)`**
    (she skipped it and went on to slide 26).
  - Step 4 partly: the length formula was taught when she reached slide
    26(a)(1) on her own. **(1) done fully independently and correctly**
    (`a+b=⟨-1,1,2⟩`, `2a+3b=⟨-4,1,9⟩`, `|a|=√14`, `|a-b|=√82`; she needed
    `|a-b|` split into "find a-b, then its length"). **Pending: slide
    26(a)(2)** (needs `i,j,k` converted to components; I taught that,
    including "a missing term means 0"). Unit vectors (`a/|a|`, slide 22) are
    NOT taught yet.
  - The 8.1 (3-D coordinates, spheres) and 8.3 (dot product) `.md`
    companions were added on 2026-10-19 but those decks are not taught yet.
- **Supplementary (from her own course, not in our decks):**
  - 2nd-order linear homogeneous ODEs with constant coefficients (her slide
    from the course): what "order" and "linear" mean; why we guess `y=e^{rx}`
    and get the characteristic equation; the three discriminant cases; the
    `D/4=(b/2)²-ac` shortcut for even `b`; why complex roots give cos/sin
    (Euler's formula plus superposition); why there are two constants. She
    solved her three problems correctly: `y''+4y'-5y=0` →
    `C₁e^{-5x}+C₂e^{x}`; `y''+9y=0` → `C₁cos3x+C₂sin3x` (first wrote `r=±3`,
    then self-corrected to `0±3i`); `4y''-4y'+y=0` → `C₁xe^{x/2}+C₂e^{x/2}`
    (remembered the `x` factor).
  - Earlier: the general u-substitution method; why `sin(2x) ≠ (sin x)/2`;
    the power-reduction identity `sin²x=(1-cos2x)/2` (not in our decks); a
    volume problem from her course's video lectures (washer about `y=-2`);
    finding a parabola's vertex two ways; three ways to solve a quadratic.

## Learner profile

- **Speed matters to her more than extras.** On 2026-10-15 she asked to
  speed things up: generated diagrams take too long, and she has the slides
  open herself. Default now: **no generated diagrams**; point at the slide
  number for the picture, and draw only when the needed picture is not on
  any slide. (In 6.1/6.2, diagrams of regions and solids did help her get
  unstuck, so keep that option for genuinely spatial problems.)
- **One small idea per message, then one quick question.** She gets
  frustrated with long, all-at-once explanations ("не надо все сразу
  объяснять") and brushes off side questions ("это не важно"); don't push
  tangents she has dismissed.
- **Use her course's notation and methods**, not invented devices: counting
  grid squares annoyed her ("мы тут таким не занимаемся"); component
  notation `⟨a,b⟩` worked straight away.
- **When she sends her own solution, check her steps explicitly**, line by
  line against what she wrote. She got angry when a check looked like a
  generic re-solve instead of a check of her work.
- **Negative signs are her most persistent weak spot**: `cos π = -1` (wrong
  at least 3 times), the radius to `y=-1` written as `x²-1` instead of
  `x²+1`, and `r²=-9` first solved as `r=±3`. Also swaps `cos(π/6)=√3/2` and
  `cos(π/3)=1/2`. Once the specific spot is pointed out she fixes it herself:
  the reasoning is fine, the recall and sign handling are shaky. Check signs
  proactively whenever a negative number or a line below an axis appears.
- **Washer setups**: she can forget the inner radius when the region doesn't
  touch the axis of rotation; ask "is there a hole?" before she integrates.
- **Differential/substitution notation** (`du`, `dx`, why bounds change)
  needed a from-scratch explanation; now reasonably covered, but foundational.
  Also once mixed up the unit circle's `(cos θ, sin θ)` with a graph's axes,
  and `sin(2x)` with `(sin x)/2`; both addressed, not retested.
- **Communicates in short, often garbled (voice-to-text) Russian messages**,
  and swears when frustrated; that signals pace or format problems, not that
  she's giving up. Terse questions like "куда делась 2" point at one specific
  step. When genuinely ambiguous, asking her directly works. "Какой ответ"
  is an explicit request for the solution.
- **Jumps between topics and decks** and sometimes leaves an exercise
  half-done; circle back to open items rather than assuming she's finished
  with them. She brings in material from her actual course (lecture videos,
  slides); treat it as legitimate supplementary material and say plainly
  when it isn't in our decks.
- **Responds well to a worked checklist** (the u-substitution table, the
  area checklist) that she then applies herself while I check; this produced
  her best independent work.

## Current level / notes

6.1 is solid. 6.2 is mostly fine; the weak spots are setups where the axis of
rotation isn't a coordinate axis (sign of the distance, the inner radius).
ODE basics (characteristic equation, three cases) went well: all three
problems right. Vectors: Steps 1-2 done; component arithmetic (including
subtraction with a double negative) and the length formula went well.

## Next steps

1. 8.2 Vectors: slide 26(a)(2) is waiting (`i,j,k` form). Then 26(b) and
   unit vectors (`a/|a|`, slide 22, not yet taught), the pending `AB`
   from two points question, Examples 5-7 (slides 21, 24), and the 3-D side
   of slides 12-14 if she wants it.
2. **Reminder she asked for on 2026-10-19: ask her to send the Chapter 7
   decks (7.1 to 7.5).** They are not in the repo (only 6.x and 8.x are). A
   `send_later` reminder was scheduled to fire in this session at
   2026-10-20 11:12 UTC. If that time has passed, or this is a new session,
   remind her anyway at the start. When the files arrive: make `.md`
   companions in `curriculum/`, keep the PDFs out of the repo (the slides
   carry the university logo and the title slides name the lecturer; see
   CLAUDE.md's privacy rule), and note them in `navigation/NAVIGATION.md`.
3. 8.1 (3-D coordinates, spheres) and 8.3 (dot product) are saved as `.md`
   but untaught; her course order is 8.1, 8.2, 8.3, so she may want them
   next.
4. Open Chapter 6 items to circle back to: 6.2 Exercises 3 (pyramid), 6.3
   Exercises 1(c)/(d), 6.4 untouched.
5. Keep checking negative signs (see learner profile).

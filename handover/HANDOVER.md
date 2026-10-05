# Handover

Last updated: 2026-10-05.

## Progress so far

**Task #1 (prerequisite diagnostic) and task #2 (6.1 Area between
Curves) are now marked complete.** The original standalone diagnostic
(3 short questions before starting 6.1) was never finished in that
form — Wifey moved straight into curriculum exercises instead, and the
session followed her lead. But the three prerequisite skills it was
meant to check (definite integrals, curve sketching, intersection-
finding) plus the core 6.1 method have since been demonstrated
thoroughly through actual exercise work, including three **fully
independent, fully correct** solutions in a row with zero guidance from
me: Exercises 2(a) (parabola/line area), 2(b) (area by y, right-minus-
left), and 3(a) (vertex-finding for two parabolas + intersection via
`18=2x²` + value tables + sketch + split-free area integral, evaluated
correctly including signs at the negative bound). That's real,
repeated, unprompted evidence — the strongest kind under "Task
completion discipline" — so both tasks are closed on that basis.

- **6.1 Area between Curves — COMPLETE.** Exercises 1(a)-(d) solved,
  then **redone/verified a second time** with Wifey doing the actual
  arithmetic herself while I pointed at specific wrong steps rather than
  solving them: (b) had two independent errors (antiderivative of `3x`
  written as `x³` instead of `3x²/2`; then `24+16` arithmetic as `43`
  instead of `40`) — she corrected both and reached the right `125/6`.
  (d) had three independent errors across two redo attempts (axis order
  reversed on her hand sketch; `cos(π/4)` value swapped with
  `cos(π/6)`'s; missing the `1/2` factor on the `cos 2x` antiderivative
  term, `cos(π/3)` value swapped with `cos(π/6)`'s, and the `cos π = -1`
  sign error) — she corrected all of them and reached the right `1/2`.
  Then Exercises 2(a), 2(b), and 3(a) were each solved **fully
  independently and correctly, first try, no guidance** — see above.
  Exercises 3(b)-(d) remain unattempted but are optional extra practice
  now, not required for the topic to count as done.
- **6.2 Volumes** — Example 1 (sphere), Example 3 (y=x³ about y-axis),
  Exercises 1(a)/(b) (disk, then split washer about y-axis), and Example
  6 (triangular cross-sections — not a solid of revolution, with a
  from-scratch equilateral-triangle height derivation) all covered in
  depth with diagrams. **Exercises 3 (pyramid, A(x)=(Lx/h)²) is still
  open** — she was given the setup and asked to find A(x) herself, never
  answered, then moved on; pick it back up.
- **6.3 Arc Length** — Exercises 1(a) and 1(b) solved in full (with a
  long, necessary deep-dive into what `du`/`dx` actually mean, why
  substitution bounds change, and the general u-substitution recipe —
  see learner profile). **1(c) and 1(d) are still open.** Fixed a typo
  in the source slide for 1(d)'s point P (confirmed against the original
  PDF, not an extraction error); recorded P=(-1, 1/2) by symmetry in
  `curriculum/6_3_Arc_Length.md`.
- **6.4** — not touched yet.
- **Supplementary (not from our curriculum decks, brought in because it
  helps or because she asked):** the general u-substitution method
  (6-step recipe, verified across 3 different integral types); why
  `sin(2x) ≠ (sin x)/2`; the power-reduction identity `sin²x=(1-cos2x)/2`
  (flagged honestly as not covered in any of our 4 decks); a volume
  problem from one of her actual course's video lectures (washer about
  `y=-2`, needs the power-reduction identity) — solved in full, two
  errors caught (`cos π` sign again; `π·π` miscomputed as `2π` instead
  of `π²`); finding a parabola's vertex (two methods: `-b/2a`, and via
  the derivative); three alternative methods for solving a quadratic
  (quadratic formula, completing the square, AC/grouping method) on top
  of simple factoring.

## Learner profile

- **Needs heavy visual scaffolding.** Text/formula explanations alone
  repeatedly weren't enough — matplotlib diagrams (2D regions, 3D solids
  of revolution, unit-circle references, step-by-step point-plotting)
  consistently helped her get unstuck. Default to including a diagram
  for anything spatial (graphs, solids, geometric derivations).
- **Two specific facts recur as errors across unrelated problems** —
  these look like genuinely unsettled facts, not one-off slips, and are
  worth proactively double-checking whenever they come up rather than
  assuming they're fixed after one correction:
  - `cos(π) = -1`, so `-cos(π) = +1`. Got this wrong at least 3 separate
    times (the `y=-2` volume problem, and twice more in 6.1 Exercises
    1(d)), after it was explained in detail via the unit circle each
    time.
  - `cos(π/6) = √3/2` vs `cos(π/3) = 1/2` — she repeatedly swaps these
    two (uses the π/6 value where π/3 is needed, and vice versa).
  Good news: once either is pointed out specifically, she fixes it
  correctly herself — the reasoning and arithmetic are fine, it's
  specific recall that's shaky. Consider a short, standalone drill on
  standard angle values (just sin/cos at 0, π/6, π/4, π/3, π/2) at some
  point rather than only catching it inline.
- **Differential/substitution notation (`du`, `dx`, implied
  multiplication) needed a long, from-scratch explanation** — she didn't
  have a working mental model for why bounds change under substitution,
  why `du/2` and `(1/2)du` are the same thing, or that `du` disappears
  once you actually integrate (vs. just rearranging it). This is now
  reasonably well covered (see the 6.3 Exercises 1(a) discussion in this
  conversation) but is foundational enough to watch for regressions.
- Also still mixes up the unit circle's (cos θ, sin θ) point-coordinates
  with a function graph's (x=input, y=output) axes, and confused
  sin(2x) with (sin x)/2 early on — both addressed, not retested since.
- **Communicates in short, often garbled (likely voice-to-text) Russian
  messages** — terse questions like "куда делась 2" or "почему это 1"
  usually point at one specific step, not the whole problem; asking
  "which step" back isn't necessary, the specific step is usually
  identifiable from what she quotes. When it's genuinely ambiguous which
  problem/step she means, she responds well to being asked directly
  rather than guessed at repeatedly.
- **Jumps between topics/decks non-sequentially** and sometimes leaves
  an exercise mid-way when she moves to the next thing (see 6.2
  Exercises 3 — still open since the last checkpoint) — worth
  periodically circling back to open items rather than assuming
  abandonment means she's done with it. She also sometimes brings in
  problems from her actual course's video lectures, not our curriculum
  decks — treat as legitimate supplementary material per CLAUDE.md, and
  say plainly when something isn't covered in our 4 decks.
- Responds very well to being handed a worked method/checklist (the
  u-substitution 6-step table, the "always check these things" area-
  between-curves checklist) and then asked to apply it herself with me
  checking — this produced her best independent work this session,
  better than pure step-by-step narration.

## Current level / notes

**6.1 (area between curves) is solid.** She's independently handled
every piece of it correctly in a row: setting up top-minus-bottom (and
right-minus-left when the curves are given as x=g(y)) integrals, finding
intersection points (including via a full quadratic solve), finding a
parabola's vertex, splitting an integral when curves cross mid-interval,
sketching, and evaluating definite integrals correctly including sign
handling at negative bounds. The two previously-flagged recurring errors
(cos π sign, cos π/6 vs π/3) showed up during 6.1 Exercises 1 but not
during the three fully-independent problems that followed — worth
watching whether they're actually fading or just didn't come up (none
of 2a/2b/3a happened to need those specific values).

Next up is 6.2 (tasks #3-4, volumes) and 6.3 (tasks #5-6, arc length) —
both still open, with specific unfinished exercises noted below.

## Next steps

1. Finish 6.2 Exercises 3 (pyramid) — she has the setup (A(x)=(Lx/h)²)
   but hasn't computed the integral yet. This is the next concrete item.
2. Continue 6.3 Exercises 1(c) and 1(d) (arc length) — (a) and (b) are
   done.
3. Given 6.1 is now solid, consider giving her more fully-independent
   problems (not guided) for 6.2/6.3 too, rather than walking through
   examples step-by-step by default — that's what produced the
   strongest evidence in 6.1.
4. Still watch for the cos(π)=-1 sign error and the cos(π/6)/cos(π/3)
   mixup if trig values come up again in 6.2/6.3/6.4 — not yet confirmed
   fixed, just untested recently.

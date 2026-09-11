# HANDOVER — C++ Tutoring

**Last updated:** 2026-09-08 (Tuesday evening)
**Exam:** Friday 11 September 2026 — **3 days out**

> Date correction: earlier versions of this file said "Sunday 6 September,
> 5 days out". That came from the session setup instructions and was wrong;
> the system date confirms Tuesday 8 September. Monday and Tuesday daytime
> are already spent. Plan from the table in section 5, not from memory of
> the old one.
**Status:** Ahead of the original plan on arrays/pointers; structs and recursion untouched.

> Supersedes `archive/handover_2026-08-29_STALE.md`. That file predates a full
> week of work and should not be used for planning — keep it only as history.

---

## 1. Where things actually stand

### Covered, with evidence (she wrote working code or answered checks correctly)

| Topic | Evidence |
|---|---|
| Pass by value vs. reference, `void` vs. typed return | Session 1: explained, then confirmed via `swap`/`gcd` below |
| `swap(int&, int&)` | Session 1: written from scratch across 3 corrected rounds (missing `int` on refs, overwritten value before the temp copy was used, `int`/no-`return` header mismatch) — final version fully correct |
| `gcd(int, int)` (subtraction) | Session 1: written from scratch across 2 corrected rounds (redundant condition, unnecessary `&`, forgot to capture return value) — final version fully correct, traced by hand (GCD(25,75)=25) |
| Print array with loop | Handwritten, corrected after 2 bound errors |
| Search element (bool flag + `break`) | Handwritten, corrected after a stray `=`/`==` and a flag-reset bug |
| Sum/average of positives, incl. "none found" edge case | Handwritten, corrected after using the loop index as the positives-count |
| Max/min in array | Handwritten, corrected after initializing to 0/1 instead of `arr[0]` |
| Reverse array in place (two indices) | Handwritten, corrected after an overwrite-instead-of-swap attempt |
| Insert into sorted array with shift | Handwritten, heavily scaffolded — several rounds (inverted search condition, wrong shift direction) |
| Delete from array with shift | Handwritten, corrected after an inconsistent loop direction |
| Default arguments (`power`) | Compiled, corrected after a missing default and an `a *= a` mixup |
| Function overloading (`maxOf` ×2) | Compiled and run, correct on the second attempt |
| `prime()` | Compiled and run, corrected after several conceptual restarts |
| `lcm()` calling `gcd()` | Compiled and run, correct first try |
| Goldbach (uses `prime()`) | Compiled and run, corrected after a misplaced `break` and a no-op input loop |
| `perfectNum()` | Compiled and run, simplified from an over-built first attempt |
| Selection sort | Handwritten, corrected after brace-placement issues |
| Bubble sort | Handwritten, corrected after brace-placement issues |
| **Pointers** (8 taught portions: address/value, read/write via pointer, pointer into array, `*(p+1)` vs `*p+1`, printing a pointer, array/pointer equivalence, `p++`, pointers as parameters) | Every comprehension check answered correctly except one slip (`cout << p`), corrected immediately |
| Dynamic allocation (`new`/`delete[]`) | Both check questions correct |
| C-strings (`\0`, strlen/strcpy/strcat/strcmp, manual versions) | Checks correct |
| 2D arrays — reading and tracing | Checks correct, scored perfectly once "outer loop = row" framing given |
| Pascal's triangle | Asked to be shown code outright, declined twice; built from a verbal structure, corrected after 3 named bugs |
| `isPalindrome()` + POINTER_FUNCTION task 2 (m, m², m³) | 2026-09-06: wrote the whole program herself, all 3 previous bugs fixed. Compiles clean, outputs the correct 11 / 101 / 111. Saved `original` before the destructive loop **unprompted** — that is recurring mistake #2, handled correctly without a nudge |

### Two artifacts published for her — links live nowhere else

**Cheat sheet (2026-09-10):**
https://claude.ai/code/artifact/23c08f35-4766-45a2-988b-658130369a6c

**Practice paper (2026-09-11, exam morning):**
https://claude.ai/code/artifact/6eb0b2ab-2911-46f0-b281-9d610ba0ae8e —
she asked for a test in the same format as the June mock. 16 fresh
questions across the same three sections, answers hidden behind a reveal
button with a self-marked tally. Every answer was verified by compiling and
running, not reasoned out. Questions were aimed deliberately at her known
gaps: a function that prints before returning (II.2), `switch` fall-through
firing twice (II.1), `*p + 2` vs `*(p+2)` (I.7), `&&` where the last paper
had `||` (II.3). **Her results on it are not known** — it was published and
the session had no further contact.

### Exam-eve cheat sheet — 2026-09-10

The cheat sheet itself:

Organised by the exam's four question types, built only from mistakes she
actually made this week, with honest markers per item (hers vs. seen on the
mock vs. already solid). Ends with an eight-point pre-submission checklist
of her recurring bugs. If a later session needs it, that URL is the only
place it lives.

Worth knowing for planning: **the mock paper has no "write a program from
scratch" section, but the real exam does.** She spotted this herself and was
right — an earlier read of mine implied the exam leans toward reading over
writing, which was wrong. The real paper has all four types: fill-in-blanks,
multiple choice, tracing, and three hand-written programs. Her week of
writing full programs targets the section the mock simply omits.

### Mock paper worked in full — 2026-09-10 (day before the exam)

She sent the whole paper as a `.docx` (`curriculum/mock_paper_2026-06.docx`),
which turned out to be the same document she had photographed — section I is
the 10 MCQs already done on 6 Sep. Sections II and III were new and are now
done in full.

**Section II (tracing, 4 programs, 7 points each):**

| Q | Her answer | Correct | Note |
|---|---|---|---|
| 1 | `6 6` | `6 6` | **Right first try, and she cleared the `switch` fall-through trap** (`case 3` has no `break`) |
| 2 | `70 3 10` | `10 7` then `70 3 10` | Every value right, including the reference semantics; she **omitted the `cout` inside the function** |
| 3 | `33` | `25` | Counted `a[2][1]=8`, which satisfies neither condition |
| 4 | — | `He!lo` | Not attempted; she asked to move on |

**Section III** (fill in the blanks: pointer-returning search, and Goldbach)
was given as worked answers with explanations, all verified by compiling.
Also flagged a genuine flaw in the paper itself: `findFirstGreater` is called
before it is declared and there is no prototype, so the code as printed will
not compile.

**The one gap that cost her real marks, worth leading with if there is any
time left:** she believed a function only *returns*, and did not expect it to
*print* on the way. She asked twice, and what finally landed was running the
same program with the function's `cout` deleted — the output then became
exactly what she had predicted. The rule she needs at the exam: when a
tracing question calls a function, open its body and check for `cout` inside;
that output comes before anything `main` prints on the same line.

### Second exam-format MCQ paper — 2026-09-06, page 1 of 4

She produced a new mock paper (10 MCQs, "3 points each", followed by a
"Write out the result" tracing section on pages 2–4 — **pages 2–4 not yet
seen, ask for them**). This is the second document in exam format after
`homework_on_pointers.doc` and is not in `curriculum/`.

First pass: 4 clearly correct (2, 4, 7, 9), 2 wrong (5, 6), 1 blank (3),
1 ambiguous (1), and 2 where she circled more than one option (8, 10).

After being given the missing rule and asked to redo — **without being told
the answers** — she self-corrected every single one she retried: 3 → B,
5 → C, 6 → 34, 8 → D, 9 → D, 10 → C. Page 1 is now fully resolved, 10/10
after correction. On Q1 she confirmed she counts `\t` as one character and
added `\0` to reach 6 — the reasoning is sound and she avoided the paper's
actual trap (counting `\t` as two); the question itself is ambiguous
between strlen (5) and bytes in memory (6), so she was given the
"look for the words length/strlen vs bytes/memory" tactic instead of a
verdict.

Pattern worth noting, and it is the strongest signal in this session: she
gets these right as soon as she has the rule, and she asks for the rule
rather than guessing. The failures were missing knowledge, not faulty
reasoning.

### New gaps this paper exposed

1. **`!` (logical NOT) was genuinely unknown**, and she had truth values
   inverted — said "0 is true and 1 false". Corrected: 0 is false, non-zero
   is true, `!` flips it. She then redid the question correctly.
2. **`cout << charPointer` prints the string, not the address** — she read
   `cout << s+2` as text arithmetic ("Hello+2"). The contrast with
   `int*` (which does print an address) is now stated but not yet drilled.
3. **`sizeof(array)` vs `sizeof(pointer)`** — still open, see above. Same
   family as her `&pointer` vs `&element` cluster from the pointer homework:
   an array is not a pointer.

### `homework_on_pointers.doc` — completed in full

The one document in exam format:

- **Tracing (6 programs):** 5 of 6 correct first try. Missed the no-braces
  trap — assumed an `if` was inside a loop when only one line actually was.
- **MCQ (19 questions):** 5 wrong, clustered on two things: precedence of `*`
  against `++`/`+=`, and `&pointer` vs `&element`.
- **Fill-in-blanks:** 2 of 3 (gave `&a[0]` where the address of element *i*
  was asked for).

All wrong answers were walked through individually afterward, at her request.

### Not verified / not started

- **Cold recall of `swap`/`gcd` at the start of session 2** was assigned but
  the transcript does not record her answer — treat this as **not
  re-confirmed**, not as evidence of retention. Worth a quick re-check.
- **`POINTER_FUNCTION.docx`** — three tasks:
  1. Five students (ID + score): sort by score, highest scorer, above-average
     list. No `<algorithm>` allowed. **Not started.**
  2. Palindromes: all *m* in 11–999 where *m*, *m²*, *m³* are all palindromes.
     **Fully done, 2026-09-06.** Code correct (see evidence table above),
     and the why-check is now answered correctly too: traced n=121 by hand
     (n/num/rev all correct across 3 passes) and correctly explained that
     `return rev==n;` would give `false` even for a real palindrome, because
     `n` is always 0 by the time the loop exits — `original` is what
     survives the loop's destruction of `n`. This is her recurring mistake
     #2 (losing a variable before it's needed) explained in her own words,
     not just avoided by luck. Minor cleanups pointed out, not yet applied:
     redundant `m>=11` in the loop condition, redundant `int m=11;` before
     the loop, unused `<cmath>` — cosmetic, not blocking.
  3. Bank account menu — pass balance by reference, no globals, loop until exit.
     **Not started.**
- **`20260610_struct_.docx`** — structs. **Started 2026-09-06, in progress.**
  Done so far, all written by her:
  - `struct Student` definition — correct after 3 rounds. Round 1 used
    `string name` and `int score[] = {A,B,c}`; round 2 wrote `cstring name`
    as if `cstring` were a type keyword (it isn't — she'd taken the word
    literally); round 3 correct with `char name[20]` and `int score[3]`.
    She got the trailing `};` right unprompted from the first attempt.
  - Input loop with **nested loops and two distinct indices**
    (`n` = student, `j` = score) plus a `sum` accumulator — 3 of 4 blanks
    right first try after one round where she'd used a single counter for
    both jobs and wrote `cin >> "prompt"` (cin/cout direction confusion —
    worth watching, it was a real conceptual mixup, not a typo).
  - `average` computed as `double sum` / 3 — she fixed the integer-division
    trap herself when pointed at it.
  - Output loop: written on her own initiative. Took 3 rounds on one line
    (`list[n].average`): round 1 wouldn't compile (`n` out of scope), round
    2 she fixed the scope by moving the line inside the inner loop's braces
    — which compiled but printed three other students' averages per
    student. Showing her the actual wrong output was what landed it; round
    3 correct (`list[i].average`, placed after the inner loop). **This is
    the recurring two-indices-doing-the-wrong-jobs mistake again** — worth
    leading with next time she has nested loops.

  **Verified by compiling and running** on the worksheet's sample data:
  input, average, and output all correct — 89 / 60 / 91 / 45, matching the
  expected output exactly.

  - **Bubble sort by average, descending** — she said outright she no longer
    remembered bubble sort (she wrote both sorts on 5 Sep; four days was
    enough to lose it). Re-taught from the stated structure plus a
    fill-in-the-blanks skeleton. Across three rounds she got the swap
    (`Student temp`, three lines) correct, the counters consistent, the
    `.average` on both sides of the comparison, and the semicolon. **The
    sort logic is now correct.** Only the loop bounds are wrong *relative to
    the 4-student array* — she has `c<6`/`b<5`, which is internally correct
    for a 6-element array but must be 3/3 for this worksheet.

  ### Where she actually left off, and the thing to fix first next session

  Partway through the sorting work she **retyped the whole program from
  scratch** instead of adding the sort to the file that already worked, and
  the rewrite silently reintroduced errors she had already fixed:
  `student list[6]` (lowercase type name), `double sum` declared *outside*
  the per-student loop so it never resets, `cin >> list[n].name >> ' ' >>
  list[n].id >> endl`, and 6 students where the worksheet has 4. She was
  told twice to go back to the working file and did not — a tiredness
  signal, not a comprehension one.

  **Resolved at the end of the session:** she asked outright for the working
  version ("send me how it should be, I don't understand your explanation"),
  so the complete program was assembled *from her own already-correct lines*
  and sent to her as a file — compiled and verified to output
  Wang 91 / Zhang 89 / Li 60 / Zhao 45. Not a handed-over solution: every
  line was hers, written earlier the same day; the rewrite had lost them.

  **Next session, start here:** she just needs to paste that file into a
  fresh project, run it, and check the order matches. ~5 minutes, then
  structs are closed and recursion starts. She does not need to hunt for her
  old file — it is superseded. Do not let her retype the program.

  **Still to do on this worksheet after that:** per-course averages,
  highest-average student, below-60 list, ID tie-break, and the optional
  invalid-score challenge — all droppable per the cut list in section 5.
  Output formatting also needs separators.
- **`20260617_recursion.docx`** — recursion. **Started 2026-09-09.**
  **Tracing is now unlocked** — this was a real breakthrough and the route
  to it matters more than the result.

  What did *not* work: analogies (queue, stack diagrams), instrumented
  program output, and asking her to produce a whole trace. Three attempts,
  three failures, ending in "I can't read the code and say what comes out."

  What did work, and what to reuse: **give her a mechanical 3-rule
  procedure and ask for exactly one line at a time.** The rules used were
  (1) check the `if`; true → base, write the value and stop; false → write
  the second line with the inner call left unresolved, (2) repeat one level
  down, (3) from the base, substitute upward. She then produced each line
  correctly on request.

  Two prerequisite gaps surfaced and were fixed on the way, both worth
  re-checking if she wobbles:
  - **She did not know what `return` does.** Taught from scratch,
    non-recursively: `return X` both hands back a value and ends the
    function, and the call site is *replaced* by the returned value.
  - **She thought `f(0)` was still being called** at the base and asked,
    reasonably, how anything could come back if it was zero. The fix was
    seeing that `return 1` exits before the second line ever runs — the
    `if`/`return` means only one of the two paths executes.

  She also asked, unprompted, how the machine "knows" the next `n` is 2.
  Answered by connecting to pass-by-value, which she has solid from session
  1 — each call gets its own copy — and shown empirically by printing `&n`
  per level. That landed.

  **Evidence:** traced `f(3)` (factorial shape) correctly with guidance one
  line at a time, then traced `g(3)` (`n + g(n-1)`, base `n==0` returning 0)
  **completely on her own, first try, descent and ascent both correct** —
  including correctly descending one level further than the previous example
  because the base condition differed. Verified by compiling: `g(3) = 6`.

  **Still to do:** she has only *read* recursion, never *written* one.
  Writing is the next portion, then the worksheet's own functions. Per the
  section 5 cut list: core only, not all nine.
- **`switch_statement_ATM_Simulator.docx`** — never opened. Low priority.
- **`palindrome_practice.docx`** — never opened. Low priority.
- Mixed revision / cold recall before the exam.

---

## 2. Her level

Strong on: pointers (unusually clean — 8 portions, no wrong answers beyond
one immediately-corrected slip), reading and tracing code, spotting what a
loop does. She reasons about *why* rather than pattern-matching; given a
correct rule she applies it to new cases.

Weaker on: assembling a program from scratch. She can almost always fix code
once told *where* the problem is, but the blank page is hard. Expect several
rounds of correction on any new program shape.

### Recurring mistakes — check these first, every time

1. **Loop bound when the body reads `arr[i+1]`.** Needs `i < n-1`, she writes
   `i < n`. Recurred across insert, delete, and bubble sort — the single
   most persistent error.
2. **Overwrite instead of a three-line swap.** Writes `arr[i] = arr[j]` and
   loses the value. Recurred in `swap` itself, reverse, insert, and bubble
   sort.
3. **Uninitialised local variables.** She half-believes locals default to
   zero (told this in class). Corrected explicitly, still recurs.
4. **Brace placement** — a statement lands inside the wrong loop. Recurred in
   `prime`, selection sort, and the pointer-homework trace question.
5. **`=` vs `==`** in conditions.
6. **Loop counter used as an accumulator.** Tried to use the `for` index as
   the count of positives.

### Older pattern (from session 1, still worth watching)

The variable in the loop condition and the variable actually changing in the
body drift apart (seen in an early diamond attempt and the Armstrong number
exercise). Less frequent now, but was the dominant error early on.

---

## 3. How to teach her — she asked for this explicitly

- **Explain before testing.** She pushed back, correctly, on being handed a
  quiz question as first exposure to a concept. Teach the rule, then check.
- **Small portions with one check each.** Not walls of text. This is what she
  named as working, and the pointer block (8 short portions, all correct) is
  the evidence it does.
- **Never hand over complete code.** She noted herself that copying teaches
  her nothing — the one time it happened (Pascal's triangle, first pass) she
  said so. Give the structure in words, let her write it, then debug.
- **Point at the error, don't fix it.** Name the *kind* of error and roughly
  where; let her find it. She asked for this directly.
- **Photos only for genuinely new material.** For small repeat fixes she
  says what she changed and that's taken on trust — she asked for this to
  save time and it has worked fine.
- Interactive multiple-choice drilling works well for rules and traps —
  confirmed again 8 Sep: when she said she wasn't understanding structs, a
  blank-form analogy plus five lettered multiple-choice questions got 4/5,
  and the one she missed was exactly the one that mattered (she thought
  sorting swaps only the `average` field, not whole records). Use this
  format when she says she's lost; it locates the gap far faster than more
  explanation does.
- **Analogies land better than code for a new concept** — *but only for
  what a thing IS, not for how to do it.* The struct clicked as a blank
  paper form. Recursion did **not** click from analogies at all; what she
  needed there was a mechanical step-by-step procedure. Rule of thumb: use
  an analogy to answer "what is this", give a procedure to answer "how do I
  do this".
- **When she says she can't do something, ask for one line, not the whole
  thing.** Repeatedly asking for a full trace failed three times; asking
  for a single line at a time worked immediately and got her to a correct
  independent trace within a few exchanges. This is probably the single
  most useful thing learned about teaching her.
- **Check the prerequisites before blaming the topic.** Her recursion
  block was stuck on not knowing what `return` does — nothing to do with
  recursion. She has used `return` correctly for weeks without having the
  model for it. Expect more of these: assume nothing is known, ask early.
- **She retypes whole programs from scratch instead of editing.** This
  reintroduces bugs she already fixed and burns her energy. Watch for it and
  redirect her to the working file — and note that when tired she may not
  act on that redirection even when told twice.
- **Her client auto-suggests a reply in the input box, and it can contain the
  answer to a check question.** She flagged this and does not want it. It is
  the app's own suggested-reply feature, not something a session emits, so it
  can't be turned off from here — work around it instead: make check
  questions require a trace, a table, or written code rather than a
  one-sentence rule, so a suggested one-liner can't stand in for her own
  reasoning. A question a suggestion has already answered is spent — replace
  it, don't re-ask it.
- Tutoring language is Russian; she switches to English freely. Follow her lead.
- Sessions have run long. Short portions and real breaks work better than
  pushing on — quality drops off noticeably when she's tired, and stopping
  at a clean point has consistently been the better call.
- **Watch for distress, not just errors.** She had one moment of acute
  distress (feeling "too stupid," planning to skip sleep/food). The right
  response was to stop teaching content, address the distress directly with
  concrete counter-evidence, and only resume once that was settled.

---

## 4. Exam format (from her, not written in any document)

Four kinds of question:

1. Fill in the blanks
2. Multiple choice
3. **Read a program, write what it prints** (tracing)
4. Write a full program

ASCII appears in both the MCQ and the tracing sections. Covered informally
(`'A'`=65, `'a'`=97, `'0'`=48, the 32 gap, `cout << 'A'` vs `cout << (int)'A'`)
but never drilled — worth a few practice questions.

### Official syllabus she typed out (exists nowhere else)

1. Data Types & Variables — 1.1 Data Types, 1.2 Variables & Constants
2. Operators — 2.1 Arithmetic, 2.2 Logical
3. Selection — 3.1 Statements, 3.2 If, 3.3 Switch
4. Loops — 4.1 While, 4.2 Do-While, 4.3 For & Nested, 4.4 Break & Continue, 4.5 Practice
5. Compound Types — 5.1 Arrays (5.1.1 Sequential Search, 5.1.2 Bubble Sort, 5.1.3 C-strings), 5.2 Pointers, 5.3 Dynamic Allocation
6. Functions — 6.1 Basics, 6.2 Argument Passing, 6.3 Overloading, 6.4 Default Arguments

The official list stops at Functions, but the worksheets include structs and
recursion, and she confirmed both are still in scope for the retake. Note the
syllabus specifies **bubble** sort where the worksheets use **selection**
sort — both have now been taught.

---

## 5. Time left, and the risk

As of Tuesday evening 8 September, what is actually left:

| Day | Time |
|---|---|
| Tue 8 Sep (evening, in progress) | whatever remains of tonight |
| Wed 9 Sep | ~1.5 hours |
| Thu 10 Sep | less than an hour |
| **Fri 11 Sep** | **EXAM** |

Roughly 3–4 working hours total. Recursion is still completely untouched.
That does not all fit, and she has been told so plainly.

**Agreed cut list — this is the plan, not a suggestion:**

1. **Finish struct sorting** (she is mid-flow, ~15 min).
2. **Recursion** — the single biggest risk, a whole exam topic never opened.
   Core only: base case vs. recursive case, two or three functions, and
   hand-tracing a call stack (examinable in both the MCQ and tracing
   sections). Do not attempt all nine worksheet functions.
3. **Tracing practice** — pages 2–4 of her second mock paper. Highest value
   per minute: tracing is a whole exam section and it is her strongest skill.

**Dropped, deliberately:** `POINTER_FUNCTION` tasks 1 and 3, the ATM/switch
worksheet, the extra palindrome worksheet, the struct optional challenge,
and — if time runs short — the struct worksheet's three "added functions"
(course averages, highest student, below-60 list). Those three are simpler
than the sorting she will already have done and are the same shape.

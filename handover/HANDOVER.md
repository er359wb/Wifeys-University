# HANDOVER — C++ Tutoring

**Last updated:** 2026-09-06 (Sunday)
**Exam:** Friday 11 September 2026 — 5 days out
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
     **In progress** — mid-debug on the digit-reversal helper. Last attempt
     had: `while` with no condition, no `n = n / 10`, and
     `reverse = n * 10 + num` instead of `reverse = reverse * 10 + num`.
  3. Bank account menu — pass balance by reference, no globals, loop until exit.
     **Not started.**
- **`20260610_struct_.docx`** — structs. Not touched.
- **`20260617_recursion.docx`** — recursion. Not touched. Largest remaining topic.
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
- Interactive multiple-choice drilling works well for rules and traps.
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

She stated her available time per weekday (dates corrected — today is
Sunday 6 September, exam is Friday 11 September):

| Day | Time |
|---|---|
| Mon 7 Sep | 30–60 min |
| Tue 8 Sep | 2+ hours |
| Wed 9 Sep | ~1.5 hours |
| Thu 10 Sep | less than Monday |
| **Fri 11 Sep** | **EXAM** |

Roughly 4–5 working hours remain for: three `POINTER_FUNCTION` tasks,
structs, recursion, and revision. That does not all fit.

**Suggested priority if it has to be cut:**

1. Recursion — it's on the worksheets, it's the largest untouched topic, and
   she named it as the last topic of the course.
2. Structs — smaller, and the worksheet task (ranking students by average) is
   close in shape to the `POINTER_FUNCTION` student task.
3. Mixed tracing practice — highest value per minute, since tracing is a whole
   exam section and she is already good at it.
4. `POINTER_FUNCTION` tasks 1 and 3 — realistically may not fit. Task 2
   (palindromes) is already underway and should be finished.

The ATM/switch worksheet and the extra palindrome-practice worksheet are
almost certainly out of reach and can be dropped without much loss — switch
is simple and she has seen the pattern.

# C++ Exam Tutoring — Handover Note

Created Aug 29, 2026. Exam: **Sep 11, 2026** (13 days out).

## 0. How to use this

This is a handover from one Claude tutoring session to the next. Read this whole file before teaching anything. Attached alongside it: the study plan (`cpp_exam_plan.md`) and all 15 original course worksheets. The worksheets are the primary source material — this note summarizes them and tracks progress, but when actually teaching a topic, open the relevant worksheet for exact wording, sample I/O, and required function signatures.

If the person opens with something like "continue where we left off" — that's this file. No need to ask what's going on; it's all below.

---

## 1. Snapshot

- Preparing to **retake** a C++ course exam (previously failed).
- Exam format: **written, on paper.** Multiple choice, fill-in-the-blank, and **three hand-written programs.**
- Syllabus: beginner topics through recursion.
- Self-identified weakest areas (stated at the start, before any teaching): **functions & scope, arrays & strings, pointers/references/structs.**
- Environment: **Windows, Visual Studio Community 2026**, Console App (C++), installed and working.
- Communicates fluidly in **English and Russian**, sometimes switching mid-conversation. Reply in whichever language the message is written in.
- Comfortable sending **photos of handwritten paper work** — this is the established workflow for checking paper-written code and works well; keep encouraging it.

---

## 2. Tutoring approach — read this before teaching

This section is the most important part of the handover. The approach below was arrived at through real friction in the previous session(s) — some of it from direct, explicit pushback from the student. Follow it from the start rather than rediscovering it.

**Never hand over a finished solution to a worksheet problem.** The worksheets aren't graded anymore, but the exam requires producing three full programs by hand with no compiler and no reference. Reading a working solution doesn't build that. Instead: work a parallel/analogous example beside the real problem when introducing a new idea, then have the student write the actual worksheet problem themselves.

**But name new tools before expecting their use — don't make the student invent something they've never seen.** This is a hard rule the student pushed back on directly and correctly. If a fix requires a construct they haven't used (a new loop type, a library function, `void` vs. typed return, `&`, `pow()`, two-pointer swapping, etc.), state the fact/tool directly. What the student should invent themselves is the *arrangement* — which lines, in what order, which variable goes where. Concretely:
- **Give directly:** what an operator/keyword/function does, that a construct exists, syntax rules, *why* a rule exists.
- **Make them build:** the sequence of steps, the choice of which variable does what job, the translation from a plain-English description of the logic into code.
- A good technique that worked well: have the student state the goal as a plain sentence ("add to sum: the digit, raised to count"), then translate it piece by piece into code. This catches "which variable goes where" confusion better than describing the bug abstractly.

**Don't ask the same comprehension-check question more than once or twice.** If the student has answered adequately — even if the phrasing isn't textbook-perfect — move on or just give the clean explanation yourself. Repeating "but why does it really work" more than twice reads as an interrogation, not a Socratic method, and the student called this out directly. When in doubt, answer it yourself and move forward.

**Be concise.** Long explanations without a clear reason are actively unwanted — stated directly, more than once. Default to short. Expand only when asked, or when a genuinely new concept needs a worked example.

**Own mistakes plainly and move on** — don't over-apologize or spiral into self-correction essays. State what was wrong, fix it, continue.

**Cold recall at the start of every session (or after any break/gap):** ask the student to reproduce the previous session's key program from memory, on paper, before introducing anything new. This was the single most valuable habit established and was inconsistently applied — apply it every time, no exceptions, even if it feels repetitive. The exam has no compiler and no earlier draft to glance at; this is the closest rehearsal available.

**Paper first, IDE second.** New problems get attempted on paper before typing. Typing-with-autocomplete does not transfer to a blank-paper exam. The student self-disclosed once that they solved a problem by randomly tweaking code in the IDE until output matched a sample — that is explicitly the failure mode to guard against; if it happens again, address it directly and calmly (as was done), then verify real understanding with a "why" question answered by the student in their own words (once, not repeatedly — see above).

**Avoid `#include <bits/stdc++.h>`** and other GCC-only extensions (e.g. variable-length arrays like `int arr[n];`) — Visual Studio (MSVC) rejects them. Stick to standard C++ that compiles identically everywhere.

**Off-topic detours** (the student has asked about internet connectivity, stock stop-loss calculations, etc.) — answer briefly and factually, then return to C++. No need to redirect forcefully; the student always comes back on their own.

---

## 3. Recurring bug watch-list — actively check for these

**#1, by far the most frequent: the variable tested in a loop's condition must be the same variable modified in the loop's body.** This exact mismatch has appeared repeatedly and independently across sessions:
- An early `while (larp > 0)` diamond attempt where `larp` was never reset per outer iteration.
- The Armstrong number program, multiple times in a row: `while(a>0)` paired with modifying `n` instead of `a`; then `while(n>0)` paired with modifying `b` instead of `n`; then `pow(b%10, count)` used after `b` had already been fully consumed by a different loop.
- The bottom half of the diamond: outer loop tested/decremented `row` correctly, but this exact class of bug is the one to keep watching for in every new loop, especially once pointers arrive (`p` vs. the array index is the natural next place this bug will resurface).

When a loop is wrong, the fastest diagnostic question to ask is: *"What variable does the `while`/`for` test, and what variable does the body actually change?"* — said once, not repeated.

**#2: forgetting to preserve a variable that's needed later.** Both Armstrong (needed original `n` for the final comparison after two destructive loops) and the swap function (needed a temp copy before overwriting) required an explicit "you need a copy before you destroy this" nudge. Expect the same issue with array algorithms (e.g. reverse-in-place, insert/remove-with-shift) and pointer work.

**#3: return-type / `return` statement mismatches.** Declared `int` with no `return` (early `swap` attempt); once explained, resolved cleanly. Watch for this recurring with `bool` functions (the `prime()` function is coming up next) and with function overloading, where return types must also match across overloads' actual usage.

---

## 4. Progress log

### ✅ Technique 1 — Digit extraction (`n % 10`, `n / 10`)
Fully covered and demonstrated cold. Sum-of-digits, count-of-digits, reverse-a-number all written from scratch after the initial teaching. Also solid: integer division truncates (`507 / 10` is `50`, not `50.7`); full C++ operator precedence table (arithmetic → comparison → `&&` → `||` → `=`), including why `%` sits at the same precedence tier as `*`/`/` (this is *why* `product = product * (n % 10)` needs explicit parentheses but `rev * 10 + n % 10` doesn't).

### ✅ Technique 2 — Accumulators
- **Digit sum minus digit product** (`234` → `-15`): solid. Known pitfalls already internalized — `product` must start at `1` not `0`; `product * n % 10` silently means `(product * n) % 10` without parentheses.
- **Armstrong number**: solid after significant back-and-forth. Final correct structure: two *sequential* (not nested) loops — one to count digits using a throwaway copy of `n`, one to sum `digit^count` using a second throwaway copy — with the original `n` preserved untouched for the final `sum == n` comparison. `pow(digit, count)` argument order was a real bug that got caught and fixed. Confirmed via a cold, unprompted paper rewrite (with one more condition/body mismatch that the student caught and fixed largely independently). **Not yet flagged to the student:** `pow()` returns `double` and can be off by a hair due to floating-point rounding, which can silently corrupt an `int` sum for larger inputs — worth mentioning if Armstrong resurfaces, or when teaching a hand-rolled integer power function (the recursion worksheet asks for exactly this: "x to the power of n").

### ✅ Technique 4 — Nested loops for patterns
- Solid 4×4 square, right triangle (`col <= row`) — both solid, written cold correctly on a later re-check.
- **Full diamond** (top half: `spaces = 4 - row`, `stars = row`; bottom half: mirrored with `row` counting down from 3 to 1, reusing the same two inner-loop formulas): built successfully after real struggle, including a moment of trial-and-error IDE guessing that was addressed directly. The key derivation the student did by hand and can now explain: spaces + stars always sums to the fixed width, so `spaces = width - stars`. Final 7-row diamond confirmed correct and complete (all four `for`-loop headers, both `endl` placements, mirrored row range).
- **Not yet covered from this worksheet:** multiplication table, "find unique pairs summing to k" (explicitly *no* `break` allowed), prime-number listing 1–n, Goldbach's first decomposition (nested loops + `break`, this one function-shaped — natural pairing with technique 5/6 below). See §7.3 for full text.

### 🔶 Functions — in progress, started Aug 27 evening
- **Pass by value vs. pass by reference (`&`)**: fully explained and internalized via the classic `void change(int n)` vs. `void change(int &n)` example, including *why* value semantics is the default (safety/predictability) and `&` is an explicit, deliberate opt-in.
- **`void` vs. typed return functions**: explained via a `printHello()` example progressing to `string printHello() { return "Hello"; }`. Rule stated and understood: the header's declared type must match the type of whatever follows `return`; `void` means no `return` value is needed (or a bare `return;` to exit early).
- **`void swap(int &a, int &b)`**: written from scratch across several corrected rounds (missing `int` type on reference parameters; using an already-overwritten variable instead of a saved copy; a stray missing space; an `int`-header/no-`return` mismatch). Final version fully correct and understood, including *why* it must be `void` (no meaningful value to return) and *why* both parameters need `&` (the whole point is mutating the caller's originals).
- **`int gcd(int a, int b)` via repeated subtraction**: written from scratch (`while (a != b) { if (a>b) a=a-b; else b=b-a; } return a;`). Iterated through: a redundant compound loop condition, forgetting to capture/use the `return`ed value in `main`, and removing unnecessary `&` once it was clear only the returned value was needed (not in-place mutation of the caller's variables) — this last correction shows real understanding of *when* `&` is actually needed vs. just copy-pasted out of habit. Final version correct and confirmed (GCD(75,25) = 25 traced by hand and matched code output).

**Immediately next up (not yet started):** `bool prime(int n)`, LCM via `a*b/gcd(a,b)`, Goldbach's conjecture using `prime()`, perfect number checker, then function **overloading** (`left()`, `Combine()`, `calculate()` — see §7.6).

### ⬜ Not yet started
- Technique 3 — guard-and-track (max/min, linear search) — worksheet ready, see §7.4.
- Technique 5 — divisor testing beyond what's listed above (perfect number, prime divisors of N).
- Function overloading (§7.6).
- Arrays beyond max/min/search: reverse-in-place (two-pointer technique — genuinely new pattern, not yet introduced), insert-with-shift, remove-with-shift (including a duplicates variant), selection sort (§7.4).
- 2D arrays: Pascal's triangle, the combined number pattern, saddle point (§7.5).
- Technique 8 — pointers, in full. `homework_on_pointers` (§7.7) is an actual midterm paper — fill-in-blank, MCQ, and "write out the result" trace questions in the *exact* target exam format. This is the single best piece of practice material available and should be worked under timed conditions closer to the exam, not just read through.
- `POINTER_FUNCTION.docx` (§7.8): sort students by score without `<algorithm>`, output highest scorer, output above-average — combines pointers + arrays + functions. Also: find all `m` in 11–999 where `m`, `m²`, `m³` are all palindromes, using a helper `bool` function. Also: a bank-account menu program with blanked-out parameter passing (`???`) — good pass-by-reference practice.
- Structs: student grade-ranking system (§7.9) — sort by descending average with ascending-ID tiebreak, per-course averages, highest average, below-60 list, optional invalid-score handling.
- Technique 9 — recursion, entirely (§7.10). Base case / recursive case, tracing a call stack by hand, then the comprehensive practice problem (filter primes from user input into a second array — flag: the worksheet's own sample output appears to contain a non-prime (`9`) in the expected "sorted primes" result, likely a worksheet typo; don't let this cause confusion — teach correct prime-filtering logic and note the discrepancy if it comes up).
- Two still-unconfirmed pieces of the if-else worksheet: leap year (straightforward, likely fine given precedence work already done) and a "character class" nested-if problem (§7.2) — probably low-risk, worth a quick confidence check rather than a full lesson.

---

## 5. The nine-technique map

| # | Technique | Status | Worksheets |
|---|---|---|---|
| 1 | Digit extraction (`% 10`, `/ 10`) | ✅ Done | Palindrome, digit sum−product, Armstrong, reverse number, improper fraction, palindrome function, 2 recursion tasks |
| 2 | Accumulator loop (sum/product/count) | ✅ Done | Digit sum−product, Armstrong, array sum/average, perfect number |
| 3 | Guard-and-track (max/min/search) | ⬜ Not started | Array max/min, search element, smallest-of-N |
| 4 | Nested loops for patterns | ✅ Done (core); multiplication table / unique pairs / primes-list / Goldbach still open | Diamond ×3, multiplication table, Pascal's triangle, 2D pattern |
| 5 | Divisor testing (`n % i == 0`) | 🔶 Started (GCD) | GCD, LCM, perfect number, prime test, prime divisors, Goldbach |
| 6 | Function def + prototype + return | 🔶 Started (`gcd`, `swap`) | GCD/LCM, Goldbach, `prime()`, `palindrome()`, overloading tasks |
| 7 | Pass by value vs. reference (`&`) | ✅ Done | `swap`, any function that must mutate a caller's variable |
| 8 | Array traversal by pointer (`*(p+i)` ≡ `p[i]`) | ⬜ Not started | `homework_on_pointers`, `POINTER_FUNCTION`, array reversal |
| 9 | Recursion (base case + smaller call) | ⬜ Not started | Entire June 17 worksheet |

---

## 6. Suggested schedule — Aug 30 to Sep 10 (12 teaching days)

Adjust forward if the next session starts later than Aug 30; the content order matters more than the exact dates.

| Day | Focus |
|---|---|
| Aug 30 | Cold recall (`swap`, `gcd`). Then: function overloading — `left()` for strings then ints, `Combine()`, `calculate()`. |
| Aug 31 | `bool prime(int n)`, LCM (`a*b/gcd(a,b)`), Goldbach using `prime()`, perfect number checker. |
| Sep 1 | Arrays — search, sum/average of positives (zero-positives edge case), max/min. |
| Sep 2 | Arrays — reverse in place (two-pointer swap, new pattern), insert-with-shift, remove-with-shift (+ duplicates variant). |
| Sep 3 | Selection sort. 2D arrays — Pascal's triangle, combined pattern, saddle point (optional). Buffer/catch-up if behind. |
| Sep 4 | Pointer fundamentals: `*`, `&`, `p[i]` vs `*(p+i)`, array-to-pointer decay. Start `homework_on_pointers.doc` (fill-in-blank section). |
| Sep 5 | Finish `homework_on_pointers.doc` — MCQ and "write out the result" trace sections, ideally timed. |
| Sep 6 | `POINTER_FUNCTION.docx` — student sort/highest/above-average without `<algorithm>`; palindrome `m`/`m²`/`m³`. |
| Sep 7 | Structs — student grade-ranking system, full requirements + optional invalid-score handling. |
| Sep 8 | Recursion basics — power, Fibonacci, minimum, digit count, digit sum, reverse a number, cstring length, array sum, binary search. Emphasize call-stack tracing on paper. |
| Sep 9 | Recursion comprehensive practice (prime filter). Full mixed timed review pulling from all nine techniques. |
| Sep 10 | Light day: rewrite 2–3 programs cold from memory, skim the mistakes list, rest. |
| Sep 11 | Exam. |

Daily rhythm that's worked well: ~10–15 min cold recall of the previous session's key program (on paper, no looking back) → new material with a worked example → the student produces one program on paper, then types it in to verify.

---

## 7. Worksheet inventory and remaining content

### 7.1 Already fully covered (no need to re-teach, just available for cold-recall drills)
`回文数练习.docx` (palindrome practice — improper fraction, digit sum−product, palindrome number), `20260412_while_loop1.docx` and `20260420_nested_loop_2_.docx` diamond problems, `20260416_for_loop.docx` diamond repeat.

### 7.2 `20260402_if-else_statement.docx` — likely low-risk, spot-check only
- Problem 1: input → output mapping `1→1, -4→-1, 0→0` (a "sign of a number" problem; `//if...else` comment suggests a simple three-way `if/else if/else`).
- **Leap year**: divisible by 4 and not by 100, OR divisible by 400. Classic `&&`/`||` precedence MCQ material — precedence already covered thoroughly, but worth confirming leap year specifically since it's a favorite exam question.
- **Nested-if character class**: given Strength/Agility/Intelligence (0–10), classify as Mage (INT≥8) / Warrior (STR≥8) / Ranger (AGI≥8) / Omniknight (≥2 attributes ≥6) / Civilian. Tests nested/chained `if-else if` ordering — note the rule order matters (check in the given sequence).

### 7.3 `20260420_nested_loop_2_.docx` — remaining problems (diamond already done)
- **Multiplication table** 1..N, triangular format (row `i` prints `i*1` through `i*i`).
- **Find unique pairs** in 1..n summing to target `k`, output as `(a,b)` pairs — **`break` is explicitly disallowed**, so the stopping/skip logic must be done with conditions alone.
- **Output all primes between 1 and n.**
- **Goldbach's first decomposition**: read even `n` (4 ≤ n ≤ 10⁶), find the smallest prime `p` such that `p` and `n-p` are both prime, output `p` and `n-p`. **Nested loops + `break` are required here** (opposite of the pairs problem above — worth contrasting the two). Invalid input (odd or out of range) → print "No solution".

### 7.4 `20260427_Array_Basics__.docx` — full list
**Basic:** search for a target value in an array (function). Sum/average of positive numbers from 10 input integers, with a "no positive numbers found" edge case (avoid divide-by-zero). Max and min of a 15-element array.

**Intermediate:**
- **Reverse in place** using two pointers/indices (`left` starts at 0, `right` at n-1; swap, move inward, stop when `left >= right`) — no extra array allowed, no built-in `reverse()`. This is a genuinely new algorithmic pattern, not a variant of anything covered yet — introduce it explicitly.
- **Insert an element** at a given position: shift everything from that position rightward by one, then place the new value. Handle invalid position.
- **Remove a specified element**: shift elements left to close the gap. Worksheet explicitly raises the duplicates case (e.g. removing all `2`s from `2 2 1 1 2 2 4 5` → `1 1 4 5`) — check whether "remove one occurrence" or "remove all occurrences" is intended before starting.
- **Selection sort**: find the min of the unsorted remainder, swap into place, advance the sorted/unsorted boundary. Repeat.

### 7.5 `20260518__2-dimension_array.docx`
- Print 10 rows of **Pascal's triangle** using a 2D array.
- A **combined pattern**: a 2D-array/loop exercise that prints Pascal's-triangle-like rows right-aligned next to a descending count sequence (see the worksheet directly for the exact spacing — it's easier to read from the original than to describe).
- **(Optional) Saddle point**: the value that's the max of its row and min of its column; the worksheet guarantees at most one exists.

### 7.6 `20260612overloaded_function_.docx`
- Overload `left()`: `left(string, n)` returns a pointer to the first `n` characters as a *new* string; then overload it again as `left(int, n)` returning the first `n` digits of an integer (e.g. `left(212013, 3)` → `212`). Both versions return via pointer per the worksheet's own phrasing — worth clarifying with the student whether their course actually wants raw pointer-returning functions here or a simplified `string`-returning version, since this worksheet predates the pointers unit and may be intended loosely.
- Overload `Combine()`: `Combine(int,int)` concatenates two integers as digits (`Combine(12,34)` → `1234`); `Combine(int, char[])` repeats a C-string N times (`Combine(3,"ab")` → `ababab`).
- Overload `calculate()`: `calculate(1,2,'+')` → `3` (does the requested arithmetic op); `calculate(2.5,3)` → `16.22` (this one is `2.5^3`, i.e. power — the sample output confirms it, the prompt text is a bit garbled in the source file).
- Delete common elements between two sorted arrays (e.g. `a={1,3,4,5,6}`, `b={2,4,6,8,9}` → `a` becomes `1 3 5`, `b` becomes `2 6 8 9`).

### 7.7 `homework_on_pointers.doc` — an actual midterm exam paper, exam-format practice
This is the closest thing available to real exam conditions — fill-in-the-blank, multiple choice, and "write out the result" code-tracing, all on pointers. Recommend working it **timed**, closer to Sep 11, after pointer fundamentals are solid. Full content (transcribed faithfully, including the source's own typos/formatting):

**I. Fill in the blanks** — covers: `int *var, ab; ab=100; var=&ab; ab=*var+10;` (what is `ab`?); declaring/pointing/reading into a `double` via a pointer; expressing `&a[i]` and accessing `a[i]` using only pointer `p` (given `int a[10], *p=a;`); `char *p="abcd\0ef"` — what does `cout<<p` print, what does `cout<<*(p+1)` print, what is `strlen(p)`; and a max/min-via-pointer program with several blanks (`for(pa=a; pa<a+10; pa++)`-style loop, the `if` condition for max, the `else if` for min).

**II. Multiple choice (16 questions)** — dereferencing (`*p` when `p=&a`), pointer/reference-equivalent statements, inferring types from `p1=b`, which of several expressions is *invalid* for accessing a value through a pointer, correct ways to point `p` at the first element of an array, invalid pointer-arithmetic expressions, pointer arithmetic yielding a specific array element, what a `while(*y++){}` string-walk computes, `&(*(a+i))`-style equivalences, array-name-as-pointer edge cases (`a=a+1` is illegal), string literal assignment through `char*` vs `char[]`.

**III. Write out the results (6 short programs to trace by hand)** — covers: `*v += b` through a pointer; swapping two variables' values via dereferenced pointers, then swapping the *pointers themselves* instead of the values (contrast between the two); summing even elements of an array via pointer walk; a character-frequency counter over a C-string using pointer arithmetic (`j = *p - 'a'`); filtering only lowercase letters out of a mixed string in place using two indices. These are excellent "trace the code" MCQ-style drills even outside the fill-blank/MCQ sections above.

### 7.8 `POINTER_FUNCTION.docx`
- **Three required functions**, no `<algorithm>` allowed: sort 5 students (ID + C++ score) by score descending; output the ID(s) of the highest scorer; output all students scoring above the class average. Full sample I/O is in the worksheet.
- Find all `m` in `[11, 999]` where `m`, `m²`, and `m³` are all palindromes — requires a helper `bool` palindrome-test function (natural reuse of technique 1 + the function skills from this week).
- A **bank account menu program** skeleton with blanked-out parts (`int ?????; createAccount(????); deposit(???, amount);` etc.) — no global variables allowed, balance must be passed by reference between functions, menu loops until exit. Good comprehensive pass-by-reference + `switch` + functions review.

### 7.9 `20260610_struct_.docx`
- Warm-up: `1! + 2! + 3! + ... + n!` (factorial-sum accumulator, technique 2 reused).
- Find all prime divisors of N, ascending order, or "No Answer" if none.
- **Struct-based student grade ranking system.** Define `struct Student` with `id (int)`, `name (cstring)`, `score1/score2/score3 (array)`, `average (double, computed)`. Core: input students, sort descending by average (tie-break ascending ID). Added: per-course class averages, highest-average student, list of all students below 60 average (or "None"). Optional challenge: any score negative or >100 → mark average `-1.00`, sort valid students before invalid ones, exclude invalid students from all averages/searches/lists. Full sample input/output is in the worksheet — matches it exactly when testing.

### 7.10 `20260617_recursion.docx`
**Basics (each as a standalone recursive function):** x to the power of n; Fibonacci series; minimum of a list; number of digits in an integer; print a positive number in reverse; sum of an array; sum of the digits of a positive integer; length of a C-string; binary search over `{19,28,31,33,35,40,45}`.

**Comprehensive practice:** read positive integers into array `a` until `-1` is entered; copy the prime numbers into array `b`; output `b` sorted. Sample: input `3 5 1 13 78 93 2 11 4 9 7 -1` → given output `2 3 5 7 9 11 13`. **Note:** `9` is not prime, so either the sample output has a typo or there's a subtlety being tested — don't let this derail the lesson; teach correct primality logic and flag the discrepancy if the student notices it too.

# Navigation

A quick map of this branch's structure, kept up to date as content is
added. This is a manually-maintained substitute for an automated
code-graph tool (graphify) — that needs local system tooling this
environment doesn't reliably have, so we're doing the cheap version by
hand instead. See CLAUDE.md's "Repo navigation map" section.

## Read first, every session

1. `CLAUDE.md` (repo root) — working rules for this branch
2. `handover/HANDOVER.md` — where teaching left off, her level, what's next
3. This file

## Current structure

```
/
├── README.md              — subject overview
├── CLAUDE.md               — rules for sessions working in this branch
├── handover/
│   └── HANDOVER.md         — live progress record, updated after every session
├── navigation/
│   └── NAVIGATION.md       — this file
├── curriculum/             — course worksheets, the syllabus and the goal
├── transcripts/            — full tutoring conversation history
│   └── images/             — photos of handwritten work, referenced by transcripts
└── archive/                — superseded planning docs, kept for history only
```

## curriculum/

The course worksheets. Filenames are dated `YYYYMMDD` by class date. These
are the authoritative source of what has to be learned — don't substitute an
invented curriculum for them.

| File | Topic | Status |
|---|---|---|
| `20260402_if-else_statement.docx` | If/else | Covered |
| `20260412_while_loop1.docx` | While loops | Covered |
| `20260414_while_loop_2.doc` | While loops 2 | Covered |
| `20260416_for_loop.docx` | For loops, GCD | Covered |
| `20260420_nested_loop_2_.docx` | Nested loops, patterns | Covered |
| `20260427_Array_Basics__.docx` | Arrays: search, sum, max/min, reverse, insert, delete, sorting | Covered |
| `20260518__2-dimension_array.docx` | 2D arrays, Pascal's triangle | Covered |
| `20260529_function_definition_and_calling_basic_2.docx` | Functions, GCD/LCM | Covered |
| `20260612overloaded_function_.docx` | Overloading, default arguments | Covered |
| `homework_on_pointers.doc` | Pointers — exam-format practice: blanks, MCQ, tracing | Completed in full |
| `POINTER_FUNCTION.docx` | 3 tasks: student sorting, palindromes, bank menu | Task 2 in progress; 1 and 3 not started |
| `20260610_struct_.docx` | Structs | Not started |
| `20260617_recursion.docx` | Recursion | Not started — largest remaining topic |
| `switch_statement_ATM_Simulator.docx` | Switch / ATM | Not started, low priority |
| `palindrome_practice.docx` | Extra palindrome practice | Not started, low priority |

`homework_on_pointers.doc` is the most useful document in the folder — it is
the only one in the exam's own format.

`palindrome_practice.docx` was originally named `回文数练习.docx`; renamed for
consistency, contents unchanged. Document metadata (author/last-modified-by
fields embedded in the `.docx` files, not visible in the document body) has
been stripped from all 13 `.docx` files as part of the privacy pass — see
`handover/HANDOVER.md`'s session log / the commit history for details. The
two legacy `.doc` files (`20260414_while_loop_2.doc`,
`homework_on_pointers.doc`) still carry short author initials in their OLE
metadata that could not be safely stripped without risking file corruption;
flagged to the user rather than silently left in or silently edited.

## transcripts/

| File | Covers |
|---|---|
| `session_01_to_2026-08-29.md` | First session — setup through functions (`swap`, `gcd`). Anonymised: speakers are "Student" and "Tutor". |
| `session_02_to_2026-09-06.md` | Second session — arrays through 2D arrays and the start of `POINTER_FUNCTION`. Condensed, not verbatim. |
| `images/` | 41 photos of handwritten code from session 2, referenced by date in `images/README.md`. Code only — no names, faces, or institution markers found on spot-check. |

## archive/

Superseded, kept for history. Do not plan from these — both predate a week
of work; the live plan is `handover/HANDOVER.md`.

| File | Note |
|---|---|
| `handover_2026-08-29_STALE.md` | Old handover. Replaced by `handover/HANDOVER.md`. |
| `cpp_exam_plan_2026-08-29_STALE.md` | Old day-by-day plan. Its schedule has been overtaken; the live plan is section 5 of the handover. |

## Maintenance

Update this file whenever the folder structure changes — new files, new
folders, new organization. A stale map is worse than no map.

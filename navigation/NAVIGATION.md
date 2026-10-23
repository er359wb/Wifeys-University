# Navigation

A quick map of this branch's structure, kept up to date as content is
added. This is a manually-maintained substitute for an automated
code-graph tool (graphify) — that needs local system tooling this
environment doesn't reliably have, so we're doing the cheap version by
hand instead. See CLAUDE.md's "Repo navigation map" section.

## Current structure

```
/
├── README.md              — subject overview
├── CLAUDE.md              — rules for sessions working in this branch
├── handover/
│   └── HANDOVER.md        — progress so far, current level, next steps
├── navigation/
│   └── NAVIGATION.md      — this file
└── curriculum/            — lecture slide decks (PDF originals + .md companions)
    ├── Chapter 21 (1).pdf / .md          — Electric Charge and Electric Field (177 slides)
    ├── Chapter 22 (1).pdf / .md          — Gauss's Law (126 slides)
    ├── Chapter 23宽版.pdf / .md           — Electric Potential, full deck (144 slides)
    └── Chapter 23宽版1009 (1).pdf / .md   — Electric Potential, short copy = slides 1–37 of the full deck
```

## Navigation paths

- New session start: read `CLAUDE.md` → `handover/HANDOVER.md` → this
  file, in that order.
- Curriculum: university-level electromagnetism lecture slides following
  *University Physics* (Young & Freedman), one PDF per chapter in
  `curriculum/`. The originals' author metadata was stripped for privacy.
  Read the `.md` companion, not the PDF (see CLAUDE.md "Curriculum file
  formats"). Each `.md` tags content with `[sN]` = slide number in the PDF,
  so you can point to (or, when needed, check) the exact original slide.
- Finding material on topic X: each `.md` is organized by textbook section
  (e.g. `## 21.3 Coulomb's Law`), then worked examples under `### Example
  N.M`. Each file ends with a concept summary, and Ch 21 and Ch 23 end with
  the assigned homework problems (no homework slide in Ch 22).
- Assigned homework: Ch 21 → 21.33, 21.44; Ch 23 → 23.20. Full problem text
  is at the bottom of the matching `.md`.
- The full electromagnetism unit (chapters 21–32) is listed in the Ch 21
  `.md` under "Course context"; only 21–23 have been received so far.

## Maintenance

Update this file whenever the folder structure changes — new files, new
folders, new organization. A stale map is worse than no map.

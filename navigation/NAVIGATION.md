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
├── curriculum/
│   ├── Chapter 21.pdf / .md        — Electric Charge and Electric Field (177 slides)
│   ├── Chapter 22.pdf / .md        — Gauss's Law (126 slides)
│   └── Chapter_23__1009.pdf / .md  — Electric Potential (37 slides; covers 23.1 only)
├── handover/
│   └── HANDOVER.md        — progress so far, current level, next steps
└── navigation/
    └── NAVIGATION.md      — this file
```

## Navigation paths

- New session start: read `CLAUDE.md` → `handover/HANDOVER.md` → this
  file, in that order.
- Curriculum documents live in `curriculum/`, one lecture-slide deck per
  textbook chapter (Young & Freedman, *University Physics*,
  Electromagnetism part). Each `.pdf` is the original; the same-name `.md`
  is the read-optimized companion — read the `.md`, not the PDF.
- Finding material on topic X: each `.md` is organized by textbook section
  (e.g. `## 21.3 Coulomb's Law`) with slide numbers `[sN]` pointing back to
  the PDF. Ch 21 lists the full course map (Ch 21–32) at the top.
  - Charge, conductors/insulators, induction, polarization → Ch 21 §21.1–21.2
  - Coulomb's law → Ch 21 §21.3
  - Electric field, point-charge field, charges moving in fields → Ch 21 §21.4
  - Superposition of fields, dipole/ring fields → Ch 21 §21.5
  - Field lines → Ch 21 §21.6; dipoles (torque, energy) → Ch 21 §21.7
  - Homework 21.33, 21.44 → end of Ch 21 `.md`
  - Electric flux → Ch 22 §22.1–22.2; Gauss's law → §22.3–22.4;
    conductors → §22.5; field-formula table → end of Ch 22 `.md`
  - Electric potential energy → Ch 23 §23.1

## Maintenance

Update this file whenever the folder structure changes — new files, new
folders, new organization. A stale map is worse than no map.

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
├── curriculum/
│   ├── SYLLABUS.md        — topic breakdown per unit (1-6), derived
│   │                        from the slides, with textbook cross-refs
│   ├── slides/            — 6 lecture decks, numbered 01-06 = study
│   │                        order (units 1-6)
│   └── textbook/          — reference textbook (Brown & Vranesic,
│                             Fundamentals of Digital Logic with VHDL
│                             Design, 3rd ed.)
└── conversation_history/  — transcripts of tutoring done before this
                              branch existed (prior claude.ai chats)
```

## Navigation paths

- New session start: read `CLAUDE.md` → `handover/HANDOVER.md` → this
  file, in that order.
- Curriculum documents: `curriculum/slides/01_...` through `06_...` are
  the actual course material and study order — units 1-6 map 1:1 to
  slide decks 01-06. `curriculum/SYLLABUS.md` is the derived topic list
  per unit; use it to find which unit/slide covers a given topic before
  opening the PDFs. `curriculum/textbook/` is reference/background
  material only, cross-referenced by chapter/section from SYLLABUS.md
  — its own chapter numbering does not match the slides' numbering.
- Finding material on topic X: check `curriculum/SYLLABUS.md` first for
  which unit and textbook section covers it, then open the
  corresponding slide deck and/or textbook section.
- Prior tutoring context: `conversation_history/` has the transcripts
  from before this branch existed — read these (and
  `handover/HANDOVER.md`) to know what's already been taught, rather
  than restarting from zero.

## Maintenance

Update this file whenever the folder structure changes — new files, new
folders, new organization. A stale map is worse than no map.

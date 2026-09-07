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
│   ├── slides/            — 6 lecture decks (PDF), numbered 01-06 =
│   │                        study order (units 1-6). Each PDF has a
│   │                        same-name .md companion (e.g.
│   │                        01_..._number_systems_and_codes.md) —
│   │                        read the .md, not the PDF (see CLAUDE.md
│   │                        "Curriculum file formats"). The PDFs are
│   │                        image-based slide decks, expensive to
│   │                        render directly.
│   └── textbook/          — reference textbook (Brown & Vranesic,
│                             Fundamentals of Digital Logic with VHDL
│                             Design, 3rd ed.) — despite the .pdf
│                             extension this file is plain extracted
│                             text, directly readable/greppable as-is;
│                             no .md companion needed for it.
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
  opening a deck's `.md` companion. `curriculum/textbook/` is
  reference/background material only, cross-referenced by
  chapter/section from SYLLABUS.md — its own chapter numbering does not
  match the slides' numbering.
- Reading a slide deck's content: open its `.md` companion in
  `curriculum/slides/`, not the `.pdf`. The `.md` was extracted once
  (accurately, page by page) and is the read-optimized copy going
  forward — don't re-render the PDF unless there's a discrepancy, a gap
  noted in the `.md`, or Wifey asks to see the original directly.
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

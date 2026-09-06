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
├── curriculum/             — source lecture decks (image-based PDFs)
│   ├── 6_1Area_between_Curves.pdf              (12 slides)
│   ├── 6_2Volumes.pdf                          (26 slides)
│   ├── 6_3_Arc_Length.pdf                      (20 slides)
│   └── 6_4Area_of_asurface_of_revolution.pdf   (15 slides)
├── handover/
│   └── HANDOVER.md        — progress so far, current level, next steps
├── navigation/
│   └── NAVIGATION.md      — this file
└── transcript/
    └── session_2026-09-07.md — archived claude.ai chat where the
        curriculum files and repo setup were assembled; no teaching
        happened in it (session zero starts in HANDOVER.md instead)
```

## Navigation paths

- New session start: read `CLAUDE.md` → `handover/HANDOVER.md` → this
  file, in that order.
- Curriculum documents live in `curriculum/`, all image-based PDFs (text
  extraction garbles the math — read pages visually). They are Chapter 6,
  "Applications of Integration," taught in this order: 6.1 → 6.2 → 6.3 →
  6.4. 6.2 depends on 6.1 (region-between-curves setup); 6.4 depends on
  6.3 (both build on the same slicing/limit argument, arc length before
  surface area).

## What each curriculum file covers

- **6_1Area_between_Curves.pdf** (12 slides) — review of integration
  formulas/techniques (substitution, by parts, trig substitution, FTC2);
  area between two curves as `A = ∫[a,b] (top − bottom) dx`; finding
  intersection points to set bounds; 2 worked examples, 3 exercise
  slides.
- **6_2Volumes.pdf** (26 slides) — volume of a right cylinder (`V = Ah`);
  general slicing method for irregular solids (`V = ∫ A(x) dx` from
  cross-sectional area); disk method for solids of revolution (Examples
  1–3: sphere, `y=√x` about x-axis, `y=x³` about y-axis); washer method
  for revolving the region between two curves (Example 4); revolving
  about a general horizontal line, not just an axis (Example 5, about
  `y=2`); volumes of solids that are *not* solids of revolution, using
  non-circular cross-sections e.g. equilateral triangles (Example 6); 5
  exercise slides.
- **6_3_Arc_Length.pdf** (20 slides) — motivating the length of a curve
  via inscribed polygons and a limit as segments → ∞; derivation and
  statement of the arc length formula `L = ∫[a,b] √(1+(f'(x))²) dx` (and
  the `x=g(y)` version); 3 worked examples (semicubical parabola,
  parabola, circle circumference); the arc length *function* `s(x)`
  (Example 4) and its geometric interpretation via `(ds)² = (dx)² +
  (dy)²`; 1 exercise slide.
- **6_4Area_of_asurface_of_revolution.pdf** (15 slides) — motivating
  cases (lateral surface area of a cylinder and a cone) and the area of
  a frustum/band (`A = 2πrl`, r = average radius); general derivation
  using the same slicing/limit approach as arc length, arriving at
  `S = ∫[a,b] 2πf(x)√(1+(f'(x))²) dx` (and the y-axis version); 3 worked
  examples (sphere portion, parabola about y-axis, `y=eˣ` about x-axis);
  1 exercise slide.

## Progress and history

- `handover/HANDOVER.md` — current teaching progress, Wifey's level, and
  what's next. Read this every session.
- `transcript/session_2026-09-07.md` — archived setup chat, not a
  teaching record.

## Maintenance

Update this file whenever the folder structure changes — new files, new
folders, new organization. A stale map is worse than no map.

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
│   │                          + read-optimized .md companions (see
│   │                          CLAUDE.md's "Curriculum file formats" rule)
│   ├── 6_1Area_between_Curves.pdf / .md              (12 slides)
│   ├── 6_2Volumes.pdf / .md                          (26 slides)
│   ├── 6_3_Arc_Length.pdf / .md                      (20 slides)
│   ├── 6_4Area_of_asurface_of_revolution.pdf / .md   (15 slides)
│   ├── 7.1_Differential_equations.md                 (16 slides; no PDF in repo, see below)
│   ├── 7.2_Separable_equations_and_applications.md   (12 slides; no PDF in repo, see below)
│   ├── 7.3_Linear_equations.md                       (10 slides; no PDF in repo, see below)
│   ├── 7.4_Second-order_linear_Equations.md          (15 slides; no PDF in repo, see below)
│   ├── 7.5_Nonhomogeneous_linear_equations.md        (13 slides; no PDF in repo, see below)
│   ├── 8.1_Three-dimensional_coordinate_systems.md   (13 slides; no PDF in repo, see below)
│   ├── 8.2_Vectors.md                                (26 slides; no PDF in repo, see below)
│   ├── 8.3_Dot_Product.md                            (16 slides; no PDF in repo, see below)
│   ├── 8.4_Cross_Product.md                          (22 slides; no PDF in repo, see below)
│   ├── 8.5_Equations_of_Lines_and_Planes.md          (18 slides; no PDF in repo, see below)
│   ├── 8.6_Cylinders_and_Quadric_Surfaces.md         (21 slides; no PDF in repo, see below)
│   ├── 9.1_Functions_of_Several_Variables_1.md       (13 slides; no PDF in repo, see below)
│   ├── 9.2_Limits_and_Continuity.md                  (10 slides; no PDF in repo, see below)
│   ├── 9.3_Partial_Derivatives.md                    (16 slides; no PDF in repo, see below)
│   ├── 9.4_Chain_Rules.md                            (22 slides; no PDF in repo, see below)
│   ├── 9.5_Directional_Derivatives_and_the_Gradient_Vector.md  (25 slides; no PDF in repo, see below)
│   └── 9.6_Tangent_Plane_and_Differentials.md        (10 slides; no PDF in repo, see below)
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
- Curriculum documents live in `curriculum/`, as image-based PDFs (text
  extraction garbles the math) each with a `.md` companion transcribed by
  hand from a visual read. Per CLAUDE.md, read the `.md` for normal
  teaching use and only open the PDF for a discrepancy, a gap the `.md`
  missed, or when Wifey asks for the original specifically. They are
  Chapter 6, "Applications of Integration," taught in this order: 6.1 →
  6.2 → 6.3 → 6.4. 6.2 depends on 6.1 (region-between-curves setup); 6.4
  depends on 6.3 (both build on the same slicing/limit argument, arc
  length before surface area).
- The Chapter 7 files `7.1_Differential_equations.md` to
  `7.5_Nonhomogeneous_linear_equations.md`, the Chapter 8 files
  `8.1_Three-dimensional_coordinate_systems.md`, `8.2_Vectors.md`,
  `8.3_Dot_Product.md`, `8.4_Cross_Product.md`,
  `8.5_Equations_of_Lines_and_Planes.md` and
  `8.6_Cylinders_and_Quadric_Surfaces.md`, and the Chapter 9 files
  `9.1_Functions_of_Several_Variables_1.md` to
  `9.6_Tangent_Plane_and_Differentials.md` are the exception to the PDF + `.md`
  pairing: they are Chapters 7, 8 and 9 of the same course (read Chapter 7 in
  the order 7.1 to 7.5, each builds on the previous; Chapter 8 in the order 8.1
  to 8.6; Chapter 9 in the order 9.1 to 9.6, and 9.5 also uses the dot product
  from 8.3; no dependency on Chapter 6 beyond integration skills). Their original PDFs are deliberately not
  committed (every slide carries the university's logo and name, and the
  title slides name the lecturer; see CLAUDE.md's privacy rule), so there
  is no PDF to fall back to. If one of these `.md` files looks wrong, ask
  Wifey to resend the original.

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
- **7.1_Differential_equations.md** (16 slides, original PDF not in repo) —
  population model `dP/dt=kP` and its solution `Ce^{kt}`; differential
  equation, order, solution, general vs particular solution, initial
  condition and initial-value problem; Examples 1-4; 2 exercise slides.
  (Slide 9 writes polynomial terms in `x` though the variable is `θ`.)
- **7.2_Separable_equations_and_applications.md** (12 slides, original PDF
  not in repo) — separable equations `dy/dx=g(x)f(y)`: divide, multiply by
  `dx`, integrate both sides; Examples 1-4 (incl. an implicit solution, a
  `y=Ae^{x³/3}` case and a salt-tank mixing problem); 3 exercise slides
  (separable equations, a change of variable, integral equations).
- **7.3_Linear_equations.md** (10 slides, original PDF not in repo) —
  first-order linear equations `y'+P(x)y=Q(x)`; the integrating factor
  `I(x)=e^{∫P dx}` and why it works (product rule); Examples 1-3 (incl. an
  RL circuit); 2 exercise slides (is it linear; solve).
- **7.4_Second-order_linear_Equations.md** (15 slides, original PDF not in
  repo) — `Py''+Qy'+Ry=G`, homogeneous vs nonhomogeneous; superposition and
  linear independence; constant coefficients `ay''+by'+cy=0` via the
  characteristic equation `ar²+br+c=0` and its three root cases (distinct
  real, repeated, complex via Euler's formula); initial-value and
  boundary-value problems; Examples 1-6; summary table; 2 exercise slides.
- **7.5_Nonhomogeneous_linear_equations.md** (13 slides, original PDF not in
  repo) — `ay''+by'+cy=G(x)`, complementary equation, `y=y_p+y_c`; guessing
  `y_p` for polynomial, exponential and trigonometric `G`, sums of two
  right-hand sides, and the `e^{kx}P(x)` and `e^{kx}P(x)cos mx` cases;
  Examples 1-6 (a duplicate "Example 6" on slide 12); 1 exercise slide. (Slide
  6 has a wrong constant: `C` should be `-2`, noted in the `.md`; a teaching
  note on the resonance rule is added there too.)
- **8.1_Three-dimensional_coordinate_systems.md** (13 slides, original PDF
  not in repo) — recall of 2-D coordinates; 3-D axes and the right-hand
  rule; coordinate planes and octants; locating `(a,b,c)`, `R³`; planes
  `x=k`, `y=k`, `z=k`; the 3-D distance formula and its proof; spheres
  `(x−x0)²+(y−y0)²+(z−z0)²=r²`, completing the square to find a sphere's
  center and radius; Examples 1-4; 1 exercise slide. (Slide 12 has a
  `z≥0` vs "below the xy-plane" inconsistency, noted in the `.md`.)
- **8.2_Vectors.md** (26 slides, original PDF not in repo) — vector
  algebra, no calculus: definition (magnitude + direction), equal and zero
  vectors; combining vectors (displacements, Triangle Law, Parallelogram
  Law, scalar multiples, negatives, subtraction); components, position
  vectors, `AB = <x2−x1, y2−y1, z2−z1>`, standard basis i/j/k; length
  `|a| = √(ax²+ay²+az²)`; algebraic operations by components; unit vectors
  `a/|a|`; properties of vectors; Examples 1-7; 2 exercise slides.
- **8.3_Dot_Product.md** (16 slides, original PDF not in repo) — dot
  product `a·b = axbx+ayby+azbz` (a scalar) and its properties;
  `a·b = |a||b|cosθ` via the Law of Cosines; angle between vectors;
  orthogonality (`a·b=0`) and the sign of `a·b`; direction angles and
  direction cosines; scalar and vector projections `comp` / `proj`;
  Examples 1-8; 2 exercise slides. (Typos noted in the `.md`: slide 8's
  middle label, slide 11's `z` for `k`.)
- **8.4_Cross_Product.md** (22 slides, original PDF not in repo) — cross
  product `a×b` from the component formula and via a 3×3 determinant
  (determinants of order 2 and 3 are introduced on slide 3); `a×a=0`;
  `a×b` is orthogonal to `a` and `b` (slide 7) with the right-hand rule;
  `|a×b| = |a||b|sinθ`; parallel iff `a×b=0`; area of a parallelogram and a
  triangle; a normal vector of a plane through 3 points; `i×j=k` table,
  anti-commutativity and the other properties; scalar triple product;
  Examples 1-5; 2 exercise slides plus worked solutions on slides 18-21.
  (Typos noted in the `.md`: slide 4's `-24` should be `-21`; slide 19's
  `k`-component.)
- **8.5_Equations_of_Lines_and_Planes.md** (18 slides, original PDF not in
  repo) — a line in space: direction vector, parametric equations
  `x=x0+λa` etc., symmetric equations, special cases `a=0`; line through two
  points; a plane: point + normal vector, `A(x−x0)+B(y−y0)+C(z−z0)=0` and
  `Ax+By+Cz+D=0`; plane through 3 points via `PQ×PR`; parallel planes, angle
  between planes (angle between normals), line of intersection of two planes;
  distance from a point to a plane and between parallel planes; Examples 1-7;
  1 exercise slide (6 parts, plane equations).
- **8.6_Cylinders_and_Quadric_Surfaces.md** (21 slides, original PDF not in
  repo; many slides are 3-D pictures, only text/equations transcribed) —
  traces (cross-sections); cylinders (a missing variable means rulings along
  that axis); quadric surfaces: ellipsoid, cone, elliptic paraboloid,
  hyperboloid of one and two sheets, hyperbolic paraboloid, with their traces;
  recognizing a surface by completing the square (Example 6); Examples 1-6;
  exercises on slides 19-20 and a mixed review set on slide 21 (dot product,
  `comp`, unit vector, line through two points, distance between planes,
  plane containing a line).

- **9.1_Functions_of_Several_Variables_1.md** (13 slides, original PDF not in
  repo) — functions of two variables, domain, range, graph; Examples 1-3
  (evaluating, finding the domain, sketching graphs); functions of three and
  `n` variables. No exercise slide.
- **9.2_Limits_and_Continuity.md** (10 slides, original PDF not in repo) —
  limit of `f(x,y)` "along any path", different paths give different limits
  means no limit; continuity, polynomials and rational functions, composition;
  Examples 1-6; 1 exercise slide. (Slide 3, Example 1 is wrong: the limit is
  `0`, not "does not exist"; noted in the `.md`.)
- **9.3_Partial_Derivatives.md** (16 slides, original PDF not in repo) —
  `f_x`, `f_y` as limits and by holding the other variable constant, notation,
  geometric meaning as slopes of traces, three or more variables, second and
  higher derivatives, Clairaut's Theorem; Examples 1-5; 2 exercise slides
  (textbook problems 15-40 and 63-70).
- **9.4_Chain_Rules.md** (22 slides, original PDF not in repo) — chain rule
  Case 1 (one independent variable, with proof sketch), Case 2 and the general
  version with tree diagrams, implicit differentiation `dy/dx=-F_x/F_y` and
  `∂z/∂x=-F_x/F_z`; Examples 1-8; 2 exercise slides (14 and 22). (Slide 21
  prints `∂z/∂x` twice; noted in the `.md`.)
- **9.5_Directional_Derivatives_and_the_Gradient_Vector.md** (25 slides,
  original PDF not in repo) — directional derivative `D_u f=f_x a+f_y b`,
  the gradient `∇f` and `D_u f=∇f·u`, three variables, the maximum rate of
  change is `|∇f|` in the direction of `∇f`; Examples 1-8 posed without
  solutions on the slides. No exercise slide.
- **9.6_Tangent_Plane_and_Differentials.md** (10 slides, original PDF not in
  repo) — tangent plane `z-z0=f_x(x-x0)+f_y(y-y0)`, differentiability and the
  total differential `dz=f_x dx+f_y dy`; Examples 1-4 posed without solutions
  on the slides. No exercise slide. (Slide 9's Example 3(2) is garbled in the
  source; see the `.md`.)

## Progress and history

- `handover/HANDOVER.md` — current teaching progress, Wifey's level, and
  what's next. Read this every session.
- `transcript/session_2026-09-07.md` — archived setup chat, not a
  teaching record.

## Maintenance

Update this file whenever the folder structure changes — new files, new
folders, new organization. A stale map is worse than no map.

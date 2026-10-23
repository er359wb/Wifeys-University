# Chapter 22 — Gauss's Law

Read-optimized companion to `Chapter 22 (1).pdf` (126 lecture slides, dated
2026/10/10). Textbook: *University Physics* (Young & Freedman). `[sN]` = slide
number in the PDF. Equations in plain math; figures described in words.
`[slide typo: ...]` = an error on the slide, checked by recalculation.
No homework slide in this chapter's PDF.

## Objectives and outline [s2–3]

Objectives:
- Gauss's law uses symmetry to simplify electric-field calculations.
- Gauss's law relates the field at all points on an imaginary closed surface
  to the total charge enclosed by that surface.
- Deeper insight into charge distributions and electric fields.

Outline: 22.1 Charge and Electric Flux · 22.2 Calculating Electric Flux ·
22.3 Gauss's Law · 22.4 Applications of Gauss's Law · 22.5 Charges on
Conductors.

---

## 22.1 Charge and Electric Flux [s4–14]

- Setup: a closed box containing an unknown amount of charge [s4]. Probe it
  from outside with a test charge q0: measure the force F at many points to
  map E = F/q0 outside the box [s5–6]. From this 3-D map you can deduce the
  charge inside.
- Figures [s7–10]:
  - positive charge(s) inside → E vectors point **out** of the box —
    **outward flux**;
  - negative charge(s) inside → E vectors point **in** — **inward flux**.
- **No net charge inside → no net flux** [s11]. Three cases: (a) no charge
  inside, E = 0, zero flux; (b) +q and −q inside (zero *net* charge): inward
  flux cancels outward flux; (c) empty box next to a uniformly charged sheet
  (+σ): field enters one face and leaves the opposite face — inward flux
  cancels outward flux.
- **Electric flux** (box version) [s12]: for each face, multiply the average
  perpendicular component of E by the face's area; add over all faces.
  Net flux is proportional to the net enclosed charge and **independent of
  the box's size**.
- Figure [s13]: (a) +q in a box → outward flux; (b) same box with +2q → twice
  the flux; (c) box twice as big with +q → same flux as (a).

**Qualitative Gauss's law** [s14]:
1. Net outward vs inward flux depends on the **sign** of the enclosed charge.
2. Charges **outside** the surface give **no net flux** through it.
3. Net flux ∝ net enclosed charge, otherwise independent of the surface's
   size.

---

## 22.2 Calculating Electric Flux [s15–44]

### Fluid-flow analogy [s15–16]

Volume flow rate of fluid (velocity v) through a wire rectangle of area A:
(a) vA when the rectangle is perpendicular to v; (b) vA cos φ when tilted by
angle φ (only the projected area A⊥ = A cos φ counts). Replace v by E to get
electric flux.

### Flat surface, uniform field [s17–21]

**Vector area** A = A n̂, where n̂ is the unit vector perpendicular
(normal) to the surface.

- (a) Face-on (E parallel to A, φ = 0): Φ_E = E · A = EA
- (b) Tilted by φ: Φ_E = E · A = EA cos φ
- (c) Edge-on (φ = 90°): Φ_E = EA cos 90° = 0

      Φ_E = EA cos φ = E⊥ A = E · A    (uniform E, flat surface)

- SI unit of flux: N·m²/C.
- For a closed surface n̂ points **outward**: outward flux is **positive**,
  inward flux is **negative**.

### General definition [s22]

    Φ_E = ∫ E cos φ dA = ∫ E⊥ dA = ∫ E · dA     (22.5)

### Example 22.1 — Flux through a disk [s23–28]

Disk radius 0.10 m, normal n̂ at 30° to a uniform E of 2.0 × 10³ N/C. (An open
surface has no inside/outside, so the direction of n̂ must be specified.)

    A = π(0.10 m)² = 0.0314 m²
    (a) φ = 30°:  Φ_E = (2.0×10³)(0.0314) cos 30° = 54 N·m²/C
    (b) n̂ ⟂ E, φ = 90°:  Φ_E = 0
    (c) n̂ ∥ E, φ = 0:  Φ_E = (2.0×10³)(0.0314)(1) = 63 N·m²/C

(b) < (a) < (c) — more of the disk faces the field as φ → 0.

### Example 22.2 — Flux through a cube [s29–37]

Cube of side L in uniform E. Outward normals n̂1…n̂6 (figure: n̂1 faces
against E, n̂2 along E, n̂3/n̂4 sideways, n̂5 up, n̂6 down). Each face has area
L².

(a) Two faces perpendicular to E: angle between E and n̂1 is 180°, between E
and n̂2 is 0°.

    Φ1 = EL² cos 180° = −EL²       (E enters face 1)
    Φ2 = EL² cos 0°   = +EL²       (E leaves face 2)
    Φ3 = Φ4 = Φ5 = Φ6 = EL² cos 90° = 0
    total Φ = −EL² + EL² + 0 + 0 + 0 + 0 = 0

(b) Cube turned by angle θ: E enters faces 1 and 3 (negative), leaves faces 2
and 4 (positive).

    Φ1 = EL² cos(180° − θ) = −EL² cos θ
    Φ2 = +EL² cos θ
    Φ3 = EL² cos(90° + θ)  = −EL² sin θ
    Φ4 = EL² cos(90° − θ)  = +EL² sin θ
    Φ5 = Φ6 = 0
    total Φ = 0

A uniform field gives zero net flux through a closed surface containing no
charge.

### Example 22.3 — Flux through a sphere [s38–44]

Point charge q = +3.0 μC at the centre of a sphere of radius 0.20 m.

- Surface is curved and E isn't uniform → use the general definition. But on
  a centred sphere, E is everywhere outward and perpendicular to the surface,
  so E⊥ = E and E · dA = E dA; and E has the same magnitude everywhere on the
  sphere.

      E = q/(4πε0 r²) = (9.0×10⁹)(3.0×10⁻⁶)/(0.20)² = 6.75×10⁵ N/C
      Φ_E = ∫E dA = E ∫dA = E(4πr²) = (6.75×10⁵)(4π)(0.20)² = 3.4×10⁵ N·m²/C

- r² cancels (divided by r² for E, multiplied by r² for area) → same flux for
  a sphere of radius 2.0 m or 200 m. Flux through **any** surface enclosing a
  single point charge is independent of the surface's shape and size.
- (s43–44 repeat two bullets from Chapter 21.4: E doesn't depend on the
  charge of the body feeling the force; F0 = q0E is only for point charges.)

---

## 22.3 Gauss's Law [s45–58]

**Statement**: the total electric flux through any **closed** surface (a
surface enclosing a definite volume) is proportional to the total (net)
charge inside the surface.

### Derivation for a point charge [s45–53]

- Sphere of radius R centred on q: E = (1/4πε0) q/R², perpendicular to the
  surface and the same everywhere on it. Area 4πR².

      Φ_E = EA = (1/4πε0)(q/R²)(4πR²) = q/ε0      (22.6)

- Independent of R; depends only on the enclosed q.
- Field-line view [s48–49, figure]: spheres of radius R and 2R around q.
  Every field line through the small sphere also crosses the big one. An area
  element dA on the small sphere projects to 4 dA on the big sphere (each
  length doubles), but E there is 1/4 as strong → same flux through both
  elements.
- Irregular surface [s50–53]: split into elements dA; flux E dA cos φ, where
  φ is the angle between the outward normal and E. The projection of dA onto
  a sphere around q is dA cos φ, so each element carries the same flux as its
  projection on the sphere → total = q/ε0.

      Φ_E = ∮ E · dA = q/ε0      (22.7)

- Holds for **any shape or size** of closed surface enclosing q. The circle
  on ∮ means integration over a **closed** surface.

### Signs and outside charges [s54–55]

- Flux is positive where E points out of the surface, negative where it
  points in (E⊥ positive outward, negative inward).
- Field lines can begin or end inside a region only if there is charge in
  that region.
- A point charge **outside** a closed surface: every field line that enters
  the surface also leaves it → net flux zero (figure: bean-shaped surface
  near +q).

### General form [s56–58]

E at each dA is the total field (vector sum from all charges, inside and
outside). Q_encl = total charge enclosed.

    Φ_E = ∮ E cos φ dA = ∮ E⊥ dA = ∮ E · dA = Q_encl/ε0     (Gauss's law, 22.8)

The total flux through a closed surface equals the net enclosed charge
divided by ε0. The closed surface is **imaginary** — no material object has
to be there. It is called a **Gaussian surface**.

### Example 22.4 — Flux and enclosed charge [s59–66]

Field of a dipole (+q and −q). Figure [s60]: field lines from +q to −q;
surface A encloses only +q, B only −q, C encloses both, D encloses neither
(a small surface beside +q). The net number of field lines leaving a closed
surface is proportional to the charge enclosed.

    A: Q_encl = +q → Φ_E = +q/ε0
    B: Q_encl = −q → Φ_E = −q/ε0
    C: Q_encl = 0  → Φ_E = 0
    D: Q_encl = 0  → Φ_E = 0

No integration needed. [slide typo: s66 writes q/ε; should be q/ε0]

---

## 22.4 Applications of Gauss's Law [s67–99]

- Gauss's law holds for any charge distribution and any closed surface.
- Know the charge distribution + enough symmetry → find the field.
- Know the field → find the charge distribution (e.g. charges on
  conductors).
- **Electrostatic conditions** (charges not moving): any excess charge on a
  solid conductor resides **entirely on its surface** [s68; figure: Gaussian
  surface A just inside the conductor's surface; E = 0 there, so no charge
  inside it].

### Example 22.5 — Charged conducting sphere [s69–73]

Charge +q on a solid conducting sphere of radius R. Find E inside and
outside.

- All charge is on the surface; spherical symmetry (a rotated sphere looks
  the same). Gaussian surface: a concentric sphere of radius r.
- Inside (r < R): the Gaussian sphere encloses no charge → E = 0.
- Outside (r > R): E = (1/4πε0) q/r² — as if all charge were at the centre.
- Graph [s70]: E = 0 from r = 0 to R; jumps to E(R) = (1/4πε0) q/R² at the
  surface; then falls as 1/r² (E(R)/4 at 2R, E(R)/9 at 3R).
- As R → 0 it becomes a point charge, E = q/4πε0r² everywhere.

(The slides show the result and graph; the algebra steps are not written
out.)

### Example 22.6 — Infinite line charge [s74–78]

Infinitely long thin wire, uniform charge per length λ (positive). (Good
approximation for a finite wire when the field point is much closer to the
wire than its length.)

- Cylindrical symmetry; E points radially away from the wire.
- Gaussian surface: coaxial cylinder, radius r, length l, ends perpendicular
  to the wire [s76 figure]. On the ends E⊥ = 0 (no flux); on the curved side
  E⊥ = E.

      Φ_E = E(2πrl) = λl/ε0   →   E = (1/2πε0) λ/r     (infinite line of charge)

- All the charge on the wire produces the field, but only the charge
  **inside** the Gaussian surface (λl) enters Gauss's law.

### Example 22.7 — Infinite plane sheet [s79–83]

Thin flat infinite sheet, uniform surface charge density σ (positive).

- Planar symmetry. Gaussian surface: cylinder with axis perpendicular to the
  sheet, end areas A, sheet through its middle. E is perpendicular to the
  sheet → parallel to the curved wall (no flux there); flux EA through each
  end.

      2EA = σA/ε0   →   E = σ/(2ε0)     (infinite sheet)

- E is **uniform** (independent of distance) and perpendicular to the sheet:
  field lines straight, parallel, perpendicular to the sheet.
- Good approximation for a finite sheet at points close to it and away from
  its edges.

### Example 22.8 — Oppositely charged parallel conducting plates [s84–90]

Two large parallel conducting plates with +σ and −σ. Find E between them.

- Figure [s85]: (a) realistic — field between plates nearly uniform, from +
  to −, with "fringing" at the edges; (b) idealized — fringing ignored. Most
  charge sits on the facing (inner) surfaces because opposite charges
  attract; charge on the outer surfaces is negligible for plates large
  compared with their separation.
- Gaussian cylinders S1–S4, each with one end inside a plate (where E = 0).
  For S1: left end inside plate 1 (+) → no flux; right end between the plates
  → flux +EA; side walls parallel to E → no flux. Enclosed charge σA.

      EA = σA/ε0   →   E = σ/ε0     (between oppositely charged plates)

- "Surfaces S2, S3, and S4 can be analyzed similarly." [s89] The slide also
  says the result can be obtained by superposing the plates' fields and
  verified with Gauss's law [s90].

### Example 22.9 — Uniformly charged insulating sphere [s91–95]

Charge Q spread uniformly through the volume of an insulating sphere of
radius R. Find E at distance r from the centre.

- Spherical symmetry; Gaussian surface: concentric sphere of radius r;
  Φ_E = 4πr²E. The enclosed charge depends on r.
- Inside (r < R): E ∝ r; E = (1/4πε0) Qr/R³; E = 0 at the centre.
- Outside (r > R): E = (1/4πε0) Q/r² — varies as 1/r².
- Graph [s92]: E rises linearly from 0 to E(R) = (1/4πε0) Q/R² at r = R,
  then falls as 1/r². Compare with the conducting sphere (E = 0 inside).
- For **any** spherically symmetric charged body, E outside = as if all the
  charge were at the centre.

### Example 22.10 — Hollow charged sphere [s96–99]

Thin hollow sphere, radius 0.250 m, unknown uniform surface charge. At
r = 0.300 m from the centre, E points **toward** the centre with magnitude
1.80 × 10² N/C. Find the charge.

- Spherical Gaussian surface through r = 0.300 m. E points inward → charge is
  negative.

      q = −E(4πε0 r²) = −(1.80×10² N/C)(4π)(8.854×10⁻¹²)(0.300 m)² = −1.80×10⁻⁹ C = −1.80 nC

- Only possible because the symmetry gives E at every point of the Gaussian
  surface. For irregular distributions Gauss's law isn't very useful for this.

---

## 22.5 Charges on Conductors [s100–121]

Figures [s100–102]:
- (a) Solid conductor with charge q_C: the charge sits entirely on the
  surface; electrostatic, so E = 0 inside the conductor.
- (b) Same conductor with an empty internal cavity: Gaussian surface A inside
  the conducting material around the cavity; E = 0 everywhere on it → no net
  charge on the cavity wall.
- (c) Isolated charge q placed in the cavity: for E to be zero on Gaussian
  surface A, the cavity surface must carry total charge **−q**. The outer
  surface then carries **q_C + q**.

[s103–104] If the conductor was originally uncharged: −q on the cavity wall,
+q on the outer surface. If it originally had q_C: outer surface has q + q_C.

### Example 22.11 — Conductor with a cavity [s105–108]

Conductor carries total charge +3 nC; insulated charge −5 nC sits in the
cavity. No excess charge in the bulk — only on the inner and outer surfaces.

- Cavity charge q = −5 nC → inner (cavity) surface: −q = **+5 nC**.
- Total on conductor +3 nC → outer surface: 3 nC − 5 nC = **−2 nC**.

### Tests of Gauss's law [s109–111]

- **Faraday's ice-pail experiment** [s109]: (a) charged conducting ball on an
  insulating thread above a metal container on an insulating stand; (b) ball
  lowered inside with the metal lid on — it induces charges on the interior
  and exterior of the container; (c) once the ball touches the container it
  becomes part of the interior surface, and all its charge moves to the
  container's exterior.
- **Modern version** [s110]: an outer spherical shell is alternately charged
  and discharged by a power supply; any flow of charge between inner and
  outer shells would be detected by an electrometer inside the inner shell.
- **Van de Graaff generator** [s111] (accelerator / demonstrations): a belt
  carries charge up an insulating support; the electron sink at the bottom
  draws electrons from the belt, giving it positive charge; at the top the
  belt attracts electrons away from the conducting shell, giving the shell a
  positive charge.

### Field at the surface of a conductor [s112–113]

Small Gaussian cylinder through the surface: end of area A just outside, E
inside the conductor is zero. Flux = E⊥A, enclosed charge σA:

    E⊥ A = σA/ε0   →   E⊥ = σ/ε0     (22.10, field at the surface of a conductor)

The field just outside a charged conductor is **perpendicular** to the
surface.

### Example 22.12 — Check for a conducting sphere [s114–115]

Just outside: E = (1/4πε0) q/R². Surface density σ = q/(4πR²). Then
σ/ε0 = q/(4πε0R²) = E, as Eq. 22.10 says.

### Example 22.13 — Electric field of the earth [s116–121]

The earth (a conductor) has net charge; near the surface E ≈ 150 N/C, pointing
toward the centre. Find (a) σ, (b) total surface charge.

(a) E points into the surface → E⊥ negative → σ negative.

    σ = ε0 E⊥ = (8.85×10⁻¹² C²/N·m²)(−150 N/C) = −1.33×10⁻⁹ C/m² = −1.33 nC/m²

(b) Earth's radius R_E = 6.38 × 10⁶ m.

    Q = 4πR_E² σ = 4π(6.38×10⁶)²(−1.33×10⁻⁹) = −6.8×10⁵ C = −680 kC
    (or Q = 4πε0 R_E² E⊥ = (6.38×10⁶)²(−150)/(9.0×10⁹) = −6.8×10⁵ C)

Electron charge −1.60 × 10⁻¹⁹ C → about 7 moles of excess electrons, balanced
by an electron deficiency in the upper atmosphere, so earth + atmosphere is
neutral.

---

## Concept summary [s122–126]

- **Electric flux**: a measure of the "flow" of E through a surface; the
  perpendicular component of E times area, integrated:
  Φ_E = ∫E cos φ dA = ∫E⊥ dA = ∫E · dA.
- **Gauss's law**: total flux through a closed surface = Q_encl/ε0.
  Logically equivalent to Coulomb's law, but much simpler for highly
  symmetric problems.
- Excess charge at rest on a solid conductor resides entirely on its
  surface, and E = 0 everywhere in the conductor's material.

### Fields of symmetric charge distributions [s125–126] (magnitudes)

| Charge distribution | Point | E |
|---|---|---|
| Single point charge q | distance r | (1/4πε0) q/r² |
| Charge q on a conducting sphere, radius R | outside, r > R | (1/4πε0) q/r² |
| | inside, r < R | 0 |
| Infinite wire, charge per length λ | distance r | (1/2πε0) λ/r |
| Infinite conducting cylinder, radius R, charge per length λ | outside, r > R | (1/2πε0) λ/r |
| | inside, r < R | 0 |
| Solid insulating sphere, radius R, charge Q uniform through volume | outside, r > R | (1/4πε0) Q/r² |
| | inside, r < R | (1/4πε0) Qr/R³ |
| Infinite sheet, uniform charge per area σ | any point | σ/2ε0 |
| Two oppositely charged conducting plates, +σ and −σ | between the plates | σ/ε0 |
| Charged conductor | just outside | σ/ε0 |

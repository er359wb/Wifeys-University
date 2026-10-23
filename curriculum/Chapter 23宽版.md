# Chapter 23 — Electric Potential

Read-optimized companion to `Chapter 23宽版.pdf` (144 lecture slides, dated
2026/10/10; 宽版 = "wide version", i.e. widescreen slides). This is the full
Chapter 23 deck. `Chapter 23宽版1009 (1).pdf` is identical to slides 1–37 of
this file. Textbook: *University Physics* (Young & Freedman). `[sN]` = slide
number in the PDF. Equations in plain math; figures described in words.
`[slide typo: ...]` = an error on the slide, checked by recalculation.

## Objectives and outline [s2–3]

Objectives: work done on a charged particle in an electric field; the
concept of electric potential; potential difference between one point and
another.

Outline: 23.1 Electric Potential Energy · 23.2 Electric Potential ·
23.3 Calculating Electric Potential · 23.4 Equipotential Surfaces ·
23.5 Potential Gradient.

---

## 23.1 Electric Potential Energy [s4–37]

- When a **conservative** force moves a particle from a to b, its work can be
  written through a potential energy U:

      W(a→b) = Ua − Ub = −(Ub − Ua) = −ΔU      (23.2, work done by a conservative force)

### Uniform field [s5–8]

- Figure [s5]: parallel plates, + plate on top, − plate on the bottom
  (y = 0), E pointing down, separation d. A positive test charge q0 feels a
  constant force F = q0E (down) wherever it is.
- The force is constant, and the work it does is **independent of the
  path**:

      W(a→b) = −(Ub − Ua) = qE(ya − yb)
      (moving from the top plate a to the bottom b: W = −ΔU = q0Ed)

  So U = q0Ey (Eq. 23.5, used later in Example 23.9).
- Four cases [s6–7]:
  - positive charge moves **along** E → field does **positive** work → U
    **decreases**;
  - positive charge moves **against** E → field does **negative** work → U
    **increases**;
  - negative charge moves along E → field does negative work → U increases;
  - negative charge moves against E → field does positive work → U
    decreases.
- The idea isn't limited to uniform fields: it works for a point charge in
  any field from a static charge distribution [s8]. Figure [s9]: test charge
  q0 moves along a radial line away from q, from distance ra to rb.

### Two point charges [s10–13]

- The work done by the electric force between a and b is the **same for all
  paths** [s10, figure: arbitrary curved path from a to b near q; only the
  radial part dr of each step dl contributes].

      U = (1/4πε0) q q0 / r      (23.9, potential energy of two point charges)

- U is always measured from a reference point where U = 0 (here: U = 0 when
  the charges are infinitely far apart).
- U is a **shared property** of the two charges — it comes from their
  interaction.
- Graph [s13]:
  - (a) q and q0 the **same sign**: U > 0; as r → 0, U → +∞; as r → ∞, U → 0.
  - (b) **opposite signs**: U < 0; as r → 0, U → −∞; as r → ∞, U → 0.

### Example 23.1 — Conservation of energy with electric forces [s14–29]

Positron: m = 9.11 × 10⁻³¹ kg, charge +e = +1.6 × 10⁻¹⁹ C. Alpha particle:
charge +2e = 3.2 × 10⁻¹⁹ C, over 7000× heavier → treat as at rest. At
ra = 1.00 × 10⁻¹⁰ m the positron moves directly away at 3.00 × 10⁶ m/s.
- (a) Speed at 2.00 × 10⁻¹⁰ m?
- (b) Speed very far away?
- (c) What changes if the moving particle is an electron (same mass,
  opposite charge)?

Electric force is conservative → mechanical energy conserved:
Ka + Ua = Kb + Ub (23.3), with U from Eq. 23.9. So Kb = Ka + Ua − Ub.

(a)

    Ka = ½mva² = ½(9.11×10⁻³¹)(3.00×10⁶)² = 4.10×10⁻¹⁸ J
    Ua = (9.0×10⁹)(3.20×10⁻¹⁹)(1.60×10⁻¹⁹)/(1.00×10⁻¹⁰) = 4.61×10⁻¹⁸ J
    Ub = (9.0×10⁹)(3.20×10⁻¹⁹)(1.60×10⁻¹⁹)/(2.00×10⁻¹⁰) = 2.30×10⁻¹⁸ J
    Kb = 4.10×10⁻¹⁸ + 4.61×10⁻¹⁸ − 2.30×10⁻¹⁸ = 6.41×10⁻¹⁸ J
    vb = √(2Kb/m) = √(2(6.41×10⁻¹⁸)/(9.11×10⁻³¹)) = 3.8×10⁶ m/s

[slide typos: s19/s21/s23 write the mass as 9.11×10³¹ kg — should be
9.11×10⁻³¹ kg; s19–20 write the charges as 3.20×10⁻⁹ C and 1.60×10⁹ C —
should be 3.20×10⁻¹⁹ C and 1.60×10⁻¹⁹ C. The results above use the correct
values and match the slides' answers.]

Repulsive force → the positron speeds up as it moves away.

(b) rb → ∞, Ub → 0:

    Kb = 4.10×10⁻¹⁸ + 4.61×10⁻¹⁸ − 0 = 8.71×10⁻¹⁸ J
    vb = √(2(8.71×10⁻¹⁸)/(9.11×10⁻³¹)) = 4.4×10⁶ m/s

From 2.00 × 10⁻¹⁰ m to infinity the speed rises only ~16%, because the
electric force drops off quickly with distance.

(c) Electron: force is attractive → it slows down. Both U values become
negative.

    at rb = 2.00×10⁻¹⁰ m:
    Kb = 4.10×10⁻¹⁸ + (−4.61×10⁻¹⁸) − (−2.30×10⁻¹⁸) = 1.79×10⁻¹⁸ J
    vb = √(2Kb/m) = 2.0×10⁶ m/s

    at rb = ∞:
    Kb = 4.10×10⁻¹⁸ + (−4.61×10⁻¹⁸) − 0 = −5.1×10⁻¹⁹ J

Kinetic energy can never be negative → the electron **never reaches
infinity**; the attraction stops it at a finite distance (set Kb = 0 to find
where — textbook Exercise 23.8).

Compare with the U graph [s13]: in (a)/(b) the charges have the same sign
and rb > ra, so Ub < Ua. In (c) opposite signs and rb > ra, so Ub > Ua (less
negative).

### Several charges [s30–31]

    U = (q0/4πε0)(q1/r1 + q2/r2 + q3/r3 + ...) = (q0/4πε0) Σ qi/ri     (23.10)

(point charge q0 with a collection of charges qi; ri = distance from q0 to
qi). Total E is the vector sum of the individual fields; total work is the
sum of individual contributions. Every electric field due to a **static**
charge distribution exerts a **conservative** force.

### Example 23.2 — A system of point charges [s32–37]

q1 = −e at x = 0, q2 = +e at x = a. (a) Work an external force must do to
bring q3 = +e from infinity to x = 2a. (b) Total potential energy of the
three-charge system.

(a) Work needed = U of q3 at x = 2a minus U at infinity (zero).
r13 = 2a, r23 = a:

    W = U = (q3/4πε0)(q1/r13 + q2/r23) = (+e/4πε0)(−e/2a + e/a) = +e²/(8πε0 a)

Brought in along +x, q3 is attracted by q1 but repelled more strongly by q2
(closer) → positive work is needed.

(b)

    U = (1/4πε0) Σ(i<j) qi qj / rij = (1/4πε0)(q1q2/r12 + q1q3/r13 + q2q3/r23)
      = (1/4πε0)[(−e)(e)/a + (−e)(e)/2a + (e)(e)/a] = −e²/(8πε0 a)

Negative → lower energy than with all three infinitely apart: assembling
them takes negative external work; pulling them apart again takes positive
work.

---

## 23.2 Electric Potential [s38–78]

- **Potential** = potential energy **per unit charge**. SI unit: **volt (V)**
  (1 V = 1 J/C).
- Vab (potential of a with respect to b) = work done **by the electric force**
  when a unit charge moves from a to b = work that must be done **against**
  the electric force to move a unit charge slowly from b to a.
- In circuits, potential difference is often called **voltage**.

      V = U/q0 = (1/4πε0) q/r                (23.14, point charge)
      V = U/q0 = (1/4πε0) Σ qi/ri            (23.15, collection of point charges)
      V = (1/4πε0) ∫ dq/r                    (23.16, continuous distribution)

- From the field [s42]: W(a→b) = ∫a→b F · dl = ∫a→b q0E · dl. Divide by q0:

      Va − Vb = ∫a→b E · dl = ∫a→b E cos φ dl     (23.17)

- Figure [s43]: (a) positive point charge — V **increases** moving inward,
  **decreases** moving outward (along E); (b) negative point charge — V
  decreases moving inward, increases moving outward. Moving in the direction
  of E always means V decreases.

### Electron volts [s44–45]

Charge q moving from potential Vb to Va: Ua − Ub = q(Va − Vb) = qVab.
With q = e = 1.602 × 10⁻¹⁹ C and Vab = 1 V:

    1 eV = 1.602×10⁻¹⁹ J

Multiples: meV, keV, MeV, GeV, TeV.

### Example 23.3 — Electric force and electric potential [s46–53]

Proton (+e = 1.602 × 10⁻¹⁹ C) moves in a straight line from a to b in a
linear accelerator, d = 0.50 m. Uniform E = 1.5 × 10⁷ V/m = 1.5 × 10⁷ N/C,
from a toward b. Find (a) force, (b) work by the field, (c) Va − Vb.
[slide typo: s46 writes N/V; should be N/C]

(a) Force along E:

    F = qE = (1.602×10⁻¹⁹)(1.5×10⁷) = 2.4×10⁻¹² N

(b) Constant force along the displacement:

    W = Fd = (2.4×10⁻¹²)(0.50) = 1.2×10⁻¹² J
      = 1.2×10⁻¹² J × (1 eV / 1.602×10⁻¹⁹ J) = 7.5×10⁶ eV = 7.5 MeV

(c) Potential difference = work per unit charge (Eq. 23.13):

    Va − Vb = W/q = 1.2×10⁻¹² J / 1.602×10⁻¹⁹ C = 7.5×10⁶ J/C = 7.5×10⁶ V = 7.5 MV

Shortcut: work is 7.5 × 10⁶ eV on a charge e → (7.5 × 10⁶ eV)/e = 7.5 × 10⁶ V.
Check via Eq. 23.17 with φ = 0: Va − Vb = ∫E dl = E∫dl = Ed =
(1.5 × 10⁷ V/m)(0.50 m) = 7.5 × 10⁶ V.

### Example 23.4 — Potential of two point charges [s54–60]

Same dipole as Example 21.9: q1 = +12 nC, q2 = −12 nC, 10 cm apart (Fig.
23.13: a between them, 6.0 cm from q1 and 4.0 cm from q2; b 4.0 cm left of
q1, 14.0 cm from q2; c 13.0 cm from each). Compute V at a, b, c using the
**algebraic** (scalar) sum V = (1/4πε0) Σ qi/ri.

    a: q1 → (9.0×10⁹)(12×10⁻⁹)/0.060 = +1800 V
       q2 → (9.0×10⁹)(−12×10⁻⁹)/0.040 = −2700 V
       Va = 1800 + (−2700) = −900 V
    b: q1 → +2700 V,  q2 → −770 V,  Vb = 1930 V
    c: q1 → (9.0×10⁹)(12×10⁻⁹)/0.13 = +830 V,  q2 → −830 V,  Vc = 0

[slide typo: s59 divides by 0.060 m for point c; should be 0.13 m, which
gives the 830 V shown]

V is also zero at infinity. Potential (a scalar) is much easier to compute
than the field (a vector) — use it whenever possible.

### Example 23.5 — Potential and potential energy [s61–65]

U of a +4.0 nC point charge placed at a, b, c above. U = qV:

    Ua = (4.0×10⁻⁹)(−900) = −3.6×10⁻⁶ J
    Ub = (4.0×10⁻⁹)(1930) = 7.7×10⁻⁶ J
    Uc = 0

(U and V zero at infinity.) No net work is done moving the 4.0 nC charge from
c to infinity by any path. Along the perpendicular bisector E is
perpendicular to the path (Example 21.9), so the force does no work there.

### Example 23.6 — Potential by integration [s66–71]

Find V at distance r from point charge q by integrating E (Eq. 23.17). Let a
be at r and b at infinity, with V = 0 at infinity (Fig. 23.14). Choose a
straight radial path: dl is radial with magnitude dr. For q > 0, E ∥ dl,
φ = 0:

    V − 0 = ∫r→∞ E · dl = ∫r→∞ E dr = ∫r→∞ q/(4πε0 r²) dr
          = [−q/(4πε0 r)] from r to ∞ = 0 − (−q/4πε0 r) = q/(4πε0 r)

Agrees with Eq. 23.14. For q < 0: E points inward while dl points outward
(φ = 180°, a minus sign), and |E| = |q|/4πε0r² (another minus sign) — they
cancel, so the result holds for either sign. Alternatively use the vector
field E = (1/4πε0)(q/r²) r̂ with dl = r̂ dr: r̂ · r̂ = 1 gives the same
integral.

### Example 23.7 — Moving through a potential difference [s72–78]

Dust particle m = 5.0 × 10⁻⁹ kg = 5.0 μg, charge q0 = 2.0 nC, starts from
rest at a and moves in a straight line to b. Figure: +3.0 nC, then a 1.0 cm
to its right, then b another 1.0 cm right, then −3.0 nC another 1.0 cm
right. Find the speed at b.

- The force changes as the particle moves → use energy, not forces. Only the
  conservative electric force acts: Ka + Ua = Kb + Ub, Ka = 0, Kb = ½mv²,
  U = q0V.

      0 + q0Va = ½mv² + q0Vb   →   v = √(2q0(Va − Vb)/m)

      Va = (9.0×10⁹)[3.0×10⁻⁹/0.010 + (−3.0×10⁻⁹)/0.020] = 1350 V
      Vb = (9.0×10⁹)[3.0×10⁻⁹/0.020 + (−3.0×10⁻⁹)/0.010] = −1350 V
      Va − Vb = 1350 − (−1350) = 2700 V
      v = √(2(2.0×10⁻⁹)(2700)/(5.0×10⁻⁹)) = 46 m/s

- Makes sense: the positive particle speeds up moving away from + and toward
  −. Units: 1 V = 1 J/C, so the top of the fraction is in J = kg·m²/s².
- Same method gives the speed of an electron accelerated through 500 V
  (oscilloscope) or 20 kV (TV tube).

---

## 23.3 Calculating Electric Potential [s79–112]

Two routes:
- Know the **charge distribution** → V = U/q0 = (1/4πε0) Σ qi/ri or
  V = (1/4πε0) ∫ dq/r.
- Know **E as a function of position** → Va − Vb = ∫a→b E · dl =
  ∫a→b E cos φ dl, with V = 0 at some convenient place.

Some problems need both. Moral: whenever possible use an **energy approach**
(potential, potential energy) rather than a dynamics approach (fields,
forces) — scalars are easier than vectors.

### Example 23.8 — Charged conducting sphere [s81–85]

Solid conducting sphere, radius R, total charge q. Find the potential (the
slide says "potential energy") everywhere. Uses E from Example 22.5.

- Outside: field is as if q were a point charge at the centre; V = 0 at
  infinity → V = (1/4πε0) q/r. At the surface: V_surface = q/(4πε0R).
- Inside: E = 0 everywhere → no work moving a test charge between any two
  inside points → V is the **same everywhere inside**, equal to q/(4πε0R).
- Graph [s85]: E = 0 inside, jumps to (1/4πε0)q/R² at the surface, falls as
  1/r² outside. V is flat at (1/4πε0)q/R inside and falls as 1/r outside.
  Moving outward (along E, for q > 0), V decreases.

### Example 23.9 — Oppositely charged parallel plates [s86–93]

Find V at height y between the plates of Section 23.1 (Fig. 23.18: bottom
plate b at y = 0, top plate a at y = d, E downward from the top plate).

- U = q0Ey (Eq. 23.5), so

      V(y) = U(y)/q0 = q0Ey/q0 = Ey     (V = 0 at b, y = 0)

  Even if V at b isn't zero, V(y) − Vb = Ey.
- V decreases from the upper to the lower plate (along E). At a (y = d):

      Va − Vb = Ed   →   E = (Va − Vb)/d = Vab/d

  Vab = potential of the positive plate relative to the negative plate. For
  a given Vab, smaller d → larger E.
- Holds **only for this planar geometry**, not for concentric cylinders or
  spheres where E isn't uniform.
- With E = σ/ε0 between oppositely charged plates (Example 22.8):

      σ = ε0Vab/d

  So σ on the positive plate ∝ Vab and can be found by measuring Vab (no
  instrument reads σ directly). The negative plate has −σ.
  [slide typo: s92 writes "+σ and +σ"; should be +σ and −σ]

### Example 23.10 — Infinite line charge or charged conducting cylinder [s94–101]

Very long line with charge per length λ. Find V at distance r.

- Already know E = (1/2πε0) λ/r, radial only (Examples 21.11 and 22.6), so
  integrate E (Eq. 23.17). E · dl = Er dr:

      Va − Vb = ∫a→b Er dr = (λ/2πε0) ln(rb/ra)

- Taking b at infinity with Vb = 0 gives Va = (λ/2πε0) ln(∞/ra) = ∞ — not
  useful, because the charge itself extends to infinity.
- Instead set V = 0 at an arbitrary distance r0:

      V = (λ/2πε0) ln(r0/r)

- For λ > 0, V decreases as r increases (moving along E).
- Same E applies outside a long charged **conducting cylinder** of radius R
  (Fig. 23.19b). Choosing r0 = R (V = 0 at the surface), for r > R:
  V = (λ/2πε0) ln(R/r). Inside, E = 0 and V equals its surface value (zero).
  (The slide writes this as ln(r0/r) with r0 taken to be the cylinder
  radius R.)

### Example 23.11 — Ring of charge [s102–107]

Thin ring, radius a, total charge Q uniformly spread. Find V at P on the axis,
distance x from the centre.

- Could integrate E from Example 21.10, but it's far easier to integrate over
  the charge (Eq. 23.16): **every** element dq is the same distance
  r = √(x² + a²) from P, so 1/r comes out of the integral.

      V = (1/4πε0) ∫ dq/r = (1/4πε0)(1/√(x² + a²)) ∫ dq = (1/4πε0) Q/√(x² + a²)

- Scalar — no components needed; much simpler than finding E.
- x ≫ a: V ≈ Q/(4πε0 x) — looks like a point charge from far away.
- Same result by integrating Ex from Example 21.10 (textbook Problem 23.67).

### Example 23.12 — Line of charge (rod) [s108–112]

Charge Q spread uniformly along a thin rod of length 2a (from y = −a to
y = +a). Find V at P on the perpendicular bisector, distance x from the
centre.

- Element dy carries dQ = (Q/2a) dy at distance √(x² + y²) from P:

      dV = (1/4πε0)(Q/2a) dy/√(x² + y²)
      V  = (1/4πε0)(Q/2a) ∫(−a→a) dy/√(x² + y²)
         = (1/4πε0)(Q/2a) ln[ (√(a² + x²) + a) / (√(a² + x²) − a) ]

  (integral from a table).
- Check: as x → ∞, V → 0 (left to the reader on the slide). Simpler than
  finding E because V is a scalar.

---

## 23.4 Equipotential Surfaces [s113–118]

- **Equipotential surface**: a 3-D surface on which V is the same at every
  point.
- **Field lines and equipotential surfaces are always perpendicular.**
- With all charges at rest, a **conductor's surface is always an
  equipotential**, and E just outside it is perpendicular to the surface.
- Analogy [s114]: contour lines on a topographic map = curves of constant
  elevation = constant gravitational potential energy.
- Figure [s115] (equal potential differences between adjacent surfaces):
  (a) single positive charge — concentric spheres (+30, +50, +70 V toward the
  charge); (b) dipole — V = 0 on the plane midway, positive near +, negative
  near −; (c) two equal positive charges.
- Figure [s116]: charged sphere near a flat conductor — field lines meet the
  conducting surface at right angles.
- Why E must be perpendicular at a conductor's surface [s117]: if E had a
  tangential component E∥, a charge could be moved around a loop (along the
  surface, back through the conductor where E = 0) with net work done —
  impossible because the electric force is conservative.
- Cavity in a conductor [s118]: if the cavity contains no charge, every point
  in it is at the same potential, E = 0 everywhere in the cavity, and there is
  no charge anywhere on the cavity's surface.

---

## 23.5 Potential Gradient [s119–132]

    Ex = −∂V/∂x,   Ey = −∂V/∂y,   Ez = −∂V/∂z            (23.19)
    E = −( î ∂V/∂x + ĵ ∂V/∂y + k̂ ∂V/∂z )                (23.20, E in terms of V)

For a radially symmetric V, the radial component is Er = −∂V/∂r (Eq. 23.23).

### Example 23.13 — Potential and field of a point charge [s121–125]

V = q/(4πε0 r). By symmetry E is radial:

    Er = −∂V/∂r = −∂/∂r (q/4πε0r) = q/(4πε0 r²)
    E  = r̂ Er = (1/4πε0)(q/r²) r̂      (agrees with Eq. 21.7)

Alternative without using symmetry: r = √(x² + y² + z²),

    ∂V/∂x = ∂/∂x [q/(4πε0 √(x² + y² + z²))] = −qx/(4πε0 r³)
    similarly ∂V/∂y = −qy/(4πε0 r³), ∂V/∂z = −qz/(4πε0 r³)
    E = q(x î + y ĵ + z k̂)/(4πε0 r³) = (1/4πε0)(q/r²) r̂

Same answer, more effort — exploit symmetry when possible.

### Example 23.14 — Field outside a charged conducting cylinder [s126–128]

From Example 23.10: V = (λ/2πε0) ln(R/r) = (λ/2πε0)(ln R − ln r). E is radial:

    Er = −∂V/∂r = (λ/2πε0) ∂(ln r)/∂r = (1/2πε0) λ/r

(d/dr of the constant ln R is 0; d/dr of ln r is 1/r.) Same as Example 22.6.

### Example 23.15 — Field of a ring of charge [s129–132]

From Example 23.11: V = (1/4πε0) Q/√(x² + a²). On the axis E has only an
x-component:

    Ex = −∂V/∂x = (1/4πε0) Qx/(x² + a²)^{3/2}

Agrees with Example 21.10.

---

## Concept summary [s133–142]

- **Electric potential energy**: the electric force from charges at rest is
  conservative; its work equals −ΔU: W(a→b) = Ua − Ub = −ΔU (23.2).
  Two point charges: U = (1/4πε0) qq0/r (23.9). Charge q0 among charges qi:
  U = (q0/4πε0) Σ qi/ri (23.10).
- **Electric potential**: V = potential energy per unit charge. Potential
  difference = work per charge needed to move a positive test charge between
  two points. V = (1/4πε0) q/r (23.14); V = (1/4πε0) Σ qi/ri (23.15);
  V = (1/4πε0) ∫dq/r (23.16). Potential of a relative to b is the line
  integral of E: Va − Vb = ∫a→b E · dl = ∫a→b E cos φ dl (23.17) — find E
  first, then integrate.
- **Equipotential surfaces**: V the same at every point; field lines cross
  them at right angles. With charges at rest, a conductor's surface is an
  equipotential and its whole interior is at the same potential. A
  charge-free cavity in a conductor is an equipotential region with no
  surface charge on the cavity wall.
- **Field from potential**: Ex = −∂V/∂x, Ey = −∂V/∂y, Ez = −∂V/∂z (23.19);
  E = −(î ∂V/∂x + ĵ ∂V/∂y + k̂ ∂V/∂z) (23.20).

---

## Homework [s143–144]

Assigned: **23.20**.

**23.20** Two point charges of equal magnitude Q are held a distance d apart.
Consider only points on the line passing through both charges.
- (a) If the two charges have the same sign, find the location of all points
  (if there are any) at which (i) the potential (relative to infinity) is
  zero (is the electric field zero at these points?), and (ii) the electric
  field is zero (is the potential zero at these points?).
- (b) Repeat part (a) for two point charges having opposite signs.

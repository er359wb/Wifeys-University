# Chapter 24 — Capacitance and Dielectrics

Read-optimized companion to `Chapter 24宽版.pdf` (136 lecture slides, dated
2026/10/30; 宽版 = widescreen version). Textbook: *University Physics*
(Young & Freedman). `[sN]` = slide number in the PDF. Equations in plain
math; figures described in words. `[slide typo: ...]` = an error on the
slide, checked by recalculation or against the surrounding slides.
Slides 135–136 are end-of-chapter problems 24.59 and 24.71 (see bottom).

## Objectives and outline [s2–4]

- A capacitor stores electric potential energy and electric charge.
- Capacitance = ratio of the charge on each conductor to the potential
  difference between them.
- The ratio increases when an insulating material (a **dielectric**) is
  present, because of a redistribution of charge called **polarization**.
  Studying it gives insight into electrical properties of matter.

Outline: 24.1 Capacitors and Capacitance · 24.2 Capacitors in Series and
Parallel · 24.3 Energy Storage in Capacitors and Electric-Field Energy ·
24.4 Dielectrics · 24.5 Molecular Model of Induced Charge · 24.6 Gauss's Law
in Dielectrics. (The deck only covers 24.1–24.4; there are no slides for 24.5
or 24.6.)

---

## 24.1 Capacitors and Capacitance [s5–34]

- **Capacitor**: any two conductors a and b separated by an insulator or a
  vacuum.
- **Charging**: electrons are moved from one conductor to the other. "A
  capacitor with charge Q" means the conductor at higher potential has +Q
  and the one at lower potential has −Q (net charge of the capacitor is
  zero).
- Capacitance measures the capacitor's ability to store (charge and)
  energy.
- Circuit symbol [s7]: two short parallel lines (one version with the lines
  straight, another with one curved).

      C = Q / Vab        (24.1, definition of capacitance)

  Q = magnitude of charge on each conductor; Vab = potential of the positive
  conductor a relative to the negative conductor b.
- SI unit: **farad**, 1 F = 1 C/V.

### Parallel-plate capacitor [s9–13]

Two parallel conducting plates, each of area A, separated by a distance d
that is small compared with their size. Figure [s10]: field between the
plates is uniform, pointing from + to −, with slight "fringing" at the
edges when d is small.

    E = σ/ε0 = Q/(ε0A)
    Vab = Ed = Qd/(ε0A)
    C = Q/Vab = ε0 A/d          (24.2, parallel plates in vacuum)

- In vacuum, C depends only on geometry (A and d), not on Q or Vab.
- From (24.2): 1 F = 1 C²/N·m = 1 C²/J; ε0 = 8.85 × 10⁻¹² F/m.
- 1 F is huge. Common units: μF = 10⁻⁶ F, pF = 10⁻¹² F.

### Example 24.1 — Size of a 1-F capacitor [s14–16]

C = 1.0 F, d = 1.0 mm. Find A.

    A = Cd/ε0 = (1.0 F)(1.0×10⁻³ m)/(8.85×10⁻¹² F/m) = 1.1×10⁸ m²

About 10 km on a side. Modern 1-F capacitors are a few cm across, e.g. using
activated carbon granules (1 g has ~1000 m² of surface).

### Example 24.2 — Properties of a parallel-plate capacitor [s17–21]

Vacuum, d = 5.00 mm, A = 2.00 m², V = 10.0 kV. Find (a) C, (b) Q, (c) E.

    (a) C = ε0A/d = (8.85×10⁻¹²)(2.00)/(5.00×10⁻³) = 3.54×10⁻⁹ F = 0.00354 μF
    (b) Q = CVab = (3.54×10⁻⁹)(1.00×10⁴) = 3.54×10⁻⁵ C = 35.4 μC
        (+35.4 μC on the higher-potential plate, −35.4 μC on the other)
    (c) E = Q/(ε0A) = 3.54×10⁻⁵/((8.85×10⁻¹²)(2.00)) = 2.00×10⁶ N/C
        check: E = Vab/d = (1.00×10⁴ V)/(5.00×10⁻³ m) = 2.00×10⁶ V/m

### Example 24.3 — Spherical capacitor [s22–28]

Two concentric conducting spherical shells in vacuum: inner shell charge +Q,
outer radius ra; outer shell charge −Q, inner radius rb. Find C.

- Not parallel plates → use the definition C = Q/Vab. Gauss's law with a
  spherical surface of radius r between the shells [s23 figure]: only the
  inner charge is enclosed, so E = Q/(4πε0r²) (the outer shell has no
  effect). V is the same as for a point charge, V = Q/(4πε0r):

      Vab = Va − Vb = (Q/4πε0)(1/ra − 1/rb) = (Q/4πε0)(rb − ra)/(ra rb)
      C = Q/Vab = 4πε0 · ra rb/(rb − ra)

- 4π ra rb is the geometric mean A_gm of the two sphere areas 4πra² and
  4πrb², and d = rb − ra, so C = ε0 A_gm/d — the same form as parallel
  plates. If the gap is small compared with the radii, the spheres behave
  like parallel plates.

### Example 24.4 — Cylindrical capacitor [s29–34]

Long inner conductor, radius ra, charge per length +λ; coaxial outer shell,
inner radius rb, charge per length −λ; vacuum between. Find capacitance per
unit length. Figure [s30]: field lines radially outward from inner to outer
cylinder; charge in length L is λL.

- Outside a charged cylinder, V = (λ/2πε0) ln(r0/r) (Ch 23). So

      Vab = (λ/2πε0) ln(rb/ra)      (positive: inner cylinder is higher)
      C = Q/Vab = λL / [(λ/2πε0) ln(rb/ra)] = 2πε0 L / ln(rb/ra)
      C/L = 2πε0/ln(rb/ra) = 55.6 pF/m / ln(rb/ra)    (ε0 = 8.85 pF/m)

- C depends only on dimensions. A typical TV-antenna/VCR coaxial cable has
  about 69 pF/m.

---

## 24.2 Capacitors in Series and Parallel [s35–62]

### Series [s36–44]

Figure [s36–39]: C1 and C2 one after the other between a and b (C1 from a to
the middle point c, C2 from c to b). Both start uncharged; apply Vab.

- The lower plate of C1 and the upper plate of C2 are connected only to each
  other, so their total charge stays zero → **every plate has the same
  magnitude of charge Q**.

      Vac = V1 = Q/C1,   Vcb = V2 = Q/C2
      Vab = V = V1 + V2 = Q(1/C1 + 1/C2)
      V/Q = 1/C1 + 1/C2                       (24.3)
      Ceq = Q/V   or   1/Ceq = V/Q            (24.4)
      1/Ceq = 1/C1 + 1/C2 + 1/C3 + ...        (24.5, capacitors in series)

  [slide typo: s41 says Vac is across the "second" capacitor; Vac = V1 is
  across C1, the first one]
- Series Ceq is always **less** than any individual capacitance.
- Same charge on each; the individual voltages differ unless the C's are
  equal; the total voltage is the sum of the individual voltages.

### Parallel [s45–51]

Figure [s45–46]: C1 and C2 each connected directly between a and b. The
upper plates are joined by wire (one equipotential), and so are the lower
plates.

- **Same potential difference** V = Vab across every capacitor.

      Q1 = C1V, Q2 = C2V,   Q = Q1 + Q2 = (C1 + C2)V
      Q/V = C1 + C2                           (24.6)
      Ceq = C1 + C2 + C3 + ...                (24.7, capacitors in parallel)

- Parallel Ceq is always **greater** than any individual capacitance.
- Same voltage on each; the individual charges differ unless the C's are
  equal; the total charge is the sum of the individual charges.
  [slide typo: s51 says "total charge across the series combination"; it
  means the parallel combination]

### Example 24.5 — Series and parallel [s52–57]

C1 = 6.0 μF, C2 = 3.0 μF, Vab = 18 V. Find Ceq, and Q and V for each, (a) in
series, (b) in parallel.

(a) Series:

    1/Ceq = 1/6.0 + 1/3.0   →   Ceq = 2.0 μF
    Q = Ceq V = (2.0 μF)(18 V) = 36 μC on each
    V1 = Q/C1 = 36/6.0 = 6.0 V,   V2 = Q/C2 = 36/3.0 = 12.0 V

(Voltage is inversely proportional to C: the smaller C gets the larger
voltage.)

(b) Parallel:

    Ceq = 6.0 + 3.0 = 9.0 μF
    each has V = 18 V
    Q1 = (6.0 μF)(18 V) = 108 μC,   Q2 = (3.0 μF)(18 V) = 54 μC

(Charge is directly proportional to C.) Series Ceq < both, parallel Ceq >
both.

### Example 24.6 — A capacitor network [s58–62]

Figure [s58]: between a and b — a 3 μF, an 11 μF, and a branch of 12 μF in
series with 6 μF, all three side by side (parallel); this group is then in
series with a 9 μF capacitor.

    12 μF and 6 μF in series:   1/C' = 1/12 + 1/6   →   C' = 4 μF
    3, 11, 4 μF in parallel:    C'' = 3 + 11 + 4 = 18 μF
    18 μF and 9 μF in series:   1/Ceq = 1/18 + 1/9   →   Ceq = 6 μF

Strategy: find parts that are purely series or purely parallel, replace each
by its equivalent, repeat. Net charge on the network = (6 μF) × Vab.

---

## 24.3 Energy Storage in Capacitors and Electric-Field Energy [s63–85]

- Moving charge dq onto a capacitor already holding q (voltage q/C) takes
  work dW = (q/C) dq. Charging from 0 to Q:

      W = ∫0→Q (q/C) dq = Q²/(2C)            (24.8, work to charge a capacitor)

- With U = 0 for an uncharged capacitor, the stored energy U = W. Using
  Q = CV:

      U = Q²/(2C) = ½CV² = ½QV                (24.9)

  (Q in C, C in F, V in V → U in J.)

### Energy density [s66–68]

Energy per unit volume between the plates (volume Ad):

    u = (½CV²)/(Ad)                           (24.10)

With C = ε0A/d and V = Ed, A and d cancel:

    u = ½ ε0 E²                               (24.11, energy density in vacuum)

Valid for **any** electric field in vacuum, not just capacitors.
Electric-field energy is the same energy as electric potential energy, just
viewed as belonging to the field rather than to the charges.

### Example 24.7 — Transferring charge and energy [s69–75]

C1 = 8.0 μF charged to V0 = 120 V, then disconnected from the supply. Switch
S open. Figure [s70]: C1 on the left with charge Q0, switch S in the middle
(an insulating handle; charge flows only between the two upper terminals
and between the two lower terminals), uncharged C2 = 4.0 μF on the right.
(a) Q0? (b) energy in C1? (c) close S: final V and charge on each?
(d) final energy?

    (a) Q0 = C1V0 = (8.0 μF)(120 V) = 960 μC
    (b) U_initial = ½Q0V0 = ½(960×10⁻⁶)(120) = 0.058 J
    (c) Closing S joins upper plates together and lower plates together →
        parallel. Charge is conserved:
        V = Q0/(C1 + C2) = 960 μC / 12.0 μF = 80 V
        Q1 = C1V = 640 μC,   Q2 = C2V = 320 μC
    (d) U_final = ½Q1V + ½Q2V = ½Q0V = ½(960×10⁻⁶)(80) = 0.038 J

Energy dropped from 0.058 J to 0.038 J: the wires warm up (resistance) and
some energy is radiated as electromagnetic waves.

### Example 24.8 — Electric-field energy [s76–79]

Store 1.00 J in 1.00 m³ of vacuum. (a) E? (b) energy per m³ if E is 10×
bigger?

    (a) u = 1.00 J/m³;   E = √(2u/ε0) = √(2(1.00)/(8.85×10⁻¹²)) = 4.75×10⁵ V/m
    (b) u ∝ E², so 10× E → 100× u = 100 J/m³

[slide typo: s79 cites Eq. (24.1); the relation u ∝ E² is Eq. (24.11)]
That field is large: nearly half a million volts across one metre.

### Example 24.9 — Two ways to find the stored energy [s80–85]

Spherical capacitor of Example 24.3 with ±Q. Find U (a) from C, (b) by
integrating u.

- E = 0 inside the inner sphere and outside the outer one (a Gaussian sphere
  there encloses zero net charge), so u ≠ 0 only for ra < r < rb, where
  E = Q/(4πε0r²).

      (a) U = Q²/(2C) = Q²(rb − ra)/(8πε0 ra rb)
      (b) u = ½ε0E² = Q²/(32π²ε0 r⁴);   volume of a thin shell dV = 4πr² dr
          U = ∫ra→rb [Q²/(32π²ε0 r⁴)] 4πr² dr = (Q²/8πε0) ∫ra→rb dr/r²
            = (Q²/8πε0)(1/ra − 1/rb) = Q²(rb − ra)/(8πε0 ra rb)

- Same answer: the energy can be assigned either to the charges (a) or to the
  field (b).

---

## 24.4 Dielectrics [s86–123]

- Most capacitors have a non-conducting material (dielectric) between the
  plates [slide typo: s87 says "between their non-conducting plates"; the
  plates are conductors]. A common type [s88 figure]: long strips of metal
  foil separated by plastic sheet (e.g. Mylar), rolled up — several μF in a
  small package.
- A dielectric does three things:
  1. Mechanically keeps two large plates very close without touching.
  2. Raises the maximum possible voltage: any insulator in a strong enough
     field partially ionizes and conducts — **dielectric breakdown**. Many
     dielectrics withstand larger fields than air, so the capacitor can hold
     a larger V, and therefore more charge and energy.
  3. Increases the capacitance for the same dimensions.

### Dielectric constant [s91–95]

Figure [s91]: (a) a charged capacitor with vacuum between the plates, an
electrometer reads V0; (b) same charge with a dielectric slab inserted, the
reading drops to V < V0.

    K = C/C0                       (24.12, dielectric constant; space completely filled)
    V = V0/K                       (24.13, when Q is constant)
    E = E0/K                       (24.14, when Q is constant)

K ≥ 1 (vacuum K = 1). Table 24.1 [s94], K at 20 °C:

| Material | K | Material | K |
|---|---|---|---|
| Vacuum | 1 | Polyvinyl chloride | 3.18 |
| Air (1 atm) | 1.00059 | Plexiglas | 3.40 |
| Air (100 atm) | 1.0548 | Glass | 5–10 |
| Teflon | 2.1 | Neoprene | 6.70 |
| Polyethylene | 2.25 | Germanium | 16 |
| Benzene | 2.28 | Glycerin | 42.5 |
| Mica | 3–6 | Water | 80.4 |
| Mylar | 3.1 | Strontium titanate | 310 |

### Induced charge and polarization [s96–100]

- The charge on the plates doesn't change, but **induced charge** of the
  opposite sign appears on each face of the dielectric (−σi next to the +σ
  plate, +σi next to the −σ plate). The dielectric is still neutral overall.
  The cause is **polarization**: a redistribution of + and − charge inside
  the material.
- Figure [s97]: (a) vacuum — field E0 from the plate charges ±σ; (b)
  dielectric — the induced charges ∓σi partly cancel it, so fewer field
  lines cross the dielectric and E is smaller.

      E0 = σ/ε0,   E = (σ − σi)/ε0              (24.15)
      σi = σ(1 − 1/K)                           (24.16, induced surface charge density)

- **Permittivity** of the dielectric:

      ε = Kε0                                   (24.17)
      E = σ/ε                                   (24.18)
      C = KC0 = Kε0 A/d = εA/d                  (24.19, parallel plates with dielectric)
      u = ½Kε0E² = ½εE²                         (24.20, energy density in a dielectric)

### Example 24.10 — Capacitor with and without a dielectric [s101–114]

Plates A = 2000 cm² = 2.00 × 10⁻¹ m², d = 1.00 cm = 1.00 × 10⁻² m. Charged to
V0 = 3000 V, disconnected (Q now fixed), then a plastic sheet is inserted
between the plates: V drops to 1000 V. Find (a) C0, (b) Q, (c) C, (d) K,
(e) ε, (f) induced charge Qi, (g) E0, (h) E.

    (a) C0 = ε0A/d = (8.85×10⁻¹²)(2.00×10⁻¹)/(1.00×10⁻²) = 1.77×10⁻¹⁰ F = 177 pF
    (b) Q = C0V0 = (1.77×10⁻¹⁰)(3.00×10³) = 5.31×10⁻⁷ C = 0.531 μC
    (c) C = Q/V = 5.31×10⁻⁷/1.00×10³ = 5.31×10⁻¹⁰ F = 531 pF
    (d) K = C/C0 = 531/177 = 3.00     (or K = V0/V = 3000/1000 = 3.00)
    (e) ε = Kε0 = 3.00(8.85×10⁻¹²) = 2.66×10⁻¹¹ C²/N·m²
    (f) Qi = Q(1 − 1/K) = 5.31×10⁻⁷ (1 − 1/3.00) = 3.54×10⁻⁷ C
    (g) E0 = V0/d = 3000/1.00×10⁻² = 3.00×10⁵ V/m
    (h) E = V/d = 1000/1.00×10⁻² = 1.00×10⁵ V/m

Three checks for (h), all 1.00 × 10⁵ V/m: E = Q/(εA); E = (Q − Qi)/(ε0A) =
(5.31 − 3.54)×10⁻⁷/((8.85×10⁻¹²)(2.00×10⁻¹)); E = E0/K = 3.00×10⁵/3.00.
Result: C went up ×3 and E went down ×1/3, via induced charge
Q(1 − 1/3) = 0.667 Q.

### Example 24.11 — Energy with and without the dielectric [s115–120]

Same capacitor as 24.10.

    U0 = ½C0V0² = ½(1.77×10⁻¹⁰)(3000)² = 7.97×10⁻⁴ J
    U  = ½CV²   = ½(5.31×10⁻¹⁰)(1000)² = 2.66×10⁻⁴ J        (one third of U0)
    u0 = ½ε0E0² = ½(8.85×10⁻¹²)(3.00×10⁵)² = 0.398 J/m³
    u  = ½εE²   = ½(2.66×10⁻¹¹)(1.00×10⁵)² = 0.133 J/m³     (one third of u0)

Where the energy went [s115 figure, Fig. 24.14]: the fringing field at the
plate edges pulls on the dielectric's induced charges and draws the slab
into the gap, doing work on it (it could stretch a spring). That work comes
out of the field energy.

### Dielectric strength [s121–123]

- In a strong enough field any dielectric breaks down and conducts, so
  capacitors have maximum voltage ratings.
- **Dielectric strength** = the largest field a material can take without
  breakdown. It depends strongly on temperature, impurities, etc.
- Dry air: about 3 × 10⁶ V/m. Table 24.2 [s123]:

| Material | K | Dielectric strength E_m (V/m) |
|---|---|---|
| Polycarbonate | 2.8 | 3 × 10⁷ |
| Polyester | 3.3 | 6 × 10⁷ |
| Polypropylene | 2.2 | 7 × 10⁷ |
| Polystyrene | 2.6 | 2 × 10⁷ |
| Pyrex glass | 4.7 | 1 × 10⁷ |

---

## Concept summary [s124–134]

- **Capacitors and capacitance**: a capacitor is any pair of conductors
  separated by an insulator. Charged: ±Q on the two conductors, and Vab is
  proportional to Q. C = Q/Vab (24.1), unit farad (1 F = 1 C/V). Parallel
  plates in vacuum: C = ε0A/d (24.2), depends only on A and d. Other shapes:
  use C = Q/Vab.
- **Series**: 1/Ceq = 1/C1 + 1/C2 + 1/C3 + ... (24.5).
  **Parallel**: Ceq = C1 + C2 + C3 + ... (24.7).
- **Energy**: work to charge = stored energy U = Q²/2C = ½CV² = ½QV (24.9),
  which can be thought of as stored in the field. Energy density
  u = ½ε0E² (24.11).
- **Dielectrics**: filling the space multiplies C by K; ε = Kε0 is the
  permittivity (24.17). For fixed plate charge, induced surface charges
  (from polarization) reduce E and V by the factor K. Strong enough fields
  cause dielectric breakdown; the maximum field is the dielectric strength.
  In a dielectric, replace ε0 by ε: C = KC0 = εA/d (24.19),
  u = ½Kε0E² = ½εE² (24.20).

---

## End-of-chapter problems on the last slides [s135–136]

No "Homework" heading, but these two problems close the deck.

**24.59** In Fig. 24.32, C1 = C5 = 8.4 μF and C2 = C3 = C4 = 4.2 μF. The
applied potential is Vab = 220 V. (a) What is the equivalent capacitance of
the network between points a and b? (b) Calculate the charge on each
capacitor and the potential difference across each capacitor.

> Fig. 24.32: terminal a on the top wire, terminal b on the bottom wire. Top
> wire: a → C1 → a junction → C3 → the right end. Bottom wire: b → C5 → a
> junction → C4 → the right end. A vertical wire on the far right joins the
> top and bottom right ends. C2 connects the top junction (between C1 and
> C3) to the bottom junction (between C5 and C4).

**24.71** A parallel-plate capacitor has the space between the plates filled
with two slabs of dielectric, one with constant K1 and one with constant K2
(Fig. 24.37). Each slab has thickness d/2, where d is the plate separation.
Show that the capacitance is

    C = (2ε0A/d) · K1K2/(K1 + K2)

> Fig. 24.37: the two slabs are stacked between the plates, K1 on top of K2,
> each d/2 thick, each covering the full plate area.

# Chapter 21 — Electric Charge and Electric Field

Read-optimized companion to `Chapter 21 (1).pdf` (177 lecture slides, dated
2026/9/3). Slides follow the textbook *University Physics* (Young & Freedman,
International Edition). `[sN]` = slide number in the PDF. Equations are
rewritten in plain math; figures are described in words.
`[slide typo: ...]` = an error on the slide, checked by recalculation.

## Course context [s1–2]

Electromagnetism unit chapters: 21 Electric Charge and Electric Field ·
22 Gauss's Law · 23 Electric Potential · 24 Capacitance and Dielectrics ·
25 Current, Resistance, and EMF · 26 Direct-Current Circuits ·
27 Magnetic Field and Magnetic Forces · 28 Sources of Magnetic Field ·
29 Electromagnetic Induction · 30 Inductance · 31 Alternating Current ·
32 Electromagnetic Waves.

## Objectives and outline [s4–5]

Objectives: the nature of electric charge; interactions of electric charges;
Coulomb's law; the concept of electric field.

Outline: 21.1 Electric Charge · 21.2 Conductors, Insulators, and Induced
Charges · 21.3 Coulomb's Law · 21.4 Electric Field and Electric Forces ·
21.5 Electric-Field Calculations · 21.6 Electric Field Lines ·
21.7 Electric Dipoles.

---

## 21.1 Electric Charge [s6–18]

- Electric charge is an attribute as fundamental as mass.
- **Electrostatics** = interactions between electric charges that are at
  rest (or nearly so).
- Figure [s8–9]: rubbing experiments. Two plastic rods rubbed with fur repel
  each other; two glass rods rubbed with silk repel each other; a plastic rod
  rubbed with fur attracts a glass rod rubbed with silk; the fur attracts the
  plastic rod, the silk attracts the glass rod.
- **Exactly two kinds of charge**: negative (−) and positive (+).
  Like charges repel; opposite charges attract.
- CAUTION [s11]: "like charges" just means same algebraic sign (both + or
  both −); "opposite charges" means one + and one −.
- Application [s11–12]: laser printer. A wire sprays ions onto the drum
  (positive charge); the laser "writes" on the drum, leaving negatively
  charged areas where the image will be; a roller applies positively charged
  toner, which sticks only to the negatively charged areas; wires spray a
  stronger negative charge on the paper so toner moves onto it; fuser rollers
  heat the paper so toner stays; a lamp discharges the drum to restart.

### Charge and the structure of matter [s13–16]

- Atom = negatively charged **electrons**, positively charged **protons**,
  uncharged **neutrons**. Protons + neutrons form the nucleus; electrons are
  far out around it.
- Figure [s14], lithium (3 protons, 4 neutrons):
  - (a) neutral Li: 3 electrons — electrons equal protons, zero net charge;
  - (b) positive ion Li⁺: 2 electrons — fewer electrons than protons, net +;
  - (c) negative ion Li⁻: 4 electrons — more electrons than protons, net −.
- **Atomic number** = number of protons (= number of electrons in the neutral
  atom).
- **Positive ion**: atom that lost electron(s). **Negative ion**: atom that
  gained electron(s). The process is **ionization**.
- Total protons = total electrons in a body → net charge zero → body is
  **electrically neutral**.
- "The charge of a body" always means its **net charge**.

### Conservation of charge [s17]

- The algebraic sum of all electric charges in any closed system is constant.
- Charging never creates or destroys charge; it only transfers it between
  bodies.
- Net charge = algebraic sum of all the charges.

### Elementary charge / quantization [s18]

- Magnitude of the electron's (or proton's) charge is the natural unit:
  e = 1.602 × 10⁻¹⁹ C.
- Any observable charge on a macroscopic body is zero or an integer multiple
  of e — **quantization of charge**.

---

## 21.2 Conductors, Insulators, and Induced Charges [s19–33]

- **Conductors**: charge moves easily through them (most metals).
- **Insulators**: charge does not move easily (most non-metals).
- **Semiconductors**: in between.
- Figure [s21]: a metal ball hung on insulating nylon threads, touched by a
  copper wire from a negatively charged plastic rod — the wire conducts charge
  to the ball; afterwards the negatively charged plastic rod repels the ball
  and a positively charged glass rod attracts it. Copper = good conductor;
  glass and nylon = good insulators.

### Ways to charge [s22–23]

- **By rubbing (insulators)**: two insulators rubbed together separate
  charge. If both started neutral, they end with equal-magnitude, opposite
  charges (charge is conserved).
- **By contact (conductors)**.
- **Grounding**: the earth is a conductor so large it acts as an infinite
  source or sink of electrons. The charge it acquires via induction is equal
  and opposite to the charge left on the induced body.

### Charging by induction [s24–28]

- A charged body gives another body a charge of **opposite sign without
  losing any of its own charge**.
- **Induced charges** = excess charges that develop in regions of a body
  during induction.
- In a metal, the mobile charges are always the negative electrons. In ionic
  solutions and ionized gases, both + and − charges are mobile.
- Five-step figure, charging a metal ball [s25–27]:
  - (a) uncharged metal ball on an insulating stand;
  - (b) negatively charged rod brought near: it repels electrons to the far
    side (electron buildup) leaving the near side electron-deficient (+);
  - (c) a wire to ground lets the electron buildup flow into the ground;
  - (d) wire removed — ball now has only the electron-deficient (+) region;
  - (e) rod removed — electrons rearrange, ball has an overall electron
    deficiency: **net positive charge** (opposite to the rod's charge).

### Polarization — forces on neutral objects [s29–33]

- A charged body can exert forces on uncharged objects (induced-charge
  effect).
- Cause: **polarization**. In a neutral insulator the charges in each
  molecule can shift slightly, so regions of + and − separate. The object is
  then **polarized** and feels an electric force even with zero net charge.
- A charged object of **either sign** attracts a neutral insulator.
- Figure [s30–33]: a charged comb picks up uncharged bits of paper.
  - Negatively charged comb: electrons in each molecule shift **away** from
    the comb, so the (+) charges are closer to the comb and feel a stronger
    force than the (−) charges → net force attractive.
  - Positively charged comb: electrons shift **toward** the comb, so the (−)
    charges are closer and feel a stronger force → net force again
    attractive.
- By Newton's third law the neutral insulator pulls back on the comb with an
  equal-magnitude force.

---

## 21.3 Coulomb's Law [s34–66]

**Coulomb's law**: the magnitude of the electric force between two point
charges is proportional to the product of the charges and inversely
proportional to the square of the distance between them:

    F = k |q1 q2| / r²  =  (1 / 4πε0) · |q1 q2| / r²
    k = 1/(4πε0) ≈ 9.0 × 10⁹ N·m²/C²   (more precisely 8.988 × 10⁹)

[slide typo: s35 writes the unit as N·m/C²; correct unit is N·m²/C²]

- The forces lie **along the line joining the two charges** [s36]. Figure:
  like charges repel (F on 2 points away from 1), opposite charges attract.
  F(1 on 2) = −F(2 on 1) — always equal and opposite (Newton's third law),
  even when |q1| ≠ |q2|.

### Example 21.1 — Electric vs gravitational force [s37–40]

α particle (helium nucleus): m = 6.64 × 10⁻²⁷ kg (s37 writes 6.66), q = +2e =
3.2 × 10⁻¹⁹ C. Compare electric repulsion with gravitational attraction
between two α particles.

    Fe = (1/4πε0) q²/r²,   Fg = G m²/r²
    Fe/Fg = (1/4πε0G) · q²/m²
          = (9.0×10⁹)(3.2×10⁻¹⁹)² / [(6.67×10⁻¹¹)(6.64×10⁻²⁷)²]
          = 3.1 × 10³⁵

Gravity is completely negligible for atomic/subatomic particles. But in
person- or planet-sized objects, + and − charges almost cancel, so the net
electric force is usually much smaller than gravity.

### Problem-solving strategy 21.1 — Coulomb's law [s41–47]

- IDENTIFY: Coulomb's law gives the force between charged particles.
- SET UP: (1) sketch the charges and label them; (2) if they don't lie on one
  line, set up xy axes; (3) identify which particle(s) you need the force on.
- EXECUTE:
  1. For each particle exerting a force on the one of interest, find the
     magnitude of that force.
  2. Draw a free-body diagram. Force of 1 on 2 points from 2 **toward** 1 if
     the signs are opposite, and from 2 **directly away from** 1 if the signs
     are the same.
  3. **Superposition**: total force = vector sum (use components).
  4. SI units: m, C, N, with 1/(4πε0) = 9.0 × 10⁹ N·m²/C².
  5. Continuous charge distributions: the sum becomes a vector integral —
     split into infinitesimal pieces, apply Coulomb's law to each, integrate.
  6. Use symmetry, e.g. two identical charges q exert zero net force on a
     charge Q midway between them.
- EVALUATE: check numbers are reasonable and the direction agrees with
  "like repel, unlike attract".

### Example 21.2 — Force between two point charges [s48–53]

q1 = +25 nC, q2 = −75 nC, separation 3.0 cm. Find (a) force of q1 on q2,
(b) force of q2 on q1.

    F(1 on 2) = (9.0×10⁹)(25×10⁻⁹)(75×10⁻⁹)/(0.030)² = 0.019 N
    (the slide keeps the sign of the product and writes −0.019 N; the
     magnitude is 0.019 N)

(a) Opposite signs → attractive: force on q2 points toward q1.
(b) Newton's third law: F(2 on 1) = 0.019 N, directed toward q2 (opposite to
F(1 on 2)). Same magnitude even though the charges have different sizes.
Figure: (b) free-body diagram for q2 (arrow toward q1), (c) for q1 (arrow
toward q2).

### Example 21.3 — Vector addition of forces on a line [s54–60]

On the +x axis: q1 = 1.0 nC at x = 2.0 cm, q2 = −3.0 nC at x = 4.0 cm.
Find the total force on q3 = 5.0 nC at the origin.

- q3 is repelled by q1 (same sign) → pushed in −x.
  q3 is attracted by q2 (opposite sign) → pulled in +x.

      F(1 on 3) = (9.0×10⁹)(1.0×10⁻⁹)(5.0×10⁻⁹)/(0.020)² = 1.12×10⁻⁴ N = 112 μN  (−x)
      F(2 on 3) = (9.0×10⁹)(3.0×10⁻⁹)(5.0×10⁻⁹)/(0.040)² = 8.4×10⁻⁵ N = 84 μN  (+x)

  [slide typos: s57 writes q1q2 in the formula — should be q1q3; s58 writes
  (0.020 m)² — should be (0.040 m)², which is what gives 84 μN]

- Fx = −112 μN + 84 μN = −28 μN. No y or z components. Total force:
  28 μN = 2.8 × 10⁻⁵ N, to the left (−x).
- Check: q2 has 3× the charge but is 2× as far → F(2 on 3) = 3/2² = 3/4 of
  F(1 on 3); indeed 84/112 = 0.75.

### Example 21.4 — Vector addition of forces in a plane [s61–66]

q1 = q2 = +2.0 μC at (0, +0.30 m) and (0, −0.30 m); Q = +4.0 μC at
(0.40 m, 0). Each is 0.50 m from Q (3-4-5 triangle). Find the net force on Q.

    F(1 on Q) = (9.0×10⁹)(4.0×10⁻⁶)(2.0×10⁻⁶)/(0.50)² = 0.29 N
    cos α = 0.40/0.50,  sin α = 0.30/0.50   (α = angle below the x-axis)
    (F1 on Q)x = 0.29 N × 0.40/0.50 = +0.23 N
    (F1 on Q)y = −0.29 N × 0.30/0.50 = −0.17 N

q2's force has the same magnitude at angle α **above** the x-axis: same
x-component, opposite y-component. By symmetry:

    Fx = 0.23 + 0.23 = 0.46 N,   Fy = −0.17 + 0.17 = 0

Net force 0.46 N in the +x direction — pointing away from the pair as a
whole, not directly away from either charge. Would not be along +x if
q1 ≠ q2 or the geometry weren't symmetric.

---

## 21.4 Electric Field and Electric Forces [s67–104]

### Definition [s68–74]

**Electric field** at a point = electric force F0 on a small **test charge**
q0 at that point, divided by q0 (force per unit charge):

    E = F0 / q0        (21.3)
    F0 = q0 E          (21.4)

- SI unit: N/C.
- Figure [s69–70]: bodies A and B exert forces on each other; remove B and
  label its former position P; body A sets up a field E at P; E is the force
  per unit charge that A exerts on a test charge at P.
- A charged body produces a field at **all points** around it. The electric
  force on a charged body is exerted by the field created by **other**
  charged bodies. (The slide calls the electric force "action at a
  distance" — acting across empty space with no matter in between.)
- E is useful because it **does not depend on the charge of the body** that
  feels the force [s72].
- Field can differ from point to point, so F0 = q0E gives the force on a
  **point** charge only, not on a large body over which E varies [s73].
- Figure [s74]: force on a positive test charge points **in the direction**
  of E; force on a negative test charge points **opposite** to E.

### Field of a point charge [s75–80]

    E = (1/4πε0) |q| / r²          (21.6, magnitude)
    E = (1/4πε0) (q / r²) r̂        (21.7, vector)

- **Source point S** = where the charge producing the field is.
  **Field point P** = where the field is being found.
- **r̂** = unit vector pointing from S to P.
- q positive → E points directly **away** from the charge (along r̂).
  q negative → E points directly **toward** the charge (opposite to r̂).
- **Vector field** = the set of E vectors at every point in space. A point
  charge's field gets weaker with distance [s79 figure: radial arrows,
  outward for +q, inward for −q, shorter farther away].
- **Uniform field**: same magnitude and direction everywhere [s80].

### Example 21.5 — Field magnitude of a point charge [s81–84]

q = 4.0 nC, field point 2.0 m away.

    E = (9.0×10⁹)(4.0×10⁻⁹)/(2.0)² = 9.0 N/C

Check via force on a test charge: F0 = (9.0×10⁹)(4.0×10⁻⁹) q0/(2.0)² =
(9.0 N/C) q0, so E = F0/q0 = 9.0 N/C. q positive → E points from q toward
the field point. Magnitude and direction of E do not depend on the sign of
q0.

### Example 21.6 — Field vector of a point charge [s85–89]

q = −8.0 nC at the origin. Find E at x = 1.2 m, y = −1.6 m.

    r  = √(x² + y²) = √(1.2² + 1.6²) = 2.0 m
    r̂  = r/r = (x î + y ĵ)/r = (1.2 î − 1.6 ĵ)/2.0 = 0.60 î − 0.80 ĵ
    E  = (1/4πε0)(q/r²) r̂
       = (9.0×10⁹)(−8.0×10⁻⁹)/(2.0)² × (0.60 î − 0.80 ĵ)
       = (−11 N/C) î + (14 N/C) ĵ

q negative → E points from the field point toward the charge, opposite to r̂.

### Example 21.7 — Electron in a uniform field [s90–99]

Two large horizontal parallel conducting plates 1.0 cm apart, connected to a
100-V battery: E = 1.00 × 10⁴ N/C, directed vertically **upward**. Electron:
charge −e = −1.60 × 10⁻¹⁹ C, m = 9.11 × 10⁻³¹ kg, released from rest at the
upper plate. Find (a) acceleration, (b) speed and kinetic energy after
1.0 cm, (c) time taken.

- E is up (+y) but the electron is negative → force is **down**, Fy < 0.
  Field is uniform → force and acceleration constant → use constant-
  acceleration kinematics (Chapter 3). K = ½mv².

(a)

    ay = Fy/m = −eE/m = (−1.60×10⁻¹⁹)(1.00×10⁴)/(9.11×10⁻³¹) = −1.76×10¹⁵ m/s²

Enormous: a 1000-kg car would need ~2 × 10¹⁸ N for this. Gravity on the
electron is negligible.

(b) vy² = v0y² + 2ay(y − y0), with v0y = 0, y0 = 0, y = −1.0 × 10⁻² m:

    |vy| = √(2 ay y) = √(2(−1.76×10¹⁵)(−1.0×10⁻²)) = 5.9×10⁶ m/s
    vy = −5.9×10⁶ m/s (downward)
    K = ½mv² = ½(9.11×10⁻³¹)(5.9×10⁶)² = 1.6×10⁻¹⁷ J

(c) vy = v0y + ay t:

    t = (vy − v0y)/ay = (−5.9×10⁶ − 0)/(−1.76×10¹⁵) = 3.4×10⁻⁹ s

(Could also solve y = y0 + v0y t + ½ ay t² for t.) Subatomic particles give
very different magnitudes from everyday objects.

### Example 21.8 — An electron trajectory [s100–104]

Same field; electron launched with horizontal velocity v0. Find the
trajectory.

    ax = 0,  ay = −eE/m;  at t = 0: x0 = y0 = 0, v0x = v0, v0y = 0
    x = v0 t,   y = ½ ay t² = −(eE/2m) t²
    eliminate t:  y = −(eE / 2m v0²) x²

A **parabola**, like a projectile launched horizontally under gravity.
Curvature depends on E. Reversing the plate charges reverses E and the
electron curves up instead — this is how oscilloscopes "steer" electron
beams.

---

## 21.5 Electric-Field Calculations [s105–134]

### Charge densities [s106]

- λ = **linear** charge density (charge along a line), C/m
- σ = **surface** charge density, C/m²
- ρ = **volume** charge density, C/m³

### Superposition of fields [s107]

The total field at P is the vector sum of the fields of the individual
charges:

    E = F0/q0 = E1 + E2 + E3 + ...

### Example 21.9 — Field of an electric dipole [s108–121]

q1 = +12 nC and q2 = −12 nC, 0.10 m apart on the x-axis (equal and opposite
charges = **electric dipole**). Fig. 21.23 [s109]: point a is between them,
6.0 cm from q1 and 4.0 cm from q2; point b is 4.0 cm to the left of q1
(14.0 cm from q2); point c is above the midpoint, 13.0 cm from each charge
(angle α at each charge between the x-axis and the line to c, with
cos α = 5/13). Find E1, E2 and the total field at a, b, c.

(a) Point a: E1 (from +q1, pointing away from q1) and E2 (from −q2, pointing
toward q2) are **both to the right**.

    E1 = (9.0×10⁹)(12×10⁻⁹)/(0.060)² = 3.0×10⁴ N/C
    E2 = (9.0×10⁹)(12×10⁻⁹)/(0.040)² = 6.8×10⁴ N/C
    (Ea)x = 3.0×10⁴ + 6.8×10⁴ = 9.8×10⁴ N/C,  (Ea)y = 0
    Ea = (9.8×10⁴ N/C) î

(b) Point b: E1 points left (away from q1), E2 points right (toward q2).

    E1 = (9.0×10⁹)(12×10⁻⁹)/(0.040)² = 6.8×10⁴ N/C   → E1x = −6.8×10⁴
    E2 = (9.0×10⁹)(12×10⁻⁹)/(0.140)² = 0.55×10⁴ N/C  → E2x = +0.55×10⁴
    (Eb)x = (−6.8 + 0.55)×10⁴ = −6.2×10⁴ N/C,  (Eb)y = 0
    Eb = (−6.2×10⁴ N/C) î

(c) Point c: equidistant, equal charge magnitudes → equal magnitudes.

    E1 = E2 = (9.0×10⁹)(12×10⁻⁹)/(0.13)² = 6.39×10³ N/C
    E1x = E2x = E1 cos α = (6.39×10³)(5/13) = 2.46×10³ N/C
    y-components equal and opposite → cancel
    (Ec)x = 2(2.46×10³) = 4.9×10³ N/C,  (Ec)y = 0
    Ec = (4.9×10³ N/C) î

[slide typos: s116 writes 6.39×10⁴ and s118 writes 2(2.46×10⁴); the correct
values are 6.39×10³ and 2(2.46×10³), as recalculated above and as the final
answer 4.9×10³ N/C confirms]

The field at c is parallel to the line joining the charges.

Alternative (vector form, Eq. 21.7): from q1 to c, r̂1 = cos α î + sin α ĵ;
from q2 to c, r̂2 = −cos α î + sin α ĵ. With q2 = −q1:

    Ec = (1/4πε0)(q1/r²)(cos α î + sin α ĵ) + (1/4πε0)(−q1/r²)(−cos α î + sin α ĵ)
       = (1/4πε0)(q1/r²)(2 cos α) î
       = (9.0×10⁹)(12×10⁻⁹)/(0.13)² × 2(5/13) î = (4.9×10³ N/C) î

### Example 21.10 — Field of a ring of charge [s122–134]

Ring of radius a, total charge Q spread uniformly. Find E at point P on the
ring's axis, distance x from the centre. Figure: ring in the yz-plane, P on
the x-axis; a small segment ds with charge dQ is distance r = √(x² + a²)
from P; its field dE makes angle α with the x-axis.

1. Split the ring into segments ds, each with charge dQ acting as a point
   charge. Total E = sum of all dE.
2. Symmetry: segments at opposite sides (top/bottom) give dE with the same
   x-component but opposite y-components → perpendicular components cancel.
   Only Ex survives.
3. For one segment:

       dE  = (1/4πε0) dQ/(x² + a²)
       cos α = x/r = x/(x² + a²)^½
       dEx = dE cos α = (1/4πε0) x dQ/(x² + a²)^{3/2}

4. Integrate: x and a are the same for every segment, so only dQ is
   integrated, and ∫dQ = Q:

       E = Ex î = (1/4πε0) Q x/(x² + a²)^{3/2} î        (21.8)

Checks:
- Centre (x = 0): E = 0 — opposite sides push equally in opposite
  directions.
- Far away (x ≫ a): denominator ≈ x³, so E ≈ (1/4πε0) Q/x² î — the ring
  looks like a point charge.
- Symmetry arguments only work in special cases: off the axis, E has both x
  and y components.

---

## 21.6 Electric Field Lines [s135–140]

- **Field line**: imaginary line drawn so that its **tangent** at every point
  is in the direction of E there.
- Direction of E at a point = tangent to the field line through that point,
  in the direction of the arrows (figure: curved line with E_P and E_R
  tangent at points P and R).
- Field is **strong where lines are close together**, weak where they are far
  apart. More precisely: E is proportional to the number of lines crossing a
  small perpendicular area, divided by that area.
- Rules for sketching:
  - Lines start only on **positive** charges and end only on **negative**
    charges.
  - Number of lines starting on (or ending on) a charge is proportional to
    the charge's magnitude.
  - **Field lines never cross.**
- Figure [s139–140]: (a) single positive charge — lines radially outward;
  (b) + and − charges of equal magnitude (dipole) — lines curve from + to −;
  (c) two equal positive charges — lines repel each other, no lines connect
  the two charges, and the field is zero midway between them.

---

## 21.7 Electric Dipoles [s141–160]

- **Electric dipole**: a pair of point charges of equal magnitude and
  opposite sign (+q and −q) separated by distance d.
- **Dipole moment** p: magnitude p = qd, direction from the **negative toward
  the positive** charge.
- In a **uniform** field [s143, figure]: F+ = qE (along E) and F− = −qE
  (opposite) → **net force is zero**. But the two forces act along different
  lines → there is a **torque** (into the page in the figure, rotating the
  dipole clockwise). φ = angle between p and E; the lever arm is d sin φ.

      τ = pE sin φ        (magnitude of torque on a dipole)
      τ = p × E           (vector form)
      U = −p · E = −pE cos φ   (potential energy of a dipole in a field)

  The torque tends to rotate p to line up with E (U is lowest when p is
  parallel to E).

### Example 21.14 — Force and torque on a dipole [s146–152]

Uniform field 5.0 × 10⁵ N/C parallel to the page. Charges ±1.6 × 10⁻¹⁹ C,
separated by 0.125 nm = 0.125 × 10⁻⁹ m (typical molecular sizes). Figure:
+q at lower left, −q at upper right; the dipole axis makes 35° with E, and
p (from − to +) is at φ = 145° from E. Find (a) net force, (b) dipole
moment, (c) torque, (d) potential energy.

(a) Uniform field → forces equal and opposite → net force zero.

(b)

    p = qd = (1.6×10⁻¹⁹)(0.125×10⁻⁹) = 2.0×10⁻²⁹ C·m

Direction: from − to +, 145° clockwise from the field direction.

(c)

    τ = pE sin φ = (2.0×10⁻²⁹)(5.0×10⁵) sin 145° = 5.7×10⁻²⁴ N·m

Right-hand rule for p × E: **out of the page** → counterclockwise torque,
tending to align p with E.

(d)

    U = −pE cos φ = −(2.0×10⁻²⁹)(5.0×10⁵) cos 145° = 8.2×10⁻²⁴ J

All tiny — it's a single molecule.

### Example 21.15 — Dipole field far away on its axis [s153–160]

Dipole centred at the origin, p along +y (+q at y = d/2, −q at y = −d/2).
Find E at a point on the y-axis with y ≫ d. Use the binomial expansion
(1 + x)ⁿ ≈ 1 + nx + n(n − 1)x²/2 + ... for |x| < 1.

Superposition: + charge's field is up (+y), − charge's field is down.

    Ey = (q/4πε0) [ 1/(y − d/2)² − 1/(y + d/2)² ]
       = (q/4πε0y²) [ (1 − d/2y)⁻² − (1 + d/2y)⁻² ]

For y ≫ d, d/2y ≪ 1. Using n = −2 and keeping two terms:

    (1 − d/2y)⁻² ≈ 1 + d/y,    (1 + d/2y)⁻² ≈ 1 − d/y
    Ey ≈ (q/4πε0y²) [ (1 + d/y) − (1 − d/y) ] = qd/(2πε0 y³) = p/(2πε0 y³)

[slide typo: s159 writes (y − d/s)²(y + d/s)²; should be d/2]

- Far from a dipole (any direction) the field falls off as **1/r³**.
  Compare: point charge 1/r², long line charge 1/r, large sheet independent
  of r. An **electric quadrupole** (two opposite dipoles close together)
  falls off as 1/r⁴.

---

## Chapter summary [s161–171]

- **Charge, conductors, insulators**: two kinds of charge; like repel,
  unlike attract. Charge is conserved in an isolated system. Matter =
  protons, neutrons, electrons; nucleus held together by the nuclear force,
  electrons far outside. Electric interactions are mainly responsible for
  the structure of atoms, molecules and solids. Conductors let charge move
  easily, insulators don't; most metals conduct, most non-metals insulate.
- **Coulomb's law**: F = (1/4πε0)|q1q2|/r², with 1/4πε0 = 8.988 × 10⁹
  N·m²/C²; force along the line joining the charges; repulsive for like
  signs, attractive for unlike. SI unit of charge: coulomb (C). Several
  charges → vector sum of the individual forces.
- **Electric field**: E = F0/q0, force per unit charge on a test charge.
  Point charge: E = (1/4πε0)(q/r²) r̂, radially away from (+) or toward (−)
  the charge.
- **Superposition of fields**: E of any set of charges = vector sum of the
  individual fields. Continuous distributions: split into small elements,
  find each element's field, add (usually by integrating). Densities λ, σ, ρ.
- **Field lines**: tangent gives the direction of E; lines per unit
  perpendicular area ∝ |E|.
- **Dipoles**: equal and opposite charges q separated by d; p = qd, from −
  to +. Torque τ = p × E, |τ| = pE sin φ; potential energy U = −p · E.

---

## Homework [s172–177]

"Hand in your homework every Tuesday!" Assigned: **21.33** and **21.44**.

**21.33** An electron is projected with initial speed v0 = 1.60 × 10⁶ m/s into
the uniform field between parallel plates. The field between the plates is
uniform and directed vertically **downward**; the field outside the plates is
zero. The electron enters midway between the plates. Figure [s175]: plates
2.00 cm long, 1.00 cm apart; the electron enters horizontally at mid-height
and curves upward (dashed path) to the upper plate's far edge.
- (a) If the electron just misses the upper plate as it emerges from the
  field, find the magnitude of the electric field.
- (b) Suppose the electron is replaced by a proton with the same initial
  speed v0. Would the proton hit one of the plates? If not, what would be the
  magnitude and direction of its vertical displacement as it exits the
  region between the plates?
- (c) Compare the paths traveled by the electron and the proton and explain
  the difference.
- (d) Discuss whether it is reasonable to ignore the effects of gravity for
  each particle.

**21.44** The two charges q1 and q2 shown have equal magnitudes. Figure
[s177]: q1 on the left and q2 on the right on a horizontal line; point A is
midway between them; B is directly above A and C directly below A, on the
perpendicular bisector. What is the direction of the net electric field due
to the two charges at points A, B, and C if
- (a) both charges are positive,
- (b) both charges are negative,
- (c) q1 is positive and q2 is negative.

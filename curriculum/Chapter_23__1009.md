# Chapter 23 — Electric Potential

Read-optimized companion to `Chapter_23__1009.pdf` (37 lecture slides, dated
2026/10/10). Slide numbers are given as `[sN]` so you can find the original
slide. Figures are described in words. Where a slide has an obvious
typo, it's kept as written and the correction is noted in a `[note: ...]`.

This deck stops at the end of Example 23.2 — it only covers section 23.1 of
the 5-section outline below. The rest of the chapter presumably comes in a
later deck.

## Objectives and outline [s2–s3]

Objectives:
- Work done on a charged particle in an electric field
- The concept of electric potential
- Potential difference between one point and another

Outline:
1. Electric Potential Energy
2. Electric Potential
3. Calculating Electric Potential
4. Equipotential Surfaces
5. Potential Gradient

## 23.1 Electric Potential Energy

### Definition [s4]

**Potential Energy $U$** is the work when a conservative force acts on a
particle to move it from one point to another.

$$W_{a\to b} = U_a - U_b = -(U_b - U_a) = -\Delta U \qquad (23.2)$$

(work done by a conservative force)

### Uniform field [s5–s7]

- In a uniform field, the force on a test charge is constant and independent
  of its location.
- The work done by this force is also independent of the particle's path:

$$W_{a\to b} = -(U_b - U_a) = qE(y_a - y_b)$$

Figure [s5]: point charge $q_0$ between a positive plate (top) and negative
plate (bottom), $\vec E$ pointing down, force $\vec F = q_0\vec E$ down. Two
different paths from $a$ to $b$ (separation $d$) are drawn. Caption: the work
done by the electric force is the same for any path from $a$ to $b$:
$W_{a\to b} = -\Delta U = q_0 E d$.

Figure [s6] — positive charge:
- (a) Positive charge moves **in the direction of** $\vec E$ (from height
  $y_a$ down to $y_b$): field does **positive** work on the charge, **$U$
  decreases**.
- (b) Positive charge moves **opposite** $\vec E$ (from $y_a$ up to $y_b$):
  field does **negative** work, **$U$ increases**.

Figure [s7] — negative charge (force $\vec F = q_0\vec E$ now points up,
opposite $\vec E$):
- (a) Negative charge moves **in the direction of** $\vec E$: field does
  **negative** work, **$U$ increases**.
- (b) Negative charge moves **opposite** $\vec E$: field does **positive**
  work, **$U$ decreases**.

### Beyond uniform fields — point charge [s8–s10]

- Electric potential energy isn't restricted to a uniform field.
- It applies to a point charge in any electric field caused by a static
  charge distribution.
- Figure [s9]: test charge $q_0$ moves from $a$ to $b$ along a radial line
  away from point charge $q$; distances $r_a$, $r$, $r_b$ measured from $q$;
  $\vec E$ points radially outward.
- The work done by the electric force moving the test charge from $a$ to $b$
  is **the same for all possible paths** from $a$ to $b$.
- Figure [s10]: $a$ and $b$ not on the same radial line; $q_0$ takes an
  arbitrary curved path. At each step, displacement $d\vec l$ makes angle
  $\phi$ with $\vec F$; only the radial part $dr$ of each step matters.

### Potential energy of two point charges [s11]

$$U = \frac{1}{4\pi\varepsilon_0}\frac{q q_0}{r} \qquad (23.9)$$

(electric potential energy of two point charges $q$ and $q_0$)

- Potential energy is always defined relative to some reference point where
  $U = 0$.

### Shared property [s12–s13]

- $U$ is a **shared property** of the two charges $q$ and $q_0$ — it's a
  consequence of the interaction (attractive or repulsive) between them.
- Graph [s13] of $U$ vs $r$:
  - (a) $q$ and $q_0$ **same sign** (both + or both −): $U > 0$. As
    $r \to 0$, $U \to +\infty$. As $r \to \infty$, $U \to 0$. Curve comes
    down from $+\infty$ toward zero.
  - (b) $q$ and $q_0$ **opposite signs**: $U < 0$. As $r \to 0$,
    $U \to -\infty$. As $r \to \infty$, $U \to 0$. Curve comes up from
    $-\infty$ toward zero.

### Example 23.1 — Conservation of energy with electric forces [s14–s29]

**Problem [s14–s15].** A positron (antiparticle of the electron) has mass
$9.11\times10^{-31}\,\text{kg}$ and charge $+e = +1.6\times10^{-19}\,\text{C}$.
It moves near an alpha particle with charge $+2e = 3.2\times10^{-19}\,\text{C}$.
The alpha particle is over 7000 times as massive, so assume it stays at rest.
When the positron is $1.00\times10^{-10}\,\text{m}$ from the alpha particle,
it is moving directly away at $3.00\times10^{6}\,\text{m/s}$.

- (a) What is the positron's speed when the particles are
  $2.00\times10^{-10}\,\text{m}$ apart?
- (b) What is its speed when very far away from the alpha particle?
- (c) How would the situation change if the moving particle were an electron
  (same mass, opposite charge)?

**Identify [s16].** The electric force is conservative, so mechanical energy
(kinetic + potential) is conserved.

**Set Up [s17].** Use $K_a + U_a = K_b + U_b$ (Eq. 23.3) and $U$ from
Eq. (23.9). We know everything at point $a$ ($r_a = 1.00\times10^{-10}$ m).
Find the speed at two different $r$ values for (a) and (b), and replace $+e$
by $-e$ for (c).

**Execute (a) [s18–s21].** $r_b = 2.00\times10^{-10}$ m. Solve energy
conservation for $K_b$:

$$K_b = K_a + U_a - U_b$$

$$K_a = \tfrac12 m v_a^2 = \tfrac12(9.11\times10^{-31}\,\text{kg})(3.00\times10^{6}\,\text{m/s})^2 = 4.10\times10^{-18}\,\text{J}$$

[note: slide writes $9.11\times10^{31}$ kg here and on s21/s23 — the exponent
should be $-31$.]

$$U_a = \frac{1}{4\pi\varepsilon_0}\frac{qq_0}{r_a} = (9.0\times10^{9}\,\text{N·m}^2/\text{C}^2)\frac{(3.20\times10^{-19}\,\text{C})(1.60\times10^{-19}\,\text{C})}{1.00\times10^{-10}\,\text{m}} = 4.61\times10^{-18}\,\text{J}$$

$$U_b = (9.0\times10^{9})\frac{(3.20\times10^{-19})(1.60\times10^{-19})}{2.00\times10^{-10}} = 2.30\times10^{-18}\,\text{J}$$

[note: slides s19–s20 write the charges as $3.20\times10^{-9}$ C and
$1.60\times10^{9}$ C — both exponents should be $-19$. The final answers on the
slides are correct for the $-19$ values.]

$$K_b = 4.10\times10^{-18} + 4.61\times10^{-18} - 2.30\times10^{-18} = 6.41\times10^{-18}\,\text{J}$$

$$v_b = \sqrt{\frac{2K_b}{m}} = \sqrt{\frac{2(6.41\times10^{-18}\,\text{J})}{9.11\times10^{-31}\,\text{kg}}} = 3.8\times10^{6}\,\text{m/s}$$

The force is repulsive, so the positron speeds up as it moves away.

**Execute (b) [s22–s24].** As $r_b \to \infty$, $U_b \to 0$:

$$K_b = 4.10\times10^{-18} + 4.61\times10^{-18} - 0 = 8.71\times10^{-18}\,\text{J}$$

$$v_b = \sqrt{\frac{2(8.71\times10^{-18})}{9.11\times10^{-31}}} = 4.4\times10^{6}\,\text{m/s}$$

From $r = 2.00\times10^{-10}$ m to infinity, the extra work increases the
speed by only about 16%, because the electric force decreases rapidly with
distance.

**Execute (c) [s25–s28].** If the moving charge is negative, the force is
attractive, so it slows down. The only change: both potential energies are
negative.

At $r_b = 2.00\times10^{-10}$ m:

$$K_b = 4.10\times10^{-18} + (-4.61\times10^{-18}) - (-2.30\times10^{-18}) = 1.79\times10^{-18}\,\text{J}$$

$$v_b = \sqrt{2K_b/m} = 2.0\times10^{6}\,\text{m/s}$$

At $r_b = \infty$:

$$K_b = 4.10\times10^{-18} + (-4.61\times10^{-18}) - 0 = -5.1\times10^{-19}\,\text{J}$$

Kinetic energy can never be negative, so the electron can **never reach**
$r_b = \infty$. The attraction brings it to a halt at a finite distance. You
can find that distance by setting $K_b = 0$ in the energy-conservation
equation (see Exercise 23.8).

**Evaluate [s29].** Compare with Fig. 23.6 (the $U$ vs $r$ graphs, s13).
- (a), (b): same-sign charges; since $r_b > r_a$, $U_b$ is less than $U_a$.
- (c): opposite signs; since $r_b > r_a$, $U_b$ is greater (less negative)
  than $U_a$.

### Many charges — superposition [s30–s31]

- The total electric field at each point is the **vector sum** of the fields
  due to the individual charges.
- The total work done on $q_0$ during any displacement is the sum of the
  contributions from the **individual charges**:

$$U = \frac{q_0}{4\pi\varepsilon_0}\left(\frac{q_1}{r_1} + \frac{q_2}{r_2} + \frac{q_3}{r_3} + \cdots\right) = \frac{q_0}{4\pi\varepsilon_0}\sum_i \frac{q_i}{r_i} \qquad (23.10)$$

(point charge $q_0$ and collection of charges $q_i$)

- For every electric field due to a static charge distribution, the force
  exerted by that field is **conservative**.
- Figure [s31]: $q_0$ at point $a$, with distances $r_1, r_2, r_3$ to charges
  $q_1, q_2, q_3$.

### Example 23.2 — A system of point charges [s32–s37]

**Problem [s32].** On the $x$-axis: $q_1 = -e$ at $x = 0$ and $q_2 = +e$ at
$x = a$.
- (a) Find the work an external force must do to bring a third charge
  $q_3 = +e$ from infinity to $x = 2a$.
- (b) Find the total potential energy of the three-charge system.

**Identify and Set Up [s33].** Final arrangement: $q_1 = -e$ at $x=0$,
$q_2 = +e$ at $x=a$, $q_3 = +e$ at $x=2a$. Find the potential energy
associated with $q_3$ in the presence of $q_1$ and $q_2$; then find the
total potential energy of the system.

**Execute (a) [s34–s35].** Work by the external force $\vec F_{ext}$ = (U of
$q_3$ at $x = 2a$) − (U when infinitely far away). The second is zero, so
$W = U$. Distances: $r_{13} = 2a$, $r_{23} = a$. From Eq. (23.10):

$$W = U = \frac{q_3}{4\pi\varepsilon_0}\left(\frac{q_1}{r_{13}} + \frac{q_2}{r_{23}}\right) = \frac{+e}{4\pi\varepsilon_0}\left(\frac{-e}{2a} + \frac{+e}{a}\right) = \frac{+e^2}{8\pi\varepsilon_0 a}$$

Bringing $q_3$ in along $+x$, it is attracted by $q_1$ but repelled more
strongly by $q_2$, so positive work must be done to push it to $x = 2a$.

**Execute (b) [s36].**

$$U = \frac{1}{4\pi\varepsilon_0}\sum_{i<j}\frac{q_i q_j}{r_{ij}} = \frac{1}{4\pi\varepsilon_0}\left(\frac{q_1q_2}{r_{12}} + \frac{q_1q_3}{r_{13}} + \frac{q_2q_3}{r_{23}}\right) = \frac{1}{4\pi\varepsilon_0}\left(\frac{(-e)(e)}{a} + \frac{(-e)(e)}{2a} + \frac{(e)(e)}{a}\right) = \frac{-e^2}{8\pi\varepsilon_0 a}$$

**Evaluate [s37].** The result in (b) is negative, so the system has lower
potential energy than if the three charges were infinitely far apart. An
external force would have to do **negative** work to assemble the
arrangement from infinity, and **positive** work to move the three charges
back to infinity.

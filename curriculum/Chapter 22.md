# Chapter 22 — Gauss's Law

Read-optimized companion to `Chapter 22.pdf` (126 lecture slides, dated
2026/10/10). Slide numbers are given as `[sN]` so you can find the original
slide. Figures are described in words. Where a slide has an obvious typo,
it's kept as written and the correction is noted in a `[note: ...]`.

## Objectives and outline [s2–s3]

Objectives:
- To know that Gauss's law uses symmetry considerations to simplify
  electric-field calculations.
- To understand that Gauss's law is a relation between the field at all the
  points on an imaginary surface enclosing any general distribution of
  charge, and the total charge enclosed within the surface.
- To gain deeper insights into electric charge distribution and electric
  fields.

Outline:
1. Charge and Electric Flux
2. Calculating Electric Flux
3. Gauss's Law
4. Applications of Gauss's Law
5. Charges on Conductors

## 22.1 Charge and Electric Flux [s4–s14]

### Probing a box [s4–s6]

- Figure [s4]: a closed surface (a box) containing an unknown amount of
  charge ("?").
- Use a test charge $q_0$ **outside** the box to probe the charge inside.
  Figure [s5]: a box with a charge $q$ inside; $\vec E$ arrows at many points
  around it point outward.
- Measure the force $\vec F$ on the test charge at different positions and
  map the field outside, $\vec E = \vec F/q_0$.
- From this 3-D map, the exact value of the point charge inside the box can
  be found.

### Sign of the charge → direction of flux [s7–s10]

- Electric field vectors ("electric flux") from **positive** charges:
  - (a) Positive charge inside box → **outward** flux.
  - (b) Positive charges inside box → outward flux.
- **Positive** point charge: **outward** electric flux.
- Electric field vectors from **negative** charges:
  - (c) Negative charge inside box → **inward** flux.
  - (d) Negative charges inside box → inward flux.
- **Negative** point charge: **inward** electric flux.

### Zero net charge → zero net flux [s11]

When there is **no net charge** inside the box, there is **no net electric
flux** into or out of it. Three cases (figure):
- (a) No charge inside box, $\vec E = 0$: zero flux.
- (b) Zero **net** charge inside ($+q$ and $-q$): inward flux cancels outward
  flux.
- (c) No charge inside box, but the box sits in the field of a nearby
  uniformly charged sheet ($+\sigma$): field lines go in one side and out the
  other — inward flux cancels outward flux.

### Defining flux (box version) [s12–s13]

- **Definition:** for each face of the box, take the product of the average
  perpendicular component of $\vec E$ and the area of that face. Then add up
  the results from all faces.
- So the net electric flux through the box's surface is directly
  proportional to **the magnitude of the net charge** enclosed, independent of
  the box's size.
- Figure [s13]:
  - (a) Positive charge $+q$ inside a box → outward flux.
  - (b) Same box, twice the charge ($+2q$) → twice the outward flux.
  - (c) Box twice the dimensions, same charge $+q$ → same outward flux as (a).

### Qualitative statement of Gauss's law [s14]

1. Whether there is a net outward or inward flux through a closed surface
   depends on **the sign of the enclosed charge**.
2. Charges **outside** the surface **do not give** a net electric flux
   through the surface.
3. The **net electric flux** is directly proportional to **the net amount**
   of charge enclosed **within** the surface, but otherwise independent of the
   size of the closed surface.

## 22.2 Calculating Electric Flux [s15–s44]

### Fluid-flow analogy [s15–s16]

Volume flow rate of fluid through a wire rectangle of area $A$ in a fluid
moving at velocity $\vec v$:
- (a) $vA$ when the rectangle is perpendicular to $\vec v$ (face-on);
- (b) $vA\cos\phi$ when the rectangle is tilted at angle $\phi$. (Figure: the
  rectangle's area vector $\vec A$ makes angle $\phi$ with $\vec v$; the
  effective area facing the flow is $A_\perp = A\cos\phi$.)

Replace the fluid velocity $\vec v$ by the electric field $\vec E$ to get
electric flux.

### Flat surface in a uniform field [s17–s20]

- (a) **Face-on** to $\vec E$: $\vec E$ and $\vec A$ parallel ($\phi = 0$).
  Flux $\Phi_E = \vec E\cdot\vec A = EA$.
- (b) **Tilted** by angle $\phi$ from face-on: angle between $\vec E$ and
  $\vec A$ is $\phi$. Flux $\Phi_E = \vec E\cdot\vec A = EA\cos\phi$.
- (c) **Edge-on** to $\vec E$: $\vec E$ and $\vec A$ perpendicular
  ($\phi = 90°$). Flux $\Phi_E = \vec E\cdot\vec A = EA\cos90° = 0$.

For a uniform field and a flat surface:

$$\Phi_E = EA\cos\phi = E_\perp A = \vec E\cdot\vec A$$

- SI unit of electric flux: **1 N·m²/C**.

### Vector area and sign convention [s21]

- Vector area: $\vec A = A\hat n$.
- The direction of $\hat n$ is defined as **outward**, with the corresponding
  flux moving out of a closed surface.
- **Outward** flux → **positive** $\Phi_E$. **Inward** flux → **negative**
  $\Phi_E$.

### General definition [s22]

$$\Phi_E = \int E\cos\phi\,dA = \int E_\perp\,dA = \int\vec E\cdot d\vec A \qquad (22.5)$$

### Example 22.1 — Electric flux through a disk [s23–s28]

**Problem.** A disk of radius 0.10 m has its normal unit vector $\hat n$ at
30° to a uniform field $\vec E$ of magnitude $2.0\times10^{3}$ N/C. (A disk
isn't a closed surface — no "inside" or "outside" — so we must specify the
direction of $\hat n$.)
- (a) Flux through the disk?
- (b) Flux if the disk is turned so its normal is perpendicular to $\vec E$?
- (c) Flux if $\hat n$ is parallel to $\vec E$?

**Identify and Set Up.** Flat surface in a uniform field:
$\Phi_E = EA\cos\phi$. The flux depends on the angle between $\hat n$ and
$\vec E$.

**Execute.**
- (a) $A = \pi(0.10\,\text{m})^2 = 0.0314$ m², $\phi = 30°$:

$$\Phi_E = EA\cos\phi = (2.0\times10^{3}\,\text{N/C})(0.0314\,\text{m}^2)(\cos30°) = 54\,\text{N·m}^2/\text{C}$$

- (b) Normal ⟂ $\vec E$: $\phi = 90°$, $\cos\phi = 0$, $\Phi_E = 0$. No flux.
- (c) Normal ∥ $\vec E$: $\phi = 0$, $\cos\phi = 1$:

$$\Phi_E = (2.0\times10^{3}\,\text{N/C})(0.0314\,\text{m}^2)(1) = 63\,\text{N·m}^2/\text{C}$$

**Evaluate.** (b) < (a) < (c). The slide asks: is all this as it should be?

### Example 22.2 — Electric flux through a cube [s29–s37]

**Problem.** A cube of side $L$ in a uniform field $\vec E$. Find the flux
through each face and the total flux when
- (a) two faces are perpendicular to $\vec E$ (Fig. a);
- (b) the cube is turned by angle $\theta$ (Fig. b).

Figure [s30]: outward unit normals $\hat n_1 \dots \hat n_6$, one per face.
(a) $\vec E$ points along $\hat n_2$ (into face 1, out of face 2); faces 3–6
are parallel to $\vec E$. (b) Cube rotated by $\theta$ about the vertical
axis; $\hat n_1$ makes angle $\theta$ with $-\vec E$, $\hat n_4$ makes
$90° - \theta$ with $\vec E$.

**Identify and Set Up.** $\vec E$ is uniform and each face is flat: find the
flux through each face, then add the six.

**Execute (a).** Each unit vector points outward. Angle between $\vec E$ and
$\hat n_1$ is 180°; between $\vec E$ and $\hat n_2$ is 0°. Each face has area
$L^2$:

$$\Phi_{E_1} = \vec E\cdot\hat n_1 A = EL^2\cos180° = -EL^2$$
$$\Phi_{E_2} = \vec E\cdot\hat n_2 A = EL^2\cos0° = +EL^2$$
$$\Phi_{E_3} = \Phi_{E_4} = \Phi_{E_5} = \Phi_{E_6} = EL^2\cos90° = 0$$

Flux is negative on face 1 ($\vec E$ into the cube), positive on face 2
($\vec E$ out of the cube). Total:

$$\Phi_E = -EL^2 + EL^2 + 0 + 0 + 0 + 0 = 0$$

**Execute (b).** Faces 1 and 3: $\vec E$ points in → negative flux. Faces 2
and 4: $\vec E$ points out → positive flux.

$$\Phi_{E_1} = \vec E\cdot\hat n_1 A = EL^2\cos(180° - \theta) = -EL^2\cos\theta$$
$$\Phi_{E_2} = \vec E\cdot\hat n_2 A = +EL^2\cos\theta$$
$$\Phi_{E_3} = \vec E\cdot\hat n_3 A = EL^2\cos(90° + \theta) = -EL^2\sin\theta$$
$$\Phi_{E_4} = \vec E\cdot\hat n_4 A = EL^2\cos(90° - \theta) = +EL^2\sin\theta$$
$$\Phi_{E_5} = \Phi_{E_6} = EL^2\cos90° = 0$$

$$\Phi_E = \Phi_{E_1} + \Phi_{E_2} + \Phi_{E_3} + \Phi_{E_4} + \Phi_{E_5} + \Phi_{E_6} = 0$$

**Evaluate.** There is zero net flux of a uniform field through a closed
surface that contains no charge.

### Example 22.3 — Electric flux through a sphere [s38–s44]

**Problem.** A positive point charge $q = 3.0\,\mu\text{C}$ is surrounded by a
sphere of radius 0.20 m centred on it. Find the flux through the sphere.

**Identify and Set Up.** The surface isn't flat and the field isn't uniform,
so use the general definition of flux, Eq. (22.5).
[note: slide s39 says "general direction of electric flux" — it means
"general definition".]
Because the sphere is centred on the charge, at every point $\vec E$ points
out of the sphere, perpendicular to the surface. Outward is positive for both
$\hat n$ and $E_\perp$, so $E_\perp = E$ and the flux through an element is
$\vec E\cdot d\vec A = E\,dA$. This greatly simplifies the integral.

**Execute.**

$$E = \frac{q}{4\pi\varepsilon_0 r^2} = (9.0\times10^{9}\,\text{N·m}^2/\text{C}^2)\frac{3.0\times10^{-6}\,\text{C}}{(0.20\,\text{m})^2} = 6.75\times10^{5}\,\text{N/C}$$

$E$ is the same at every point, so it comes outside $\Phi_E = \int E\,dA$.
What's left, $\int dA$, is the total area $A = 4\pi r^2$:

$$\Phi_E = EA = (6.75\times10^{5}\,\text{N/C})(4\pi)(0.20\,\text{m})^2 = 3.4\times10^{5}\,\text{N·m}^2/\text{C}$$

**Evaluate.**
- We divided by $r^2 = (0.20\,\text{m})^2$ to find $E$, then multiplied by
  $r^2$ to find $\Phi_E$ — so the radius **cancels**. A sphere of radius
  2.0 m or 200 m would give the same flux. Same conclusion as Fig. 22.4 in
  Section 22.1 (boxes of two different sizes enclosing a point charge).
- The flux through **any** surface enclosing a single point charge is
  independent of the shape and size of the surface.
- $\vec E$ (force per unit charge) is useful because it doesn't depend on the
  charge of the body the force acts on.
- **Caution [s44]:** the force on a test charge $q_0$ can vary from point to
  point, so $\vec E$ can too; Eq. (21.4) gives the force only on a point
  charge, not on large bodies where $\vec E$ varies across the body.

## 22.3 Gauss's Law [s45–s68]

### Point charge inside a sphere [s45–s49]

- **Gauss's law:** the total electric flux through any closed surface (a
  surface enclosing a definite volume) is proportional to the total (net)
  electric charge inside the surface.
- For a sphere of radius $R$ centred on a point charge $q$, at every point on
  the surface:

$$E = \frac{1}{4\pi\varepsilon_0}\frac{q}{R^2}$$

- $\vec E$ is perpendicular to the surface with the same magnitude everywhere
  (as in Example 22.3). Total flux = $E$ × total area $A = 4\pi R^2$:

$$\Phi_E = EA = \frac{1}{4\pi\varepsilon_0}\frac{q}{R^2}(4\pi R^2) = \frac{q}{\varepsilon_0}$$

- The flux is **independent of $R$**; it depends only on the enclosed charge
  $q$.
- Field-line picture [s47–s49]: two concentric spheres of radii $R$ and $2R$
  around $q$. Every field line through the smaller sphere also passes through
  the larger one, so the total flux through each is the same. Projecting an
  area element $dA$ on the small sphere onto the large sphere doubles each
  linear dimension, so the element becomes $4\,dA$. The same number of field
  lines and the same flux pass through both elements.

### Irregular surfaces [s50–s53]

- Divide an irregular surface into elements $dA$, compute $E\,dA\cos\phi$ for
  each, and sum by integrating.
- Each element projects onto a corresponding element of a sphere, so the
  total flux through the irregular surface equals the total flux through a
  sphere, which Eq. (22.6) shows is $q/\varepsilon_0$.
- Figure [s51–s52]: (a) an irregular closed surface around $q$ with a small
  sphere of radius $R$ inside it; at an element $dA$ the outward normal makes
  angle $\phi$ with $\vec E$. (b) The projection of $dA$ onto the spherical
  surface is $dA\cos\phi$.

$$\Phi_E = \oint\vec E\cdot d\vec A = \frac{q}{\varepsilon_0} \qquad (22.7)$$

- Eq. (22.7) holds for a surface of **any shape or size**, as long as it is a
  **closed** surface enclosing $q$.
- The **circle on the integral sign** means the integral is always taken over
  a closed surface.

### Signs and field lines [s54–s55]

- Flux is positive where $\vec E$ points **out** of the surface and negative
  where it points **in**. Likewise $E_\perp$ is positive where $\vec E$ points
  out and negative where it points in.
- Field lines can begin or end inside a region only when there is charge in
  that region.
- Figure [s55]: a point charge **outside** a closed surface that encloses no
  charge. A field line from the external charge that enters the surface at one
  point must leave at another ("field line entering surface" / "same field
  line leaving surface").

### General statement [s56–s58]

- The resultant field $\vec E$ at any point is the vector sum of the fields
  of the individual charges.
- Let $Q_{encl}$ be the total charge enclosed by the surface, $\vec E$ the
  total field at the position of area element $d\vec A$, and $E_\perp$ its
  component perpendicular to the plane of that element (parallel to
  $d\vec A$).

**Gauss's law:**

$$\Phi_E = \oint\vec E\cdot d\vec A = \frac{Q_{encl}}{\varepsilon_0}$$

The total electric flux through a closed surface equals the total (net)
electric charge inside the surface, divided by $\varepsilon_0$:

$$\Phi_E = \oint E\cos\phi\,dA = \oint E_\perp\,dA = \oint\vec E\cdot d\vec A = \frac{Q_{encl}}{\varepsilon_0}$$

**Caution [s58]:**
- The closed surface in Gauss's law is **imaginary** — there need not be any
  material object there.
- A closed surface used in Gauss's law is called a **Gaussian surface**.

### Example 22.4 — Electric flux and enclosed charge [s59–s68]

**Problem.** The figure shows the field of two point charges $+q$ and $-q$ of
equal magnitude, opposite sign (an electric dipole). Find the flux through
each of the closed surfaces $A$, $B$, $C$, $D$.

Figure [s60]: $-q$ on the left, $+q$ on the right, field lines running from
$+q$ to $-q$. Surface $A$ surrounds only $+q$; surface $B$ surrounds only
$-q$; surface $C$ is a large surface around both charges; surface $D$ is a
small surface off to the side of $+q$ enclosing no charge. Caption: the net
number of field lines leaving a closed surface is proportional to the total
charge enclosed by that surface.

**Solution [s61–s66].** Gauss's law: total flux through a closed surface =
total enclosed charge ÷ $\varepsilon_0$.
- Surface $A$ (red) encloses the positive charge: $Q_{encl} = +q$.
- Surface $B$ (blue) encloses the negative charge: $Q_{encl} = -q$.
- Surface $C$ (purple) encloses both: $Q_{encl} = 0$.
- Surface $D$ (yellow) encloses no charge: $Q_{encl} = 0$.

So, without any integration: $\Phi_E = +q/\varepsilon_0$ for $A$,
$\Phi_E = -q/\varepsilon_0$ for $B$, and $\Phi_E = 0$ for $C$ and $D$.
[note: slide s66 writes $\varepsilon$ for $\varepsilon_0$.]
The same conclusions follow from comparing the field lines and counting
where they cross each surface.

## 22.4 Applications of Gauss's Law [s67–s99]

### General points [s67–s68]

- Gauss's law is valid for **any** charge distribution and **any** closed
  surface.
- If we know the charge distribution and it has enough **symmetry** to let us
  evaluate the integral, we can find the field.
- If we know the field, we can use Gauss's law to find the charge
  distribution (e.g. charges on conducting surfaces).
- Under electrostatic conditions (charges not moving), any excess charge on a
  solid conductor resides **entirely on the conductor's surface**. Figure
  [s68]: a conductor in cross-section with + charges around its edge;
  Gaussian surface $A$ drawn just inside the conductor.

### Example 22.5 — Field of a charged conducting sphere [s69–s73]

**Problem.** Total positive charge $q$ on a solid conducting sphere of radius
$R$. Find $\vec E$ at any point inside or outside.

Under electrostatic conditions the field inside a solid conductor is zero.
Outside, the field drops off as $1/r^2$, as if all the excess charge were at
the centre.

Graph [s70]: $E$ vs $r$.
- Inside ($r < R$): $E = 0$.
- At the surface: $E(R) = \dfrac{1}{4\pi\varepsilon_0}\dfrac{q}{R^2}$.
- Outside ($r > R$): $E = \dfrac{1}{4\pi\varepsilon_0}\dfrac{q}{r^2}$ — falls to
  $E(R)/4$ at $r = 2R$ and $E(R)/9$ at $r = 3R$.
- Parts of spherical Gaussian surfaces at $r = 2R$ and $r = 3R$ are drawn.

**Identify.** All charge is on the surface; the system has spherical
symmetry.

**Set Up.** Gaussian surface: an imaginary sphere of radius $r$ centred on the
conductor.

**Execute.** A spherically symmetric system looks the same after any
rotation. To find $\vec E$ inside, use a spherical Gaussian surface with
$r < R$ (it encloses no charge, so $E = 0$ there).

**Evaluate.** As $R \to 0$ the sphere becomes a point charge, and the field
is everywhere $E = q/4\pi\varepsilon_0 r^2$.

### Example 22.6 — Field of a line charge [s74–s78]

**Problem.** Charge is spread uniformly along an infinitely long, thin wire,
charge per unit length $\lambda$ (positive). Find $\vec E$. (Approximates a
finite wire when the field point is much closer to the wire than the wire's
length.)

**Identify.** Cylindrical symmetry. $\vec E$ must point away from the
positive charges. Use symmetry (as in 22.5) to pin down its direction and how
its magnitude depends on position.

**Set Up.** Gaussian surface: a cylinder of arbitrary radius $r$ and length
$l$, ends perpendicular to the wire. Figure [s76]: coaxial cylinder around
the wire. On the curved side, $E_\perp = E$ ($d\vec A$ points radially out,
parallel to $\vec E$). On the flat ends, $E_\perp = 0$.

**Execute.** Gauss's law, Eq. (22.8):

$$\Phi_E = (E)(2\pi rl) = \frac{\lambda l}{\varepsilon_0}$$

$$E = \frac{1}{2\pi\varepsilon_0}\frac{\lambda}{r} \qquad \text{(field of an infinite line of charge)}$$

**Evaluate.** The whole wire contributes to the field, but only the charge
**inside** the Gaussian surface is counted when applying Gauss's law.

### Example 22.7 — Field of an infinite plane sheet of charge [s79–s83]

**Problem.** Field of a thin, flat, infinite sheet with uniform positive
surface charge density $\sigma$.

Figure [s79]: a cylindrical Gaussian surface pierces the sheet, ends of area
$A$ on each side; at each end $E_\perp = E$, pointing away from the sheet.

**Identify.** Planar symmetry tells us about the direction and position
dependence of $\vec E$.

**Set Up.** The charge distribution doesn't change in any direction parallel
to the sheet. Gaussian surface: a cylinder with axis perpendicular to the
sheet, ends of area $A$.

**Execute.** The sheet passes through the middle of the cylinder. At each end
$\vec E$ is perpendicular to the sheet; it is parallel to the curved side
walls, so $E_\perp = 0$ there — no flux through the walls. Total flux $= 2EA$.
With $Q_{encl} = \sigma A$, Gauss's law (22.8) gives

$$2EA = \frac{\sigma A}{\varepsilon_0}, \qquad E = \frac{\sigma}{2\varepsilon_0} \qquad \text{(field of an infinite sheet of charge)}$$

The field is uniform and perpendicular to the sheet; field lines are
straight, parallel, and perpendicular to the sheet.

**Evaluate.** We assumed an infinite sheet. $E = \sigma/2\varepsilon_0$ is a
good approximation at points close to the sheet (compared to its size) and
not too near its edges; there, the field is very nearly uniform and
perpendicular to the plane.

### Example 22.8 — Field between oppositely charged parallel conducting plates [s84–s90]

**Problem.** Two large parallel conducting plates with equal and opposite
charges: $+\sigma$ on one, $-\sigma$ on the other. Find $\vec E$ between them.

Figure [s85]:
- (a) Realistic drawing: between the plates the field is nearly uniform,
  pointing from the positive plate to the negative one; near the edges the
  lines bulge outward ("fringing").
- (b) Idealized model: fringing ignored, field between the plates uniform.
  Plate 1 (+) on the left, plate 2 (−) on the right. Point $a$ left of both
  plates, $b$ between them, $c$ right of both. At $a$ and $c$, $\vec E_1$ and
  $\vec E_2$ point opposite ways and cancel; at $b$ they point the same way
  (to the right). Cylindrical Gaussian surfaces $S_1, S_2, S_3, S_4$ (seen
  side-on): $S_1$ has its left end inside plate 1 and right end in the gap;
  $S_4$ has one end inside plate 2 and the other in the gap; $S_2$ and $S_3$
  have one end inside a plate and the other end outside the plates.

**Identify.** Opposite charges attract, so most charge collects on the
**facing** surfaces of the plates; a little sits on the outer surfaces, and
the field fringes at the edges. If the plates are very large compared to
their separation, the outer-surface charge is negligible and fringing can be
ignored except near the edges (Fig. b).

**Set Up.** Use the Gaussian cylinders $S_1 \dots S_4$ with ends of area $A$
(Fig. 22.21). One end of each lies inside one of the conducting plates.

**Execute.** For $S_1$: the left end is inside plate 1 (positive) — no flux
there (field inside a conductor is zero). The field between the plates is
perpendicular to the right end, so $E_\perp = E$ and the flux there is $+EA$
(out of the surface). No flux through the side walls (parallel to $\vec E$).
Total flux = $EA$. Enclosed charge = $\sigma A$:

$$EA = \frac{\sigma A}{\varepsilon_0}, \qquad E = \frac{\sigma}{\varepsilon_0} \qquad \text{(field between oppositely charged conducting plates)}$$

$S_2$, $S_3$, $S_4$ can be analysed similarly.

**Evaluate.** These results can be obtained using superposition of electric
fields, and verified with Gauss's law as well.

### Example 22.9 — Field of a uniformly charged sphere [s91–s95]

**Problem.** Positive charge $Q$ spread uniformly **throughout the volume**
of an **insulating** sphere of radius $R$. Find $E$ at distance $r$ from the
centre. Compare with the conducting sphere.

Graph [s92]: $E$ rises linearly from 0 at $r = 0$ to a peak at $r = R$, then
falls off as $1/r^2$.
- Inside ($r < R$): $E = \dfrac{1}{4\pi\varepsilon_0}\dfrac{Qr}{R^3}$.
- At the surface: $E(R) = \dfrac{1}{4\pi\varepsilon_0}\dfrac{Q}{R^2}$.
- Outside ($r > R$): $E = \dfrac{1}{4\pi\varepsilon_0}\dfrac{Q}{r^2}$.

**Identify.** Spherically symmetric → Gaussian surface is a sphere of radius
$r$ concentric with the charge.

**Execute.**
- By symmetry the total flux is $\Phi_E = 4\pi r^2 E$. The charge enclosed
  depends on $r$.
- Inside ($r < R$): $E$ is proportional to $r$. At the centre ($r = 0$),
  $E = 0$.
- Outside ($r > R$): $E$ varies as $1/r^2$.
- For any spherically symmetric charged body, the field outside it is the
  same as if all the charge were concentrated at the centre.

### Example 22.10 — Field of a hollow charged sphere [s96–s99]

**Problem.** A thin-walled hollow sphere of radius 0.250 m has an unknown
charge spread uniformly over its surface. At 0.300 m from the centre, the
field points directly **toward** the centre with magnitude
$1.80\times10^{2}$ N/C. How much charge is on the sphere?

**Identify and Set Up.** Spherically symmetric. Use a spherical Gaussian
surface concentric with the charge, passing through $r = 0.300$ m.

**Execute.** Flux = $q/\varepsilon_0$. The field points inward, so $E_\perp$
is negative. Solving for $q$:

$$q = -E(4\pi\varepsilon_0 r^2) = -\left(1.80\times10^{2}\,\tfrac{\text{N}}{\text{C}}\right)(4\pi)(8.854\times10^{-12}\,\text{C}^2/\text{N·m}^2)(0.300\,\text{m})^2 = -1.80\times10^{-9}\,\text{C} = -1.80\,\text{nC}$$

**Evaluate.**
- We could do the flux integral because we knew $\vec E$ at every point on
  the Gaussian surface — thanks to the highly symmetric charge distribution.
- If the distribution is irregular or lacks symmetry, Gauss's law isn't very
  useful for calculating the charge distribution from the field, or vice
  versa.

## 22.5 Charges on Conductors [s100–s121]

### Conductors, cavities, and charge inside [s100–s104]

Figures:
- (a) **Solid conductor with charge $q_C$:** the charge sits entirely on the
  surface. Electrostatic situation, so $\vec E = 0$ within the conductor.
- (b) **Same conductor with an internal cavity:** draw an arbitrary Gaussian
  surface $A$ inside the conductor material, around the cavity. Because
  $\vec E = 0$ at all points in the conductor, the field everywhere on this
  Gaussian surface is zero.
- (c) **An isolated charge $q$ placed in the cavity:** for $\vec E$ to be zero
  everywhere on the Gaussian surface, the surface of the cavity must carry
  total charge $-q$. The outer surface then has $q_C + q$.

Text:
- If a small body with charge $q$ is placed inside a cavity of a conductor
  (and insulated from it), the total charge inside Gaussian surface $A$ must
  be zero.
- So a charge $-q$ is spread on the inside surface of the cavity, and a
  charge $+q$ appears on the outer surface of the conductor.
- If the conductor originally had charge $q_C$, the total charge on the outer
  surface after inserting $q$ is $q + q_C$.

### Example 22.11 — A conductor with a cavity [s105–s108]

**Problem.** A conductor (cross-section shown) has total charge $+3$ nC. The
charge inside the cavity, insulated from the conductor, is $-5$ nC. How much
charge is on each surface (inner and outer) of the conductor? (No excess
charge in the bulk material — only on the inner and outer surfaces.)

**Solution.**
- Cavity charge $q = -5$ nC, so the inner cavity surface must carry
  $-q = +5$ nC.
- The conductor's total is $+3$ nC, none in the interior of the material.
- So the outer surface carries $(3\,\text{nC}) - (5\,\text{nC}) = -2$ nC.

Figure: the $-5$ nC charge in the cavity; + signs lining the cavity wall;
− signs spread around the outer surface.

### Faraday's ice-pail experiment and the Van de Graaff generator [s109–s111]

Both experiments test Gauss's law.
- Ice pail [s109]: (a) a charged conducting ball on an insulating thread
  above a metal container on an insulating stand. (b) Ball lowered inside,
  metal lid closed: the charged ball induces charges on the interior and
  exterior of the container. (c) Once the ball touches the container, it
  becomes part of the interior surface; all its charge moves to the
  container's exterior.
- Modern version [s110]: an outer spherical shell is alternately charged and
  discharged by a power supply. If any charge flowed between the inner and
  outer shells, the electrometer inside the inner shell would detect it.
- Van de Graaff generator [s111] ("Van Graff" on slide): used as an
  accelerator of charged particles and for demonstrations. Cutaway: an
  insulating belt driven by a motor runs inside an insulating support up to a
  conducting shell. The electron sink at the bottom draws electrons from the
  belt, giving it a positive charge; at the top the belt attracts electrons
  away from the conducting shell, giving the shell a positive charge.

### Field at the surface of a conductor [s112–s113]

- There is a direct relation between $\vec E$ just outside a conductor and
  the surface charge density $\sigma$ there. Use a small Gaussian cylinder
  with one end (area $A$) just outside the surface and the other inside the
  conductor. Total flux $= E_\perp A$; enclosed charge $= \sigma A$:

$$E_\perp A = \frac{\sigma A}{\varepsilon_0}, \qquad E_\perp = \frac{\sigma}{\varepsilon_0} \qquad (22.10)$$

(field at the surface of a conductor)

- Figure [s113]: on the outer end $E_\perp = E$; on the side walls
  $E_\perp = 0$; on the inner end (inside the conductor) $E = 0$. The field
  just outside a charged conductor is perpendicular to the surface, and
  $E_\perp = \sigma/\varepsilon_0$.

### Example 22.12 — Field at the surface of a conducting sphere [s114–s115]

**Problem.** Verify Eq. (22.10) for a conducting sphere of radius $R$ and
total charge $q$.

**Solution.** The field just outside the surface is

$$E = \frac{1}{4\pi\varepsilon_0}\frac{q}{R^2}$$

The surface charge density is uniform:

$$\sigma = \frac{q}{4\pi R^2}$$

Comparing the two: $E = \sigma/\varepsilon_0$, as Eq. (22.10) states.

### Example 22.13 — Electric field of the earth [s116–s121]

**Problem.** The earth (a conductor) has a net charge. The field near the
surface averages about 150 N/C, directed toward the centre of the earth.
- (a) Corresponding surface charge density?
- (b) Total surface charge of the earth?

**Identify and Set Up.** From the perpendicular field, find $\sigma$. Total
charge = $\sigma$ × earth's surface area.

**Execute.**
- (a) The field points into the surface, so $E_\perp$ is negative and
  $\sigma$ is negative:

$$\sigma = \varepsilon_0 E_\perp = (8.85\times10^{-12}\,\text{C}^2/\text{N·m}^2)(-150\,\text{N/C}) = -1.33\times10^{-9}\,\text{C/m}^2 = -1.33\,\text{nC/m}^2$$

- (b) Surface area $4\pi R_E^2$, $R_E = 6.38\times10^{6}$ m:

$$Q = 4\pi(6.38\times10^{6}\,\text{m})^2(-1.33\times10^{-9}\,\text{C/m}^2) = -6.8\times10^{5}\,\text{C} = -680\,\text{kC}$$

  Or directly:

$$Q = 4\pi\varepsilon_0 R^2 E_\perp = \frac{1}{9.0\times10^{9}\,\text{N·m}^2/\text{C}^2}(6.38\times10^{6}\,\text{m})^2(-150\,\text{N/C}) = -6.8\times10^{5}\,\text{C}$$

**Evaluate.**
- One electron has charge $-1.60\times10^{-19}$ C, so this excess negative
  charge is about **7 moles** of excess electrons.
- It's compensated by an equal deficiency of electrons in the upper
  atmosphere, so the earth plus its atmosphere is electrically neutral.

## Concept summary [s122–s126]

**Electric flux**
- A measure of the "flow" of electric field through a surface.
- Equal to the product of an area element and the perpendicular component of
  $\vec E$, integrated over a surface:

$$\Phi_E = \int E\cos\phi\,dA = \int E_\perp\,dA = \int\vec E\cdot d\vec A \qquad (22.5)$$

**Gauss's law**
- The total flux through a closed surface (the surface integral of the
  component of $\vec E$ normal to the surface) equals a constant times the
  total charge $Q_{encl}$ enclosed.
- Logically equivalent to Coulomb's law, but greatly simplifies problems with
  a high degree of symmetry.
- When excess charge is placed on a solid conductor and is at rest, it sits
  entirely on the surface, and $\vec E = 0$ everywhere in the conductor's
  material.

$$\Phi_E = \oint E\cos\phi\,dA = \oint E_\perp\,dA = \oint\vec E\cdot d\vec A = \frac{Q_{encl}}{\varepsilon_0}$$

**Electric field of various symmetric charge distributions** (all letters
are magnitudes):

| Charge distribution | Point in field | Field magnitude |
|---|---|---|
| Single point charge $q$ | Distance $r$ from $q$ | $E = \dfrac{1}{4\pi\varepsilon_0}\dfrac{q}{r^2}$ |
| Charge $q$ on surface of conducting sphere, radius $R$ | Outside sphere, $r > R$ | $E = \dfrac{1}{4\pi\varepsilon_0}\dfrac{q}{r^2}$ |
| (same) | Inside sphere, $r < R$ | $E = 0$ |
| Infinite wire, charge per unit length $\lambda$ | Distance $r$ from wire | $E = \dfrac{1}{2\pi\varepsilon_0}\dfrac{\lambda}{r}$ |
| Infinite conducting cylinder, radius $R$, charge per unit length $\lambda$ | Outside cylinder, $r > R$ | $E = \dfrac{1}{2\pi\varepsilon_0}\dfrac{\lambda}{r}$ |
| (same) | Inside cylinder, $r < R$ | $E = 0$ |
| Solid insulating sphere, radius $R$, charge $Q$ spread uniformly through volume | Outside sphere, $r > R$ | $E = \dfrac{1}{4\pi\varepsilon_0}\dfrac{Q}{r^2}$ |
| (same) | Inside sphere, $r < R$ | $E = \dfrac{1}{4\pi\varepsilon_0}\dfrac{Qr}{R^3}$ |
| Infinite sheet, uniform charge per unit area $\sigma$ | Any point | $E = \dfrac{\sigma}{2\varepsilon_0}$ |
| Two oppositely charged conducting plates, $+\sigma$ and $-\sigma$ | Any point between plates | $E = \dfrac{\sigma}{\varepsilon_0}$ |
| Charged conductor | Just outside the conductor | $E = \dfrac{\sigma}{\varepsilon_0}$ |

No homework slide in this deck.

# 6.2 Volumes

Source: `6_2Volumes.pdf` (26 slides). Read-optimized companion — see
CLAUDE.md's "Curriculum file formats" rule for when to fall back to the
original.

## 1. Volumes of a Right Cylinder

A cylinder is bounded by a plane region $B_1$ (the base) and a congruent
region $B_2$ in a parallel plane, joined by segments perpendicular to the
base.
$$V=Ah \qquad (\text{special cases: } V=\pi r^2h \text{ for a circular cylinder},\ V=lwh \text{ for a box})$$

## 2. Volumes of Irregular Solids (cross-section area known)

**Cross-section:** intersecting a solid $S$ with a plane gives a plane
region; $A(x)$ is the area of the cross-section through $x$, perpendicular
to the x-axis, and varies as $x$ goes from $a$ to $b$.

Slice into $n$ "slabs" with planes $P_{x_1},\dots,P_{x_n}$:
$$\Delta V_i \approx A(x_i^*)\Delta x \quad\Rightarrow\quad V=\sum_{i=1}^n \Delta V_i \approx \sum_{i=1}^n A(x_i^*)\Delta x \quad\Rightarrow\quad V=\lim_{n\to\infty}\sum_{i=1}^n A(x_i^*)\Delta x = \int_a^b A(x)\,dx$$

**Definition of Volume:** if $S$ lies between $x=a$ and $x=b$ and the
cross-sectional area through $x$ (perpendicular to the x-axis) is the
continuous function $A(x)$, then
$$V=\int_a^b A(x)\,dx$$
*How to get $A(x)$?* It's the area of the moving cross-section obtained by
slicing through $x$ perpendicular to the x-axis.

Sanity check against the cylinder formula: for a cylinder $A(x)=A$
(constant), so $V=\int_a^b A\,dx = A(b-a)$, matching $V=Ah$.

## Volume of the Solids of Revolution

Solids of revolution are obtained by revolving a region about a line. The
cross-section perpendicular to the axis is a circle (disk) or an annular
ring (washer).

**Example 1.** Show the volume of a sphere of radius $r$ is $V=\tfrac{4}{3}\pi r^3$.
Cross-section radius $y=\sqrt{r^2-x^2}$, so $A(x)=\pi(r^2-x^2)$.
$$V=\int_{-r}^r \pi(r^2-x^2)\,dx = 2\int_0^r \pi(r^2-x^2)\,dx = \frac{4}{3}\pi r^3$$
(As the number of approximating cylinders increases — $n=5,10,20$ midpoint
Riemann sums — the sums converge to this value.)

**Example 2.** Volume obtained by rotating $y=\sqrt{x}$, $0\le x\le1$, about
the x-axis. Disk radius $r=\sqrt{x}$, $A(x)=\pi x$.
$$V=\int_0^1 \pi x\,dx = \frac{\pi x^2}{2}\Big|_0^1 = \frac{\pi}{2}$$

**Example 3.** Volume obtained by rotating the region bounded by $y=x^3$,
$x=0$, $y=8$ about the **y-axis**. Slicing through $y$: radius $r=\sqrt[3]{y}$,
$A(y)=\pi y^{2/3}$.
$$V=\int_0^8 \pi y^{2/3}\,dy = \frac{3\pi}{5}y^{5/3}\Big|_0^8 = \frac{96\pi}{5}$$

**Example 4.** Volume obtained by rotating the region bounded by $y=x^2$,
$y=x$ about the **x-axis** (washer method). Outer radius $r_{out}=x$, inner
radius $r_{in}=x^2$.
$$A(x)=\pi r_{out}^2-\pi r_{in}^2=\pi x^2-\pi(x^2)^2 \quad\Rightarrow\quad V=\int_0^1 (\pi x^2-\pi x^4)\,dx = \frac{2\pi}{15}$$

**Example 5.** Same region ($y=x^2$, $y=x$) rotated about the line
$y=2$ (not an axis). Inner radius $r_{in}=2-x$ (distance from $y=2$ down to
$y=x$), outer radius $r_{out}=2-x^2$ (distance from $y=2$ down to $y=x^2$).
$$A(x)=\pi r_{out}^2-\pi r_{in}^2=\pi(2-x^2)^2-\pi(2-x)^2 \quad\Rightarrow\quad V=\int_0^1\big[\pi(2-x^2)^2-\pi(2-x)^2\big]\,dx=\frac{8\pi}{15}$$

**In general**, for revolution about a line, to find the area of the
cross-section $A(x)$ or $A(y)$:
- **Case 1 (disk):** find the radius (in terms of $x$ or $y$), $A=\pi(\text{radius})^2$.
- **Case 2 (washer):** find the inner and outer radius, $A=\pi(\text{outer radius})^2-\pi(\text{inner radius})^2$.

### Exercises (from the deck, unsolved)

**Exercises 1.** Volume obtained by revolving the region bounded by
$y=x^2$, $y=0$, $x=1$, $x=2$ about: (a) x-axis (b) y-axis (c) $y=-1$ (d) $x=3$.

**Exercises 2.** Volume obtained by rotating the region bounded by $y=2x$,
$y=0$, $x=1$ about: (a) x-axis (b) $x=1$.

## Volume of Solids That Are NOT Solids of Revolution

Same slicing method ($V=\int_a^b A(x)\,dx$), but the cross-sections are not
circles/washers — they're whatever shape the problem describes.

**Example 6.** A solid has a circular base of radius $r=1$ (take the circle
as $x^2+y^2=1$). Cross-sections perpendicular to the base are equilateral
triangles. Find the volume.

At distance $x$, the chord of the circle has half-length $y=\sqrt{1-x^2}$,
so the base of the equilateral triangle is $|AB|=2\sqrt{1-x^2}$, and its
height is $\sqrt{3}\,y=\sqrt{3}\sqrt{1-x^2}$ (equilateral triangle: height
$=\tfrac{\sqrt3}{2}\times$ side).
$$A(x)=\frac12\cdot 2\sqrt{1-x^2}\cdot\sqrt3\sqrt{1-x^2}=\sqrt3(1-x^2)$$
$$V=\int_{-1}^1 \sqrt3(1-x^2)\,dx = 2\int_0^1\sqrt3(1-x^2)\,dx=\frac{4\sqrt3}{3}$$

### Exercises (from the deck, unsolved)

**Exercises 3.** Find the volume of a pyramid whose base is a square with
side $L$ and whose height is $h$. (Origin at the vertex, x-axis along the
central axis; the cross-section at $x$ is a square of side $s$ — find
$A(x)$, then $V=\int_0^h A(x)\,dx$.)

**Exercises 4.** Find the volume of the solid whose base is a circle of
radius $r$ and whose parallel cross-sections perpendicular to the base are
squares.

**Exercises 5.** A circular cylinder has base radius $r$. A plane passes
through the diameter of the base circle, at angle $\alpha$ to the base.
Find the volume of the solid cut off (shown in the deck's figure).

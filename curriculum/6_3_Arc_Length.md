# 6.3 Arc Length

Source: `6_3_Arc_Length.pdf` (20 slides). Read-optimized companion — see
CLAUDE.md's "Curriculum file formats" rule for when to fall back to the
original.

## 1. What's the meaning of the length of a curve?

Approximate a curve by an inscribed polygon: length of the polygon
$A_1A_2\cdots A_n$ is $|A_1A_2|+|A_2A_3|+\cdots+|A_nA_1|$.

**Case of a circle:** inscribed polygons with $n=4,6,10,12$ segments
approximate the circumference increasingly well — more segments, more
accuracy.

**General curve $y=f(x)$ on $[a,b]$:** partition points
$P_0,P_1,\dots,P_n$ on the curve at $x=a=x_0<x_1<\cdots<x_n=b$.
$$L\approx |P_0P_1|+|P_1P_2|+\cdots+|P_{n-1}P_n| = \sum_{i=1}^n |P_{i-1}P_i|$$

**Definition:**
$$L=\lim_{n\to\infty}\sum_{i=1}^n |P_{i-1}P_i|$$

## 2. The Arc Length Formula

Derivation: with $\Delta x_i=x_i-x_{i-1}$, $\Delta y_i=f(x_i)-f(x_{i-1})=f'(x_i^*)\Delta x_i$ (MVT),
$$|P_{i-1}P_i|=\sqrt{(\Delta x_i)^2+(\Delta y_i)^2}=\sqrt{1+[f'(x_i^*)]^2}\cdot\Delta x_i$$
$$L=\lim_{n\to\infty}\sum_{i=1}^n|P_{i-1}P_i| = \lim_{n\to\infty}\sum_{i=1}^n\sqrt{1+[f'(x_i^*)]^2}\cdot\Delta x_i = \int_a^b\sqrt{1+[f'(x)]^2}\,dx$$
(This integral exists provided $f'$ is continuous on $[a,b]$, i.e. $f\in C^1[a,b]$.)

**The Arc Length Formula:** if $f'$ is continuous on $[a,b]$, the length of
$y=f(x)$, $a\le x\le b$, is
$$L=\int_a^b\sqrt{1+[f'(x)]^2}\,dx = \int_a^b\sqrt{1+\left(\frac{dy}{dx}\right)^2}\,dx$$

**Remark (how to use it):** determine the function, the independent
variable, and the interval; differentiate; apply the formula. If instead
$x=g(y)$, $y\in[c,d]$:
$$L=\int_c^d\sqrt{1+[g'(y)]^2}\,dy$$

## Worked examples

**Example 1.** Length of the arc of the semicubical parabola $y^2=x^3$
between $(1,1)$ and $(4,8)$. Top half: $y=x^{3/2}$, $y'=\tfrac32 x^{1/2}$,
independent variable $x\in[1,4]$.
$$L=\int_1^4\sqrt{1+(y')^2}\,dx=\int_1^4\sqrt{1+\tfrac94 x}\,dx = \frac{1}{27}\left(80\sqrt{10}-13\sqrt{13}\right)$$
(via the substitution $u=1+\tfrac94x$)

**Example 2.** Length of the arc of the parabola $y^2=x$ from $(0,0)$ to
$(1,1)$. Since $x=y^2$: $\dfrac{dx}{dy}=2y$, independent variable $y\in[0,1]$.
$$L=\int_0^1\sqrt{1+\left(\frac{dx}{dy}\right)^2}\,dy=\int_0^1\sqrt{1+4y^2}\,dy = \frac{\sqrt5}{2}+\frac{\ln(\sqrt5+2)}{4}$$
(via the trig substitution $y=\tfrac12\tan\theta$)

**Example 3.** Circumference of a circle of radius $R$. Place the circle
at the origin; the upper semicircle is $L_1: y=\sqrt{R^2-x^2}$,
$0\le x\le R$, $y'=\dfrac{-x}{\sqrt{R^2-x^2}}$.
$$L_1=\int_0^R\sqrt{1+y'^2}\,dx=\int_0^R\sqrt{1+\frac{x^2}{R^2-x^2}}\,dx=\frac12\pi R \qquad\Rightarrow\qquad L=4L_1=2\pi R$$

## 3. The Arc Length Function

The arc length function measures cumulative length from a fixed starting
point $(a,f(a))$ to the point $(x,f(x))$:
$$s(x)=\int_a^x\sqrt{1+[f'(t)]^2}\,dt$$
By FTC1:
$$\frac{ds(x)}{dx}=\sqrt{1+[f'(x)]^2}=\sqrt{1+\left(\frac{dy}{dx}\right)^2} \quad\Rightarrow\quad ds=\sqrt{1+\left(\frac{dy}{dx}\right)^2}dx \quad\Rightarrow\quad (ds)^2=(dx)^2+(dy)^2$$

**Geometric interpretation:** $ds=\lim_{\Delta x\to0}\Delta s = \lim_{\Delta x\to 0}\sqrt{(\Delta x)^2+(\Delta y)^2}$ — the differential right-triangle picture with legs $dx,dy$ and hypotenuse $ds$.

**Example 4.** Find the arc length function for $y=x^2-\tfrac18\ln x$
taking $P_0(1,1)$ as the starting point.
$$f'(x)=2x-\frac{1}{8x},\qquad 1+[f'(x)]^2 = 4x^2+\frac{1}{64x^2}+\frac12=\left(2x+\frac{1}{8x}\right)^2$$
$$s(x)=\int_1^x\left(2t+\frac{1}{8t}\right)dt = x^2+\frac{\ln x}{8}-1$$
E.g. the arc length from $(1,1)$ to $(3,3)$ is
$s(3)=3^2+\tfrac{\ln3}{8}-1=8+\tfrac{\ln3}{8}\approx8.1373$.

*Open question posed in the deck (not answered there):* why is $s(x)$
negative when $x<1$? (Worth thinking about — it's a signed-distance
convention, not a contradiction.)

### Exercises (from the deck, unsolved)

**Exercises 1.** Find the exact length of the curve:
(a) $y=1+6x^{3/2},\ 0\le x\le1$
(b) $x=\tfrac13\sqrt{y}(y-3),\ 1\le y\le9$
(c) $y=\ln(\cos x),\ 0\le x\le\tfrac{\pi}{3}$
(d) $y=\tfrac12x^2$, from $P$ to $Q(1,\tfrac12)$ — $P$'s coordinates are
partially cut off in the source slide; check the original PDF for this one.

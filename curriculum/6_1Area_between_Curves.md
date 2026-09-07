# 6.1 Area between Curves

Source: `6_1Area_between_Curves.pdf` (12 slides). Read-optimized companion —
see CLAUDE.md's "Curriculum file formats" rule for when to fall back to the
original.

## Review (prerequisites this deck assumes)

Standard antiderivatives:
$$\int \sin x\,dx = -\cos x + C \qquad \int \cos x\,dx = \sin x + C$$
$$\int \tan x\,dx = -\ln|\cos x| + C \qquad \int \cot x\,dx = \ln|\sin x| + C$$
$$\int \sec^2 x\,dx = \tan x + C \qquad \int \csc^2 x\,dx = -\cot x + C$$
$$\int \sec x\tan x\,dx = \sec x + C \qquad \int \csc x\cot x\,dx = -\csc x + C$$
$$\int x^\mu\,dx = \frac{1}{\mu+1}x^{\mu+1}+C\ (\mu\neq-1) \qquad \int x^{-1}dx = \ln|x|+C$$
$$\int a^x dx = \frac{a^x}{\ln a}+C \qquad \int e^x dx = e^x + C \qquad \int 1\,dx = x+C$$
$$\int \frac{dx}{\sqrt{1-x^2}} = \arcsin x + C = -\arccos x+C \qquad \int\frac{dx}{1+x^2}=\arctan x+C=-\text{arccot}\,x+C$$

Substitution rule: $\int f(g(x))g'(x)\,dx = \left[\int f(u)\,du\right]_{u=g(x)}$

By parts: $\int f(x)g'(x)\,dx = f(x)g(x) - \int f'(x)g(x)\,dx$

Trig substitution table:

| Expression | Substitution | Identity |
|---|---|---|
| $\sqrt{a^2-x^2}$ | $x=a\sin\theta,\ -\tfrac{\pi}{2}\le\theta\le\tfrac{\pi}{2}$ | $1-\sin^2\theta=\cos^2\theta$ |
| $\sqrt{a^2+x^2}$ | $x=a\tan\theta,\ -\tfrac{\pi}{2}<\theta<\tfrac{\pi}{2}$ | $1+\tan^2\theta=\sec^2\theta$ |
| $\sqrt{x^2-a^2}$ | $x=a\sec\theta,\ 0\le\theta<\tfrac{\pi}{2}$ or $\pi\le\theta<\tfrac{3\pi}{2}$ | $\sec^2\theta-1=\tan^2\theta$ |

FTC2: if $f$ continuous on $[a,b]$, $\int_a^b f(x)dx = F(b)-F(a)$ where $F'=f$.

## 1. Properties of the Integral — setting up the area

Region $S$ between $y=f(x)$ and $y=g(x)$, between $x=a$ and $x=b$, where
$f,g$ are continuous and $f(x)\ge g(x)$ for all $x\in[a,b]$.

Slice, sum, take the limit (same slicing/limit argument used throughout
this chapter):
$$\Delta S_i \approx (f(x_i^*)-g(x_i^*))\Delta x \quad\Rightarrow\quad S=\sum_{i=1}^n \Delta S_i \approx \sum_{i=1}^n (f(x_i^*)-g(x_i^*))\Delta x \quad\Rightarrow\quad S=\lim_{n\to\infty}\sum_{i=1}^n(f(x_i^*)-g(x_i^*))\Delta x=\int_a^b(f(x)-g(x))\,dx$$

**Formula:**
$$A=\int_a^b [f(x)-g(x)]\,dx = \int_a^b [\text{TOP}-\text{BOTTOM}]\,dx$$

## Worked examples

**Example 1.** Find the area bounded by $y=x^2+1$, $y=x$, $x=0$, $x=1$.
$$A=\int_0^1[(x^2+1)-x]\,dx = \int_0^1(x^2-x+1)\,dx = \left[\frac{x^3}{3}-\frac{x^2}{2}+x\right]_0^1 = \frac{1}{3}-\frac{1}{2}+1=\frac{5}{6}$$

**Example 2.** Find the area bounded by $y=x^2$, $y=2x-x^2$.
Intersection points: $x^2=2x-x^2 \Rightarrow x=0$ or $x=1$, i.e. $(0,0)$ and $(1,1)$.
$$A=\int_0^1(2x-2x^2)\,dx = 2\int_0^1(x-x^2)\,dx = 2\left[\frac{x^2}{2}-\frac{x^3}{3}\right]_0^1 = 2\left(\frac{1}{2}-\frac{1}{3}\right)=\frac{1}{3}$$

## Exercises (from the deck, unsolved)

**Exercises 1.** Evaluate the area of the regions bounded by the given curves:
(a) $y=x^2-1,\ y=e^x,\ x=-1,\ x=1$
(b) $y=x^2-2x,\ y=x+4$
(c) $y=\sqrt{x},\ y=\tfrac{1}{2}x$
(d) $y=\cos x,\ y=\sin 2x,\ x=0,\ x=\tfrac{\pi}{2}$

**Exercises 2.** Find the area of the shaded region:
(a) region between $y=5x-x^2$ and $y=x$ (they meet at $(4,4)$)
(b) region bounded by $x=y^2-2$, $x=e^y$, $y=1$, $y=-1$

**Exercises 3.** Sketch the region enclosed by the given curves and find its area:
(a) $y=12-x^2,\ y=x^2-6$
(b) $y=\cos x,\ y=1-\cos x,\ 0\le x\le\pi$
(c) $y=\sqrt{x},\ y=x^2$
(d) $y=|x|,\ y=x^2-2,\ x=0,\ x=2$

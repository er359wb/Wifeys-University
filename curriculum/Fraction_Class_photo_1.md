# Fraction class — operator overloading and `friend`

Source: two photos of the classroom projector, `Fraction_Class_photo_1.jpg`
(14:59) and `Fraction_Class_photo_2.jpg` (15:02, the later and more complete
one). Not a written worksheet — this is what the teacher typed live in
Dev-C++ during class, and the task is to finish it. Transcribed here; read
this, not the photos. No names, faces or institution markers are visible in
the photos.

## What is on the screen (photo 2, the later one)

```cpp
class Fraction {
    int numerator, denominator;
    void simplify(); // Reduction function
public:
    Fraction(int num = 0, int den = 1);  // Constructors
    void display();
    // Arithmetic operator overloads
    friend Fraction operator+(const Fraction& a, const Fraction& b);
};
int main(){
    Fraction a(2,4), b(1,2), c(3,2);
    a.display();  // output: 1/2
    c.display();  // output: 1u1/2
    c = a + b;
    c.display();  // output: 1
```

Photo 1 (earlier) has the same class and a different `main`:

```cpp
    Fraction a(2,4), b(3,2), c;
    a.display();
    c = a + b;
    c.display();
```

## What has to be implemented

Only the declarations are on screen. The bodies are the task:

1. `Fraction(int num = 0, int den = 1)` — constructor with default arguments
2. `void simplify()` — **private** member function that reduces the fraction
   (2/4 becomes 1/2)
3. `void display()` — prints the fraction
4. `friend Fraction operator+(const Fraction& a, const Fraction& b)` — adds
   two fractions; defined outside the class, with access to private members

## Expected output, read from the screen

| Code | Output |
|---|---|
| `Fraction a(2,4); a.display();` | `1/2` |
| `Fraction c(3,2); c.display();` | `1u1/2` as written on screen (whole part, a `u`, then the fraction) |
| `c = a + b;` with `a`=2/4, `b`=1/2, then `c.display();` | `1` |

Derived, not on screen: with photo 1's `main` (`a`=2/4, `b`=3/2) the sum is
2/4 + 3/2 = 2, so `c.display()` would print `2`.

## Uncertainties and inconsistencies — flagged, not silently resolved

1. **The mixed-number separator is a `u` on the screen.** The first transcription read it as a
   space, assuming the mouse cursor hid it. That was wrong: in the later photo
   (`Fraction_Class_photo_3.md`) nothing covers it and the line clearly reads `1u1/2`.
   Wifey described it as `1 1/2` at first, then typed `'u'` herself. What the teacher
   actually wants is not stated; the screen says `u`. Corrected 2026-10-22.
2. **No negative numbers or zero denominator are shown.** Nothing on screen
   says how to handle them; they are not part of the stated task.
3. **`display()` is not marked `const`** on screen, unlike `display() const`
   in `Complex_Class_`. Written as the teacher typed it.
4. **Whether `simplify()` is called inside the constructor is not shown.**
   It is the natural place, since `a(2,4)` has to print `1/2`.

## Concepts this assignment requires

- a **private member function** (`simplify`) — only other members call it
- the greatest common divisor — met last semester (`gcd`)
- integer division `/` and remainder `%`, used for the whole part (3/2 is
  1 whole and 1 left over, so `1 1/2`)
- `friend` — a function that is not a member but may read private members
- `operator+` — making `a + b` mean "call this function"
- the constructor with default arguments (met in `Complex_Class_`)

Verified: a reference implementation was compiled with `g++ -Wall` and
reproduced all three outputs shown on screen (`1/2`, `1 1/2`, `1`).

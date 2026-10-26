# Operator Overloading, Comprehensive — the Fraction class

Source: `Operator_Overloading_Comprehensive.docx`. Reformatted companion — read
this, not the `.docx`. Received 2026-10-26. This is the **written assignment**
that the class demos (`Fraction_Class_photo_1.md`, `Fraction_Class_photo_3.md`)
were building toward. Every paragraph in the source carries a Heading style;
that is a formatting accident, not structure.

## Task

> Design a Fraction class that overloads major operators to enable mathematical
> operations similar to basic data types.

## The class, verbatim from the sheet

```cpp
class Fraction {
    int numerator;   // Numerator
    int denominator; // Denominator
    void simplify(); // Reduction function
    public:
    // Constructors
    Fraction(int num = 0, int den = 1);
    Fraction(const Fraction& other);
    // Assignment operator overload
    Fraction& operator=(const Fraction& other);
    // Arithmetic operator overloads
    Fraction operator+(const Fraction& other) const;
    // Compound assignment operator overloads
    Fraction& operator+=(const Fraction& other);
    // Relational operator overloads
    bool operator==(const Fraction& other) const;
    bool operator<(const Fraction& other) const;
    // Increment/decrement operator overloads
    Fraction& operator++();    // Prefix ++
    Fraction operator++(int);  // Postfix ++
    // Stream operator overloads
    friend std::ostream& operator<<(std::ostream& os, const Fraction& frac);
    friend std::istream& operator>>(std::istream& is, Fraction& frac);
    // Member access operator overload (get numerator/denominator)
    int operator[](int index) const;
    };
```

## The `main` on the sheet, verbatim

```cpp
int main() {
    // Test basic functions
    Fraction f1(1, 2);
    Fraction f2(3, 4);
    // Test arithmetic operations
    Fraction sum = f1 + f2;
    cout << f1 << " + " << f2 << " = " << sum << endl;
    // Test relational operations
    cout << f1 << " == " << f2 << " : " << (f1 == f2) << endl;
    cout << f1 << " < " << f2 << " : " << (f1 < f2) << endl;
    // Test increment/decrement
    Fraction f3(2, 3);
    cout << "f3 = " << f3 << endl;
    cout << "++f3 = " << ++f3 << endl;
    cout << "f3++ = " << f3++ << endl;
    cout << "f3 = " << f3 << endl;
    // Test member access  1/2
    cout << "Numerator of f1: " << f1[0] << endl;
    cout << "Denominator of f1: " << f1[1] << endl;
    // Test compound assignment
    Fraction f4(1, 3);
    f4 += f1;
    cout << "f4 += f1: " << f4 << endl;
return 0;
}
```

## What is NOT specified — flagged, not silently decided

1. **No expected output is given at all.** The sheet has no output lines. The
   output format of `operator<<` is also unspecified. The class demos printed a
   mixed number (`1u1/2`); this sheet does not say so. A plain `numerator/denominator`
   was used for the verification below.
2. **Semantics of `operator++` and `operator[]` are unstated.** Standard meaning
   assumed: `++` adds 1 to the fraction (numerator += denominator); prefix returns
   the new value, postfix returns the old; `[0]` is the numerator, `[1]` the
   denominator, other indices unspecified.
3. **`operator<` meaning is unstated.** Cross-multiplication assumed.
4. **`operator+` here is a member and `const`**, not the `friend` with two
   parameters that was built in the class demos. The maths is the same; the left
   operand is `*this`.
5. **The copy constructor and `operator=` are explicitly required.** For a class
   of two plain `int`s the compiler would write them, so they are not needed for
   correctness. The sheet still lists them, so they have to be written. (This
   differs from the class-demo `Fraction`, where the screen listed no copy
   constructor.)
6. **`std::ostream` is written with `std::` in the class but `cout`/`endl` appear
   bare in `main`**, so `using namespace std;` is assumed.
7. **No `display()` and no `operator-`** appear in this sheet. Those were class
   demos.

## Verified against a reference

A reference implementation of every function, using Wifey's own `gcd` and
`simplify`, was compiled with `g++ -Wall` (no warnings) and the sheet's `main`
printed:

```
1/2 + 3/4 = 5/4
1/2 == 3/4 : 0
1/2 < 3/4 : 1
f3 = 2/3
++f3 = 5/3
f3++ = 5/3
f3 = 8/3
Numerator of f1: 1
Denominator of f1: 2
f4 += f1: 5/6
```

## What is new relative to the class demos

| Requirement | Status relative to work already done |
|---|---|
| constructor with defaults, `simplify` | done in the class demo |
| copy constructor | new as a required item |
| `operator=` returning `Fraction&` | new: `return *this;` |
| `operator+` as a **const member** | same maths as the `friend` version, different shape |
| `operator+=` returning `Fraction&` | new, can reuse `+` |
| `operator==` | started, not yet working |
| `operator<` | new |
| prefix `++` and postfix `++` | new; the `(int)` parameter is only a marker |
| `operator<<`, `operator>>` | in progress, fixes pending |
| `operator[]` | new |

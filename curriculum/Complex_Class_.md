# Complex Class — classes and constructors

Source: `Complex_Class_.docx`. New semester (autumn), first assignment on
classes. Reformatted companion — read this, not the `.docx`.

## Background given in the sheet

Complex numbers extend the real number system to include solutions to
equations that have none in the reals, in particular:

```
x² + 1 = 0
```

No real number squared equals −1. Complex numbers solve this by introducing
the imaginary unit.

A complex number is written as:

```
z = a + bi
```

- `a` is the real part, Re(z)
- `b` is the imaginary part, Im(z)
- both `a` and `b` are real numbers
- `i` is the imaginary unit

## REQUIREMENT

> Please define a Complex class with following member functions.

### 1. `Complex(double real = 0.0, double imaginary = 0.0);`

- Function: creates a complex number object
- Parameters: `real` — real part, `imaginary` — imaginary part (both default to 0)
- Example: `Complex c(3, 4)` creates complex number 3+4i

### 2. `Complex(const Complex& other);`

- Function: copy constructor, creates a copy of a complex number
- Parameters: `other` — complex number object to copy

### 3. `Complex conjugate();`

- Function: returns the complex conjugate
- Formula: `conjugate(a+bi) = a - bi`

### 4. `void display() const;`

- Function: displays complex number in standard format
- Output example: `3.00 + 4.00i`, `-2.00 - 1.50i`

### 5. `Complex add(Complex& other);`

- Function: add two complex numbers, return a complex result
- Formula: `(1+2i)+(3+4i)=4+6i`

## Test sample (verbatim from the sheet)

```cpp
Complex a(3, 4);           // 3+4i
Complex b(1, -2);          // 1-2i
Complex e = a.conjugate(); // 3-4i
a.display();               // Output: 3 + 4i
Complex d(-1, 2);
Complex c = b.add(d);
c.display();               // output: 0
```

## Inconsistencies in the sheet — flagged, not silently fixed

1. **`display()` format contradicts itself.** The spec says two decimal
   places (`3.00 + 4.00i`), but the test sample comment says `3 + 4i`.
   Two decimals is the stated requirement; the comment is shorthand.
2. **The last expected output is incomplete.** `b.add(d)` is
   `(1−2i) + (−1+2i)` = `0 + 0i`. The sheet writes `// output: 0`, but a
   `display()` that always prints both parts would give `0.00 + 0.00i`.
   Treat `0` as the sheet's shorthand for the zero complex number.
3. **`add` takes a non-const reference** (`Complex add(Complex& other)`)
   while the copy constructor takes `const Complex&`. Written as given,
   `add` cannot accept a temporary. Keep the signature as the sheet
   specifies — it is what will be marked — but it is an inconsistency,
   not a style choice.
4. **`conjugate()` is not marked `const`** while `display()` is. Again,
   keep as specified.

## Concepts this assignment actually requires

- `class` with `private` data members and `public` member functions
- constructor with **default arguments** (already covered last semester in
  `20260612overloaded_function_.docx`)
- **copy constructor** — the `const Complex&` parameter
- `const` member function (`display() const`)
- a member function **returning an object of its own class**
  (`conjugate()`, `add()`)
- `<iomanip>` — `setprecision(2)` and `fixed` for the `3.00` format
- sign handling in output: `-2.00 - 1.50i`, not `-2.00 + -1.50i`

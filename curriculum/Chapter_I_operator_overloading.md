# Chapter I: Objects and Classes (II) — friends and operator overloading

Source: `Chapter_I_object_and_classes__overloading_operator_.ppt`, 31 slides, received
2026-11-16. Converted to text and read. **The deck itself is not committed**: the first
slide carries the lecturer's name and the school's name, and the repository is public.
This is a transcription of its content. It is the lecture behind
`Operator_Overloading_Comprehensive.md`.

## 4.5 Friends

- Sometimes it is convenient to let specific non-member functions access the private
  members of a class while still preventing general access. The **friend** mechanism
  lets a class grant access to its non-public members to specified functions or classes.
- Friendship may give higher efficiency but **destroys encapsulation and data hiding**.

### Friend function

- A friend declaration begins with `friend` and **may appear only within a class
  definition**.
- Friend functions are **not members** of the class granting friendship, so they are not
  affected by the access section in which they are declared; they reach the members
  **through an object**.
- A friend may be an ordinary non-member function, or a member function of another
  previously defined class.

Example, the distance between two points:

```cpp
class Point{
    double x, y;
public:
    Point( double xx=0.0, double yy=0.0) { x = xx; y = yy; }
    double GetX( ) const { return x; }
    double GetY( ) const { return y; }
    friend double CalDistance(Point &a, Point &b);
};
double CalDistance(Point &a, Point &b){
    double dx = a.x - b.x;
    double dy = a.y - b.y;
    return sqrt(dx*dx + dy*dy);
}
void main( ){
    Point p1(3.0,5.0), p2(4.0,6.0);
    double distance = CalDistance(p1, p2);
    cout << "The distance is " << distance << endl;
}
```

### Friend class

In making a class a friend, **all the member functions of the friend class** get access
to the non-public members of the class granting friendship. Example: class `A` has
`void Display(){cout<<x<<endl;}` and private `int x;`; class `B` has `Set(int i)` doing
`a.x=i;`, `Display()` doing `a.Display();`, and a private member `A a;`. The slide's
result lines are `-858993460` and `5`. (The first value is an uninitialised `int`.)

## 4.6 Operator overloading

Problem posed: `Complex a(10,20), b(5,8);` — how to calculate `a+b`, `a-b`? By overloading
the arithmetic `+` and `-` operators.

- Operator overloading lets the programmer define versions of an operator for operands of
  class type.
- **Rules and restrictions**
  - All operators can be overloaded **except**: `.*`-style member dereference `*`
    (listed as "`*` (dereference operator)"), `::`, `? :`, `sizeof`.
  - Only operators already defined in C++ can be overloaded.
  - **Precedence and associativity are fixed.**
  - The **number of operands cannot be changed.**
  - An overloaded operator must have **an operand of class type**; operators cannot be
    defined for built-in types alone: `double operator% (double a, double b);` is an error.
- Overloaded operators are functions with special names: the keyword `operator` followed by
  the symbol.
- Most can be defined as ordinary non-member functions or as class member functions. When
  defined as non-members, they often must be made friends of the class they operate on.

### Worked example: complex arithmetic

Rules: `(a1+b1i)+(a2+b2i) = (a1+a2)+(b1+b2)i`; `-` likewise; `(a1+b1i)*(a2+b2i) =
(a1*a2-b1*b2)+(a1*b2+b1*a2)i`; division by `((a1*a2+b1*b2)+(a2*b1-a1*b2)i) /
(a2*a2+b2*b2)`. Both operands are `Complex` objects.

**1. Overloading as member functions:**

```cpp
class Complex{
    double real; double imag;
public:
    Complex(double r=0.0,double i=0.0) { real=r; imag=i; }
    Complex operator + (const Complex &c);
    Complex operator - (const Complex &c);
    Complex operator * (const Complex &c);
    Complex operator / (const Complex &c);
    friend void print(const Complex &c);
};
inline Complex Complex::operator +(const Complex &c)
{   Complex a(this->real+ c.real, imag + c.imag);
    return a; }
inline Complex Complex::operator -(const Complex &c)
{   return Complex(real - c.real, imag - c.imag); }
```

A call may be written as `c3=c1+c2;` or explicitly as `c3=c1.operator+(c2);`.

**The first operand must be an object of the class when a binary operator is overloaded as
a member function.**

```cpp
Complex c1(1,2),c2;
c2=c1+5;     // works: c2 = c1.operator+(Complex(5))
c2=5+c1;     // error:  would be 5.operator+(c1)
```

**2. Overloading as friend functions**, with **two** parameters:

```cpp
friend Complex operator + (const Complex &c1, const Complex &c2);
Complex operator +(const Complex &c1, const Complex &c2) {
    return Complex(c1.real+ c2.real, c1.imag + c2.imag); }
```

A call may be written `c3=c1+c2;` or `c3=operator+(c1,c2);`.

### The mechanism, and member versus non-member

- The expression is converted into a call of the corresponding operator function, passing
  the objects; the compiler picks the function by the arguments.
- **Ordinarily define:** the arithmetic and relational operators as **non-member**
  functions, and assignment operators as **members**. **Unary operators as members.**
  **Binary operators as non-members, except** assignment `=`, `( )`, `[ ]`, and `->`,
  which must be members.

### 4.6.1 Assignment operator

```cpp
Counter& operator=( const Counter &);
Counter& Counter::operator=( const Counter &b)
{   amount= b.amount;
    return *this;   }
void main( ){
    Counter c(20), d, e;
    c.Increment( );
    e = d = c;
    cout << "d=" << d.GetValue( ) << "e=" << e.GetValue( ) << endl;
}
```

The return type is a **reference to the class** and the function returns `*this`, which is
what makes the chain `e = d = c;` work.

### 4.6.2 Input and output operators

- **`<<`:** to be consistent with the IO library, the output operator takes an **`ostream&`
  as its first parameter and a reference to a const object of the class type as its
  second**, and **returns a reference to its `ostream` parameter**. IO operators must be
  **non-member** functions, so they are overloaded as **friends**.
- **`>>`:** the input operator takes an **`istream&`** first and a **non-const** reference
  to the class object second. **The second parameter must be non-const because the purpose
  of an input operator is to read data into the object.**

```cpp
friend ostream& operator<<(ostream& os,const counter& c);
friend istream& operator>>(istream& is,counter& c);
ostream& operator<<(ostream& os,const counter& c){ os<<c.a; return os; }
istream& operator>>(istream& is,counter& c){ is>>s.a; return is; }
```

### Increment and decrement

- There are prefix and postfix versions. No rule says they must be members, but because
  they change the object's state **the preference is to make them members**.
- Both take the same number and type of parameters, so ordinary overloading cannot tell
  them apart. **The postfix version takes an extra, unused, unnamed `int` parameter** whose
  only role is to distinguish it from the prefix version.
- **Prefix returns a reference** to the changed object; **postfix returns a copy of the old
  value.**

```cpp
Counter& Counter::operator++( ) { a++; return *this; }
Counter Counter::operator++(int)
{   Counter old = *this;      //save the current value
    a++;
    return old;   }           //return the saved state
```

Result for `Counter c, d; ++c; d = c++; --c; d = c--;` printed with `GetValue()`:
`c=1`, `c=2 d=1`, `c=1`, `c=0 d=1`. Explicit calls: `++c` is `c.operator++()`, `c++` is
`c.operator++(0)`.

## Verified by compiling with g++ 13, and typos on the slides

1. `c2=c1+5;` compiles with a **member** `operator+` and gives `6+2i`; `c2=5+c1;` is rejected:
   `no match for 'operator+' (operand types are 'int' and 'Complex')`. This matches the slide.
2. The counter example prints exactly `c=1`, `c=2 d=1`, `c=1`, `c=0 d=1`, and the chained
   assignment prints `d=21 e=21`.
3. **Typos on the slides:** `Return a;` has a capital R; the `>>` example reads `is>>s.a`
   where `c.a` is meant; the division formula contains `-+`; the first slide of the friend
   class example prints an uninitialised number. The mismatch between the slide's "the
   asymmetry rule" (`=`, `( )`, `[ ]`, `->` must be members) and the task sheet, where `[]` and
   `=` are indeed members, is consistent.
4. **The lecture's rule and the task sheet differ on one point.** The lecture says binary
   arithmetic operators are *ordinarily* non-members. The written `Fraction` assignment
   gives `operator+` as a **const member**. Both are legal; follow the sheet for the
   assignment.

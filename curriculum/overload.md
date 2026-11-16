# Overloading and default arguments of member functions — slides 3.6 and 3.7

Source: `overload.pdf`, 7 slides on one page, received 2026-11-16. No text layer;
transcribed from the images. Read this, not the PDF. The committed PDF is a
re-rendered copy with the original document properties removed (they held a real
person's name). Syllabus item 1.2.

## 3.6 Overloading Member function

- As with nonmember functions, a member function may be overloaded.
- *Function overloading*: two functions that appear **in the same scope** are
  overloaded if they have the **same name but a different parameter list**.
- We select the corresponding function version to run by supplying the appropriate
  number and/or types of arguments to a given call.

Example:

```cpp
#include <iostream>
using namespace std;
class M{
public:
    int add(int x, int y) { return x+y; }
    double add(double x, double y) { return x+y; }
};   M o;   o.add(3,4.5);
```

A `main` that reads two integers and two reals and prints `a.add(m,n)` and
`a.add(x,y)`:

```cpp
void main(void)
{
    M a;
    int m, n;
    double x, y;
    cout<<"Enter two integer: ";
    cin>>m>>n;
    cout<<"integer " <<m <<'+' <<n<<"=" << a.add(m,n)<<endl;
    cout<<"Enter two real number: ";
    cin>>x>>y;
    cout<<"real number "<<x<<'+'<<y<<"= "<<a.add(x,y)<<endl;
}
```

### Overloading Based on const

- We can overload a member function based on whether it is `const`.
- A `const` object will use only the `const` member.
- A non-`const` object could use either member, but the non-`const` version is a
  better match.

## 3.7 Default Arguments of member functions

- When we call a function, we may omit any argument that has a default. The compiler
  supplies the default value for any argument we omit.
- A default argument is specified by providing an explicit initializer (value) for
  the parameter in the parameter list.

Example:

```cpp
#include <iostream>
using namespace std;
class Poin{
    int x,y;
public:
    void SetPoint(int xx=0, int yy=10);   //declaration
    int GetX( ) const { return x; }       //definition
    int GetY( ) const { return y; }
};
void Point::SetPoint(int xx, int yy)
{x=xx,y=yy;}

void main( ){
    Point a, b, c;
    a.SetPoint();  b.SetPoint(8);  c.SetPoint(10,20);
    cout<<a.GetX( ) + a.GetY( )<<endl;
    cout<<b.GetX( ) + b.GetY( )<<endl;
    cout<<c.GetX( ) + c.GetY( )<<endl;
}
```

Result shown on the slide: `10`, `18`, `30`.

## Flagged after compiling with g++ 13

1. **`o.add(3,4.5);` on the first example is rejected as ambiguous:**
   `error: call of overloaded 'add(int, double)' is ambiguous`. `3` fits `int` and
   `4.5` fits `double`, so neither version is better for both arguments. The slide
   shows it as a plain call; treat it as a trap, not as a working call.
2. **The class is spelled `Poin` but the definition is `Point::SetPoint`.** A typo on
   the slide. With `Point` throughout the program prints `10`, `18`, `30`, as shown.
3. **The default `= 0, = 10` appears only in the declaration.** The definition
   outside the class repeats no defaults (repeating them is an error), which is the
   same rule met in the `Fraction` constructor.
4. The slide's `void main` is non-standard; `int main` is standard C++.

# Class constructors — slides 4 and 4.1

Source: `constructor.pdf`, 6 slides on one page, received 2026-11-16. No text layer;
transcribed from the images. Committed PDF is a re-rendered copy without the
original document properties. Syllabus item 1.3.

## 4. Class Constructors and Destructors

- One of C++'s aims is to make using class objects similar to using standard types.
  However, the code so far does not let you initialize an object the way you can
  initialize an ordinary `int`: `int x=8; Time b(6,7,8);`
- So we need an appropriate member function to initialize an object.
- It is best that all objects be initialized when they are created.

## 4.1 Class Constructors

- Constructors are the **special member functions that are executed whenever we
  create new objects** of a class type.
- The job of a constructor is to ensure that the data members of each object start
  out with sensible initial values (assigning values to their data members).

Prototype: `functionname (parameterlist) ;`   (*slide: "please try to define
constructor for class Time"*)

- A constructor has **the same name as the class**.
- A constructor **may not specify a return type**.
- Access label: **public**.
- Constructors are executed **automatically**: the compiler runs a constructor (only
  once) whenever an object of the type is created.
- A constructor **may not be declared `const`**.

## 4.1.1 Default Class Constructors

- The default constructor is used whenever we define an object but do not supply
  explicit initialization values: `Time t2;`
- C++ supplies a default constructor automatically. It is an implicit version of a
  default constructor, and **it does nothing**. Just as `int x;` creates `x`
  without providing a value for `x`.
- **The compiler provides a constructor only if we do not define any constructors.**
  After we define any constructor (even only one), the responsibility for providing
  a default constructor passes from the compiler to you.

```cpp
class Date{
    int year, month, day;
public:
    Date(int y, int m, int d){            // nondefault constructor
        year=y; month=m; day=d;
        cout << "Date object initialized!" << endl;
    }
};
Date d1;   // it is not possible with current constructor
           // compile error: no appropriate default constructor available
```

Callout: *Classes should usually define a default constructor.*

- Two ways of defining default constructors:
  - to provide default values for all the arguments of the existing constructor:

```cpp
#include<iostream>
#include<iomanip>
using namespace std;
class Date{
    int year, month, day;
public:
    Date(int y=2000, int m=1, int d=1);
    bool isLeapYear( ) const;
    void PrintDate( ) const;
};   // (the slide is cut off here; the second way is not visible)
```

## Flagged after compiling with g++ 13

1. `Date d1;` with only the three-argument constructor fails, as the slide says. The
   message differs from the slide's wording: `error: no matching function for call to
   'Date::Date()'`.
2. A `const` constructor is rejected: `error: constructors may not be cv-qualified`.
3. **The second way of defining a default constructor is cut off at the bottom of the
   slide.** The usual second way is a constructor with no parameters, `Date()`;
   not visible on the slide, so not recorded as the teacher's.
4. This ties directly to the `Account` work: a class whose only constructor takes
   parameters has **no default constructor**, which is why `SavingAccount` has to pass
   values to `Account(...)`.

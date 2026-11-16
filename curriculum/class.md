# Class in C++ — lecture slides, chapter 3

Source: `class.pdf`, 12 slides (6 per page, 2 pages), received 2026-11-16. The
PDF has no text layer, so this is a transcription of the images. Read this, not
the PDF. The file in this repository is a **re-rendered copy with the original
document properties removed** (the upload carried a real name as its author).
Corresponds to syllabus item 1.1 *Define a class & objects*; see
`Syllabus_Class_and_Objects.md`.

## 3. Class in C++

A class combines data representation and methods for manipulating that data into
one neat package.

Defining a class has two parts:

- the **class declaration**, which describes the data component in terms of data
  members and the public interface in terms of member functions, termed
  *methods*
- the **class method definitions**, which describe how certain class member
  functions are implemented

The class declaration provides a class overview; method definitions supply the
details.

## 3.1 Defining Class

Syntactic form:

```cpp
class ClassName          // header of class definition
{                        // body of a class definition
    public:              // sections
        member list;     // members can be data types or functions
    private:
        member list;
    protected:
        member list;
};                       // a sentence ending with a ;
```

A class is completely defined once the closing curly brace appears.

## TIPS (three slides)

- The keyword `class` identifies a definition of a class.
- The identifier following `class` is the type name for a new class.
- **Data members**: the information you decided to store appears as the class data
  members. Definitions of data members are much like regular variables.
- **Member functions**: the possible operations on the data members.
- A data member can be of any basic or class type **only if the definition for the
  class has already been seen**.
- **A class cannot have data members of its own type.**
- However, a class can have data members that are **references or pointers** to its
  own type.
- If the class type is used before its definition is seen, use a **forward
  declaration**; it indicates that it is a type but not what members it contains:

```cpp
class N;            // a forward declaration of class N
class M             // definition of class M
{ public: .....
  private:
      N n;          // n is the object of N
};
class N             // definition of N
{ .....
};
```

## Access Labels

- Keywords: `private`, `public`, `protected`. Access labels describe access control
  for class members.
- **public**: members defined in the public section are accessible to all the code
  that uses the type. Any program that uses an object of a particular class can
  access the public portions directly.
- **private** (the default access control for class objects): members defined in the
  private section are accessible only to other members of the same class. A
  program can access the private members of an object only by using the public
  member functions.
- **protected**: "discuss later in chapter *class inheritance*."
- Object: a variable, also called an instance of a class type. **Storage is
  allocated when we define objects, not when we define types.**

## Data hiding and encapsulation

- **Data hiding**: the insulation of data from direct access by a program. One of
  the main precepts of OOP is to hide the data; data items normally go into the
  private section, and member functions as the class interface go into the public
  section.
- **Encapsulation** describes gathering the implementation details together,
  separating them from the abstraction.
- A class is an encapsulated entity: it represents an aggregation of several
  members, and most class types hide the members that implement the type.

## 3.2 Define Class Objects

- Once a class is defined (class declaration and method definitions), we can
  define objects of that type.
- **Each object has its own copy of the class data members.**

Syntactic form: `Classname object_list;`

```cpp
Date date, BirthDate[10];
Date *pBirthDate = new Date;
```

### Define Class objects (slide with a cross)

**Storage is allocated when we define objects, not when we define types. A value
cannot be assigned to a data member when it is defined.** The slide shows this as
**wrong**, marked with a red cross:

```cpp
class Date
{
    ........
    private:
        int year=2007, month=10, day=1;      // marked wrong
};
```

### `class TimeType` specification

```cpp
class TimeType                          // declares a class data type
{
public:                                 // 5 public function members
    void Set(int h, int m, int s);
    void Increment();
    void Write();
    bool Equal(TimeType otherTime);
    bool LessThan(TimeType otherTime);
private:                                // the information to be stored appears as 3 private data members
    int hrs;                            // does not allocate memory
    int mins;
    int secs;
};
TimeType currentTime, endTime;
```

### TimeType class instance diagrams

Two objects, `currentTime` (h=17, m=58, s=2) and `endTime` (h=18, m=30, s=0). Each
shows the five functions (Set, Increment, Output, LessThan, Equal) and its own
private data. Caption: *each object has its own copy of the class data members.*

## Points where the slides and a compiler disagree — flagged, not silently fixed

Checked by compiling with g++ 13:

1. **The forward-declaration example does not compile as written.** `N n;` inside
   `M`, with `N` only forward-declared, gives `error: field 'n' has incomplete type
   'N'`. It compiles only with a pointer or reference, `N* n;`. This also fits the
   earlier slide: members of class type need the full definition; pointers and
   references do not.
2. **The slide marks `int year=2007, month=10, day=1;` inside the class as wrong.**
   That was true before C++11. With `-std=c++11` it compiles without complaint;
   with `-std=c++98`, g++ 13 only **warns** (`non-static data member initializers
   only available with -std=c++11`). For this course, **follow the slide**: it is
   something the exam may call an error.
3. **`class Node { Node n; };` is an error**, `error: field 'n' has incomplete
   type`, while `Node* next;` is fine. This is exactly why a linked-list node holds
   a pointer to the next node.
4. **`class` members are private by default**; `struct` members are public. Verified:
   `A a; a.x = 1;` on a `class` gives `'int A::x' is private within this context`,
   while the same on a `struct` compiles.
5. The slide's `Output` in the instance diagram does not match `Write` in the
   specification. Cosmetic.

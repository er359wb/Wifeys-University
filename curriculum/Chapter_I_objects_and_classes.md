# Chapter I: Objects and Classes — lecture deck (part I)

Source: `Chapter_I_objects_and_classes.ppt`, 90 slides, received 2026-11-16. Converted
to text and read; the figures and a few cut-off slides are not recoverable from text.
**The deck itself is not committed**: its first slide carries the lecturer's name and
the school's name, and this repository is public. This is a summary of the parts that
matter for the midterm, in the deck's own order. Covers syllabus items 1.1 to 1.6.

The deck's contents list: public and private class access; class data members; class
member functions; creating and using class objects; class constructors and
destructors; **the `this` pointer**; class scope.

## OOP idea (slides 1–10)

Procedural programming concentrates on the procedures first and then on how to
represent the data. OOP begins by thinking about the data, not only how to represent
it but how it is to be used. Example given: instead of separate arrays of ids and
scores sorted together, one student object with its methods (get basic information,
sort by score, display the result).

## 3.5 The implicit `this` pointer  *(syllabus 1.6: not yet taught in tutoring)*

- Each object has storage for its **own** data members, but all objects of a class
  **share one copy of each member function**. So `d1.SetDate(...)` and `d2.SetDate(...)`
  run the same code on different data. How does the function know which object?
- **Every member function has an extra implicit parameter, a pointer named `this`, to
  an object of the class type.** The compiler adds it; a member function may not
  define the `this` parameter itself.

```cpp
class point{ int x,y; public: void print(){ cout<<x<<" "<<y<<endl; } };
// is equivalent to
class point{ int x,y; public: void print(point *this){ cout<<this->x<<" "<<this->y<<endl; } };
```

- `this` is bound to the object on which the function is called: when a member
  function is called, `this` is initialised with the **address of that object**.
- A call is translated by rewriting the definition (adding `this`) and passing the
  object's address: `point A; A.print();` becomes `print(&A);`. The `x`, `y` inside
  are those belonging to `A`.
- The body may use `this` explicitly if necessary. Ordinarily we seldom use `this`
  itself, but the expression **`*this`** to refer to the invoking object as a whole:

```cpp
TimeType & TimeType::Toptime(TimeType& now){
    if (now.hrs*3600+now.mins*60+now.secs > this->hrs*3600+mins*60+secs)
        return now;
    else return *this;        //return the object itself
}
```

## 3.6 Const member functions

- In an ordinary non-const member function, we may change the value `this` points to.
- In a `const` member function, **`this` points to a const object**, so we may not
  change the object, and it **cannot call any non-const member function** of its
  class type.
- **Both the prototype and the definition must add the keyword `const`.**
- A member function can be overloaded on `const` (e.g. `Write() const` and `Write()`):
  a const object uses only the const member; a non-const object could use either but
  the non-const version is the better match.

## 3.6–3.7 Overloading member functions, default arguments

Covered in `overload.md`.

## 4.1.3 Constructor initializer list

```cpp
Date::Date(int y, int m, int d) { year=y; month=m; day=d; }
Date::Date(int y, int m, int d) : year(y), month(m), day(d) { }
```

- It starts with a colon, followed by a comma-separated list of data members, each with
  an initializer in parentheses.
- **Members are initialised in the order in which they are *defined in the class*, not
  the order in the list.** `Date::Date(int y,int m): year(y), day(d), month(day)` is a
  run-time error.
- The initializer list is specified **only on the constructor definition, not its
  declaration.**
- **Sometimes required**: for members of a class type that have no default constructor,
  and for members that are `const` or reference type, because assigning in the body does
  not work for them.

Example (`StudentID` inside `Student`): the output shown on the slide is
`Assigning student id 98`, `Constructing student Randy`, `Assigning student id 0`,
`Constructing student Jenny`.

## 4.2 The destructor

Covered in `deconstructor.md`. Extra in this deck:

- **4.2.3 When to write an explicit destructor.** Many classes do not need one; the
  compiler declares an implicit one. Destructors are needed only if there is work to
  do: **if the object holds memory obtained with `new`, define a destructor that
  `delete`s it.** Example `Person` with `char* pName`: the constructor does
  `new char[strlen(pN)+1]` and `strcpy`; the destructor prints and `delete[] pName`.
- A destructor runs at the end of the block for an ordinary object, and at `delete` for
  an object made with `new` (two `main` examples with the same "initialized /
  destroyed" output).

## 4.3 Copy constructor

Covered in `copy_constructor.md`. Extra in this deck, **4.3.2 Defining our own copy
constructor**:

- With the `Person` class (pointer member), `Person p2(p1);` using the compiler's copy
  copies only the **pointer value**, so both objects point to the same memory. The slide
  shows the result: `Constructing Randy`, `Destructing Randy`, then a destructor line
  with garbage. The memory is freed twice.
- **"It is not enough to assign the value of the pointer member; we should allocate the
  memory instead."** The fix is a copy constructor that does `new char[strlen(s.pName)+1]`
  and `strcpy`. The shown result: `Constructing Randy`, `Copy Constructing Randy`,
  `Destructing Randy`, `Destructing Randy`.

## End of the deck: practice questions (the format the exam may use)

True/false:
- "Clients of a C++ class can access the public and private members directly."
- "In C++, two different classes, say `MyClass` and `YourClass`, cannot both have member
  functions named `Subtract`."

Multiple choice:
- Given `class SomeClass { public: void Func(); private: int m; int n; };` and client
  code `SomeClass alpha; SomeClass beta;`, which identifiers are names of class members?
  Options: A) m and n; B) alpha and beta; C) SomeClass, m, and n; D) alpha, beta, m, and
  n; E) Func, m, and n.
- Given `class X { public: void F(int); private: int n; };`, which line of
  `X alpha; // Line 1`, `alpha.F(); // Line 2`, `alpha.n = 42; // Line 3` causes a
  compile-time error? Options: A) line 1; B) line 2; C) line 3; D) lines 1 and 2;
  E) lines 2 and 3.

The answers are not on the slides.

## Verified by compiling with g++ 13

1. **Without its own copy constructor, the `Person` example dies:** the program aborts
   with `free(): double free detected`. With the deep-copy constructor it prints exactly
   the four lines shown on the slide.
2. The initializer-list example prints exactly the four lines on the slide. The compiler
   also warns that `Student::id` "will be initialized after" `name`, because the list
   names `id` first but the class declares `name` first: this is the declaration-order rule.

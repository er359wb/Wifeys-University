# The destructor — slides 4.2

Source: `deconstructor.pdf` (the file name says "de*con*structor"; the slides say
destructor), 5 slides on one page, received 2026-11-16. No text layer; transcribed
from the images. Committed PDF is a re-rendered copy without the original document
properties. Syllabus item 1.5.

## 4.2 The Destructor

- One purpose of a constructor is to provide for the automatic acquisition of a
  resource. A constructor might allocate memory using the `new` operator.
- When the object expires, the program automatically calls a special member function
  named the **destructor** to free the resource.

## 4.2.1 How to write a destructor

- A member function with the **name of the class prefixed by a tilde (`~`)**.
- It has **no return value, declared type, and takes no parameters**.
- It **cannot be overloaded**, so we can provide only a single destructor for all
  objects of our class.
- The access label should be **public**.

## 4.2.2 When a destructor is called

- Called automatically whenever an object of its class is destroyed.
  - Variables (objects) are destroyed automatically **when they go out of scope**
    (the block of code in which they are defined).
  - An object that is **dynamically allocated** is destroyed only when a pointer
    pointing to the object is **deleted**. If we do not delete a pointer to a
    dynamically allocated object, the destructor is never run on the object, it
    persists forever, and any resources used inside it are not released.
- A destructor destroys objects **in the reverse order** from that in which they
  were created; in consequence it destroys members in reverse order from which they
  are declared in the class.

Example, `Date` class:

```cpp
#include<iostream>
#include<iomanip>
using namespace std;
class Date{
    int year, month, day;
public:
    Date(int y=2000, int m=1, int d=1);
    ~Date( );
    bool isLeapYear( ) const;
    void PrintDate( ) const;
};

Date::Date(int y, int m, int d){
    year=y; month=m; day=d;
    cout << "Date object initialized!" << endl;
}
Date::~Date( )
/* if a destructor has no vital duties, we can code it as a do-nothing function,
   however, in order to observe when the destructor is called, we can add some
   statements*/
{   cout << "Date object destroyed!" << endl;   }
bool Date::isLeapYear( ) const {
    return (year % 4==0 && year % 100 )|| year % 400==0;}
void Date::PrintDate( ) const {
    cout << year << "." << month << "." << day << endl;
}
```

## Flagged after compiling with g++ 13

1. A destructor with a parameter is rejected: `error: destructors may not have
   parameters`. That is also why a second, differently-shaped destructor (an
   overload) is impossible.
2. **No example with `new` and `delete`** is on these slides, although the text
   describes one. A destructor that frees a node chain is the natural example for
   the linked-list case study.
3. **Earlier in tutoring, order was shown by printing messages**: for an object of a
   derived class the base constructor runs first and the destructors run in the
   reverse order, matching "reverse order" on slide 4.2.2.

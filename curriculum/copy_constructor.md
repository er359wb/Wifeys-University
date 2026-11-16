# Copy constructor — slides 4.3

Source: `copy_constructor.pdf`, 4 slides on one page, received 2026-11-16. No text
layer; transcribed from the images. Committed PDF is a re-rendered copy without the
original document properties. Syllabus item 1.4.

## 4.3 Copy constructor

The copy constructor is a special constructor that has a **single parameter that is
a (usually const) reference to the class type**.

```cpp
class Point{
private:
    int X,Y;
public:
    Point(int xx=0,int yy=0) { X=xx; Y=yy; }
    Point(const Point& p);
    int GetX( ) { return X; }
    int GetY( ) { return Y; }
};
```

### When will the copy constructor be called?

**(1) Used explicitly** when we define a new object and initialize it from an object
of the same type:

```cpp
void main( )
{
    Point A(1,2);                 //int x=9;  int x(9);
    Point B(A);                   //Initialize object B from A, the copy constructor is called.
    Point C = A;                  //Initialize object C from A, the copy constructor is called.
    cout << B.GetX( ) << ',' << B.GetY( ) <<endl;
    cout << C.GetX( ) << ',' << C.GetY( ) <<endl;
}
```

**(2) Used implicitly** when we copy an object to **pass it as an argument** to a
function. (Reason for using a reference as the parameter type.)

```cpp
void fun1(Point p) {
    cout << p.GetX( ) << ',' << p.GetY( ) <<endl;
}
void main( )
{
    Point A(1,2);
    fun1(A);          //copy constructor is called.
}
```

Callout: *When we define a function we'd better use the reference type of the
parameter, in order to avoid calling the copy constructor when passing the argument
to a function.*

**(3) Used implicitly** when we copy an object to **return it from a function**:

```cpp
Point fun2( )
{
    Point A(1,2);
    return A;         // copy constructor is called.
}
void main( )
{
    Point B;
    B=fun2( );
}
```

## Flagged after compiling with g++ 13, with a message printed from the copy constructor

| Slide's case | Copy constructor called? |
|---|---|
| `Point B(A);` | yes |
| `Point C = A;` | yes |
| `fun1(A);` parameter by value | yes |
| `fun1(A);` parameter by reference | **no** |
| `return A;` in `fun2` | **not by default**; yes with `-fno-elide-constructors` |

1. **For `return A;` the slide says the copy constructor is called, but a modern
   compiler removes that copy** (copy elision), so nothing prints. It is called when
   elision is switched off. For the exam, **answer what the slide says**; know that
   real output may differ.
2. Slide 1 declares the copy constructor, `Point(const Point& p);`, with **no body**.
   It is only a declaration; calling it without a definition would fail to link.
3. `GetX()` and `GetY()` on the slide are not `const`, so they cannot be called on a
   `const Point&`. A `const` reference parameter, which the slides recommend, needs
   `const` getters.

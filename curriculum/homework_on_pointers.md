# Homework on Pointers

Source: `homework_on_pointers.doc` — an actual exam-format paper (fill-in-blank, MCQ, "write out the result" tracing). **Status: completed in full** — see `handover/HANDOVER.md` for her results and the mistakes walked through.

## I. Fill in the blanks

1. Given `int *var, ab; ab=100; var=&ab; ab=*var+10;` — the value of `ab` is **110**.
2. Given `double var;`:
   a) define a pointer `p` pointing to a double: `double *p = NULL;`
   b) make `p` point to `var`: `p = &var;`
   c) use `cin` to read a value into `var` through `p`: `cin >> *p;`
3. Given `int a[10], *p=a;` — we may use `p` (as well as `&a[0]`) to express the address of `a[0]`. Express the address of `a[i]` and access `a[0]` and `a[i]`, **using only pointer `p`** (no `a[]` indexing).
4. Given `char *p = "abcd\0ef";` — `cout<<p` prints `abcd` (stops at the embedded `\0`); `cout<<*(p+1)` prints `b`; `strlen(p)` is `4`.
5. Max/min via pointer — fill in the blanks:

```cpp
#include <iomanip>
#include <iostream>
using namespace std;
void main(void)
{
    int a[10], *pa, max, min;
    cout << "input 10 numbers:" << endl;
    for (int i = 0; i < 10; i++)
        cin >> a[i];

    for ( /* ??? */ ; /* ??? */ ; pa++)
        if ( /* ??? */ ) max = *pa;
        /* ??? */ (*pa < min) min = *pa;
    cout << "array:";

    for (int i = 0; i < 10; i++)
        cout << "   " << *(pa + i);
    cout << "the maximum is :" << max << ",minimum is:" << min << endl;
}
```

## II. Multiple choice

Answer key below is **transcribed exactly as marked in the source document** —
only some questions have a letter marked there. Where none is marked, none is
given here either (don't invent one); work it out from first principles or
ask when teaching this.

1. Given `int a=3, *p=&a;` — the value of `*p` is: A) the address of variable a  B) meaningless  C) address of variable p  D) 3

   *(no answer marked in source)*
2. Given `int i, j=7, *p; p=&i;` — the statement `i=j;` is equivalent to: A) `i=*p;`  B) `*p=*&j;`  C) `i=&j`  D) `i=**p;`

   *(no answer marked in source)*
3. Given `int *p1, *p2=&a; p1=b;` — the type of `a` and `b` respectively: A) int and int  B) int and int\*  C) int\* and int  D) int\* and int\*

   *(no answer marked in source)*
4. Given `int a=10, *p=&a;` — which is **wrong** for accessing `a`? **A) `*&p`**  B) `*p`  C) `p[0]`  D) `*&a`  E) `a`
5. Correct expression to point `p` at the first element of array `a`: A) `p=a` or `p=a[0]`  B) `p=a` or `p=&a[0]`  C) `p=&a` or `p=a[0]`  D) `p=&a` or `p=&a[0]`

   *(no answer marked in source)*
6. `p1`, `p2` point to the same integer array, `k` is a double. Which is **wrong**? A) `k=*p1+*p2;`  **B) `p2=k;`**  C) `p1=p2;`  D) `k=*p1*(*p2);`
7. Given `char str[5];` — which does **not** express the address of `str[1]`? A) `str++`  B) `str+1`  C) `&str[0]+1`  D) `&str[1]`

   *(no answer marked in source)*
8. Which statement is **not** right? A) we may compare two pointers in some cases.  B) we may assign NULL to a pointer.  C) we may add an integer to a pointer.  D) we may add two pointers.

   *(no answer marked in source)*
9. Given `int a[10]={1,2,3,4,5,6,7,8,9,10}, *p=a;` — which expression gives `6`? A) `*p+6`  B) `*(p+6)`  **C) `*p+=5`**  D) `p+5`
10. What does this code do?
    ```cpp
    char x[] = "How old are you?";
    char *y = x;
    while (*y++) {}
    cout << y-x-1 << endl;
    ```
    **A) get the length of the string**  B) get the address of the string  C) compare two strings  D) concatenate y and x
11. Given `int a[]={1,2,3,4,5,6,7,8,9,0}, *p, i; p=a;` (0<i<10) — which is the **wrong** way to express an element? A) `*(a+i)`  B) `a[p-a]`  C) `p+i`  D) `*(&a[i])`

    *(no answer marked in source)*
12. Given `int a[10], *p=a;` — which is a **wrong** expression? A) `p=p+1`  B) `p[0]=*p+1;`  C) `a[0]=a[0]+1`  **D) `a=a+1;`**
13. Given `char *s="hello!";` — which makes `p` point to `s`(the same string)? **A) `char *p=s;`**  B) `char *p=&s;`  C) `char *p; p=*s;`  D) `char *p; p=&s`
14. Which operator is meaningless between two pointers? **A) `+`**  B) `-`  C) `==`  D) `=`
15. After `char str[]="world", *ptr=str;` — the value of `*(ptr+5)` is: **A) `'d'`**  B) `'\0'`  C) unknown  D) the address of `'d'`

    *(Marked A in source. Worth double-checking when teaching: `"world"` has 5 letters at indices 0-4, so index 5 is where the `\0` terminator lives — this looks like it should be B, not A. Flag the discrepancy rather than silently teaching the source's marked answer as fact.)*
16. Given `int a[]={1,2,3,4,5,6}, *p=a;` — which expression has value `5`? A) `p+=5;*p++;`  **B) `p+=3;*(++p);`**  C) `p+=4;*++p;`  D) `p+=4;++*p;`
17. Given `int x[]={1,9,10,7,32,4}, *ptr=x, k=1;` (0≤k<6) — correct expression for an element's address: A) `x++`  B) `&ptr`  C) `&ptr[k]`  D) `&(x+1)`

    *(no answer marked in source)*
18. Which is **wrong**? A) `char a[]="china";`  B) `char a[10], *p=a; p="china";`  C) `char *a; a="china";`  **D) `char a[10], *p; p=a="china";`**

**Note:** the tutoring transcripts refer to this section as "19 questions"; only 18 are present in the extracted text. If a 19th question exists in the original `.doc`, it wasn't captured here — check the original file if the count matters.

## III. Write out the result

Trace each program by hand.

**1.**
```cpp
#include <iostream>
using namespace std;
void main() {
    int *v, b;
    v = &b;
    b = 100;
    *v += b;
    cout << "b=" << b << endl;
}
```

**2.**
```cpp
#include <iostream>
void main(void) {
    using namespace std;
    int a1 = 11, a2 = 22, t;
    int *p1 = &a1, *p2 = &a2;
    cout << "a1=" << a1 << ",a2=" << a2 << endl;
    cout << "*p1=" << *p1 << ",*p2=" << *p2 << endl;
    t = *p1; *p1 = *p2; *p2 = t;
    cout << "a1=" << a1 << ",a2=" << a2 << endl;
    cout << "*p1=" << *p1 << ",*p2=" << *p2 << endl;
}
```

**3.** (contrast with #2 — swaps the *pointers*, not the values)
```cpp
#include <iostream>
void main(void) {
    using namespace std;
    int a1 = 11, a2 = 22;
    int *p1(&a1), *p2(&a2), *p;
    cout << "a1=" << a1 << ",a2=" << a2 << endl;
    cout << "*p1=" << *p1 << ",*p2=" << *p2 << endl;
    p = p1, p1 = p2, p2 = p;
    cout << "a1=" << a1 << ",a2=" << a2 << endl;
    cout << "*p1=" << *p1 << ",*p2=" << *p2 << endl;
}
```

**4.**
```cpp
#include <iostream>
using namespace std;
void main(void) {
    int a[9] = {1,2,3,4,5,6,7,8,9};
    int *p = a, sum = 0;
    for (; p < a+9; p++)
        if (*p % 2 == 0) sum += *p;
    cout << "sum=" << sum << endl;
}
```

**5.**
```cpp
#include <iostream>
using namespace std;
void main(void) {
    char *s = "ab5eafegdacdf", *p;
    int i, j, a[] = {0,0,0,0};
    for (p = s; *p != '\0'; p++) {
        j = *p - 'a';
        if (j >= 0 && j <= 3) a[j]++;
    }
    for (i = 0; i < 4; i++)
        cout << "  " << *(a+i);
    cout << endl;
}
```

**6.**
```cpp
#include <iostream>
using namespace std;
void main(void) {
    char b[] = "ab12cd34ef", *a = b;
    int i, j;
    for (i = j = 0; a[i]; i++)
        if (a[i] >= 'a' && a[i] <= 'z')
            a[j++] = a[i];
    a[j] = '\0';
    cout << a << endl;
}
```

# Mock Exam Paper (June 2026)

Source: `mock_paper_2026-06.docx`. Uploaded 2026-09-10, the day before the
exam. Originally named with a course/semester code; renamed and its author
metadata stripped as part of the privacy pass.

This is the **second document in the exam's own format**, after
`homework_on_pointers.doc`, and the more useful of the two because it covers
the whole paper shape: multiple choice, "write out the result" tracing, and
fill-in-the-blank program completion.

Worked through in full with Wifey — see `handover/HANDOVER.md` for which
parts she got right. Answers below were **derived and verified by compiling
and running each program**, not taken from an answer key; the paper ships
without one.

---

## I. Choices (3 points each)

Same ten questions she had already photographed and worked through on
6 September. Full text with the source's own partial answer key is in the
handover; the questions cover: cstring length with an escape character,
`char c = 'B' + 2`, pointer comparison, valid array subscripts, `cout << s+2`
on a char array, `!a` with a fall-through `if/else if`, address expressions
equal to `&arr[2]`, matching a `void fun(int*, int)` prototype, default
arguments, and `sizeof(array)` vs `sizeof(pointer)`.

## II. Write out the result (7 points each)

### 1 — `switch` fall-through

```cpp
int main() {
    int x = 3, y = 7;
    while (x < y) {
        switch (x) {
            case 2: x += 2; break;
            case 3: y -= 1;
            case 4: x += 3; break;
            default: y -= 2;
        }
        cout << x << " " << y << endl;
        x++;
    }
    return 0;
}
```

**Output: `6 6`**

`case 3` has no `break`, so control falls through into `case 4` and runs
`x += 3` as well. One iteration only. Putting a mental `break` after `case 3`
gives the wrong two-line answer `3 6` / `7 6`.

### 2 — reference parameter, and output from inside a function

```cpp
int func(int &x, int y) {
    x = x + y;
    y = x - y;
    cout << x << " " << y << " " << endl;
    return x * y;
}
int main() {
    int a = 3, b = 7;
    cout << func(b, a) << " ";
    cout << a << " " << b << endl;
    return 0;
}
```

**Output:**
```
10 7 
70 3 10
```

`x` is a reference to `b`, so `b` becomes 10; `y` is a copy, so `a` stays 3.
The function prints its own line *before* `main` prints anything, because
`func(b, a)` must be evaluated before `cout` can print its result.

### 3 — 2D array, two conditions with `||`

```cpp
int a[3][3] = {{1,2,3},{4,5,6},{7,8,9}};
int sum = 0;
for(int i=0;i<3;i++)
    for(int j=0;j<3;j++)
        if(i==j || i+j==2)
            sum += a[i][j];
cout << sum << endl;
```

**Output: `25`** — cells (0,0)=1, (0,2)=3, (1,1)=5, (2,0)=7, (2,2)=9.

The centre cell (1,1) satisfies *both* conditions but the loop visits it once,
so 5 is added once. Summing the two diagonals separately gives 30 and is wrong.

### 4 — pointer walk and `*p++`

```cpp
char str[20] = "Hello";
char *p = str;
while (*p != 'l') p++;
*p++ = '!';
cout << str << endl;
```

**Output: `He!lo`**

The loop stops with `p` at index 2 (the first `l`). In `*p++ = '!'` the
assignment happens at the *current* address first; the increment afterwards
changes nothing that is printed.

## III. Complete the programs (3 points)

### 1 — return the address of the first element greater than a value

```cpp
int* findFirstGreater(int arr[], int size, int value);   // NOTE: see below

int main() {
    int arr[6] = {2, 5, 7, 3, 9, 4};
    int threshold = 6;
    int* p = findFirstGreater(arr, 6, threshold);
    if (p != NULL)
        cout << *p << endl;
    else
        cout << "Not found" << endl;
    return 0;
}

int* findFirstGreater(int arr[], int size, int value) {
    for (int i = 0; i < size; i++) {
        if (arr[i] > value) {
            return &arr[i];
        }
    }
    return NULL;
}
```

**Output: `7`**

Blanks in order: `int*`, `NULL`, `int arr[]`, `arr[i] > value`, `&arr[i]`,
`NULL`. The function's declared return type is `int*`, so it must return an
**address** (`&arr[i]`), not a value.

**Flaw in the source paper:** as printed, `findFirstGreater` is called in
`main` before it is defined and no prototype is given, so the code will not
compile. A prototype above `main` is needed.

### 2 — Goldbach: all prime pairs summing to n

```cpp
bool isPrime(int x) {
    if (x < 2) return false;
    for (int i = 2; i <= sqrt(x); i++) {
        if (x % i == 0) return false;
    }
    return true;
}

int main() {
    int n;
    cin >> n;
    cout << "Prime pairs: " << n;
    for (int p = 2; p <= n / 2; p++) {
        int q = n - p;
        if (isPrime(p) && isPrime(q)) {
            cout << "(" << p << ", " << q << ")";
        }
    }
    return 0;
}
```

Blanks in order: `false`, `x % i == 0`, `true`, `cin >> n`, `n - p`,
`isPrime(p)` and `isPrime(q)`.

Verified:
```
n = 10  →  Prime pairs: 10(3, 7)(5, 5)
n = 20  →  Prime pairs: 20(3, 17)(7, 13)
```

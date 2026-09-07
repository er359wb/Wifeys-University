# Function Overloading, Default Arguments

Source: `20260612overloaded_function_.docx`

## 1. Overload `left()`

Version 1: `left(string, n)` returns a pointer to a *new* string consisting of the first n characters of the original.

Example: `left("theory", 3)` constructs `"the"` and returns a pointer to it.

Version 2 (overload): `left(int, n)` returns the first n digits of an integer, e.g. for reading the first 3 digits of a zip code.

Example: `left(212013, 3)` returns `212`.

(Note from tutoring: the worksheet's own phrasing asks for pointer-returning versions, but this predates the pointers unit — clarify with Wifey whether a simplified `string`-returning version is acceptable instead.)

## 2. Overload `Combine()`

- `Combine(int, int)` — concatenates two integers as digits.
- `Combine(int, char[])` — repeats a C-string N times.

```cpp
cout << Combine(12, 34);   // 1234
cout << Combine(3, "ab");  // ababab
```

## 3. Overload `calculate()`

```cpp
cout << calculate(1, 2, '+');  // 3   — executes 1+2
cout << calculate(2.5, 3);     // executes 2.5^3
```

(Note: the worksheet's own sample output for `calculate(2.5,3)` says `16.22`, but 2.5³ = 15.625 — likely a source typo; teach the correct power logic and flag the discrepancy if it comes up.)

## 4. Delete common elements between two sorted arrays

```cpp
int a[5], b[5];
// input a: 1 3 4 5 6
// input b: 2 4 6 8 9
cout << a; // 1 3 5
cout << b; // 2 6 8 9
```

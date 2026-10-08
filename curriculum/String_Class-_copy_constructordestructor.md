# MyString Class — dynamic memory in a class

Source: `String_Class-_copy_constructordestructor.docx`. Second assignment of
the autumn semester (after `Complex_Class_`). Reformatted companion — read
this, not the `.docx`.

Design and implement a C++ class `MyString` that manages a character array on
the heap.

## Data members — exactly two, both private

- `char* data;` — pointer to heap memory holding the characters
- `int length;` — number of valid characters, **excluding** the null terminator

## Memory management note (from the sheet)

You are **NOT** required to write a copy constructor or a destructor for this
assignment. You only need to use `new[]` to allocate and `delete[]` to release
old memory before re-allocating. (Leaks are acceptable for this exercise.)

## Member functions

### 1. Default constructor

- Allocate 1 char with `new char[1]`
- Set its first element to `'\0'`
- Point `data` at it
- Set `length` to 0

### 2. Parameterized constructor — parameter `const char* str`

- If `str` is `nullptr`, behave like the default constructor
- Compute the length of `str` **manually** (loop until `'\0'`)
- Allocate `length + 1` chars with `new char[length + 1]`
- Copy the characters in, always null-terminated
- Set `length`

### 3. `int getLength() const`

Returns `length`. Must be `const`.

### 4. `void print() const`

Prints `data` with `cout`, then a newline. Empty string prints a blank line.

### 5. `void append(const char* str)`

- If `str` is `nullptr`, do nothing and return
- Compute the length of `str`
- Allocate a new block of `this->length + length_of_str + 1`
- Copy existing characters from `data` into it
- Append the characters of `str`
- Null-terminate
- `delete[]` the old `data`
- Point `data` at the new block
- Update `length`

### 6. `void assign(const char* str)`

- First `delete[] data;`
- If `str` is `nullptr`: allocate 1 char, set `'\0'`, `length = 0`
- Otherwise: compute the length, allocate `length + 1`, copy, null-terminate
- Update `length`

### 7. `char* find(char ch)`

- Loop over `data` from index 0 to `length - 1`
- Compare each character with `ch`
- On a match, return the address of that character
- If the loop finishes with no match, return `NULL`

## Inconsistencies in the sheet — flagged, not silently fixed

1. **The filename says "copy constructor/destructor" but the sheet says they
   are not required.** Treat the text of the sheet as the requirement.
2. **Function 7 is garbled in the source:** it is written `=char *find(char
   ch)` with a stray `=`. The signature is `char* find(char ch)`.
3. **Function 7 contradicts itself.** It says "returns the address of that
   character" and, in the same bullet, "(0-based indexing)". An address and an
   index are different things; the return type `char*` means address. Written
   as the signature says: return a pointer to the matching character.
4. **Stray markdown in the source:** function 4's signature has a stray
   backtick, function 5's heading starts with `****`. Cosmetic only.
5. **No test sample is given**, unlike `Complex_Class_`. A `main` has to be
   written to exercise the class.

## Concepts this assignment requires

- `char*` and a pointer that owns heap memory
- `new char[n]` / `delete[]` — dynamic allocation (covered last semester:
  both check questions answered correctly, see handover)
- null terminator `'\0'`, and why the array is one longer than `length`
- `const char*` parameters and `nullptr` checks
- measuring a C-string by hand with a loop (no `strlen`)
- `const` member functions (met in `Complex_Class_`)
- returning a pointer from a member function (`find`)
- the allocate-new / copy / `delete[]` old / re-point pattern (`append`)

Verified: a reference implementation of all seven functions was compiled with
`g++ -Wall` and run; the sheet is implementable exactly as written.

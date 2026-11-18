# Midterm brief for an AI tutor

Written Tuesday 2026-11-17 for a student called "Wifey" (a stand-in name). Everything
here was observed in tutoring sessions and checked by compiling with g++ 13 unless said
otherwise. It is information only: no tests, no exercises.

## 1. The situation

- C++ course, second semester, unit "Class and Objects". **Midterm: Thursday 2026-11-19.**
- She has little time and wants short messages. She reads Russian and English; she writes
  mostly Russian with English code. **Answer in Russian, keep code in English.**
- She told us she did not pass last semester's exam, so this is a high-stakes retake-style
  situation for her.
- **The exam format is not known.** Ask her. Evidence: the teacher's lecture deck ends with
  TRUE/FALSE and multiple-choice questions, and the teacher shows "what does this program
  print" snippets with constructors that print messages (see section 6).

## 2. Scope, as she gave it

Syllabus "1 CLASS AND OBJECTS":
1.1 Define a class & objects · 1.2 Overload member functions · 1.3 Constructors ·
1.4 Copy constructor · 1.5 Destructor · 1.6 Implicit `this` pointer · 1.7 Case study: linked list.
She also said the exam includes **operator overloading** and **inheritance**, which are not in that list.

## 3. The student

**Strengths.** Reads and traces code well when the procedure is mechanical (4/4 on tracing in
a last-semester practice paper). Writes correct `&&` conditions. Asks good "why" questions about
structure (why is the body outside the class, does `if` need a loop, where must a function sit
in the file). Learns fast from one concrete worked example. Coined "cross-multiply" herself.
Read a `u` on the teacher's screen more carefully than the tutor did.

**Weaknesses, in order of how often they cost her.**
1. **Writing from a blank page.** The blank page is the hard part; fixing code once the
   problem is named is easy.
2. **Translating an idea or a hand calculation into code names.** Fixed by a table that maps
   each number in a worked hand example to its code name.
3. **Type confusion.** Class name used as a variable (`struct Student[4]`, `Student[j]`); a `char`
   given where an address is expected (`setNext(d)`, `Node *p = Head->getData()`).
4. **Uninitialised variables, including pointers** (a `Head` pointer left without `new`
   "worked" by luck, then crashed when the compiler filled memory with a pattern).
5. **Mixing a constructor's parameter names with field names** in other functions (`num`/`den`
   used inside `simplify`). Naming a parameter the same as the field breaks `x = x;`.
6. **Return versus print swapped** (`getBalance` printed, `display` returned).
7. **Small syntax:** missing `;` after a class's `}`, missing `()` on a call (`Head->getNext`),
   `Fraction::` put on a friend function, `void` return on `operator<<`, braces missing
   after `if`/`else`.
8. **Rewrites whole code instead of editing,** and often does not apply a multi-item list of
   fixes. Give exact "was / becomes" lines.
9. **Multiple choice answered by eye** (last semester: 4/10 on MCQ but 4/4 on tracing). Computing
   on paper recovers most of the lost marks. Truth values (`NULL`/0 is false) were missed three times.

**What works when teaching her.**
- One small step per message; she says "next" when ready. Do not pile on.
- Concept first with a picture or analogy, then ask for ONE short piece of code. When she says
  "I don't understand", ask for one line, not the whole program.
- **Show the compiler's actual error and a real run** instead of asserting. Tables work well.
- If her own approach is valid, follow it (she objected when told to discard a correct one).
- Do not hand over answers straight after asking a question. Under deadline she will ask
  "just give me the code"; then give it, but state plainly it is not evidence she can do it.
- Never tell her to go check something herself; do the checking and show the result.

## 4. Work done this semester and its honest status

| Topic | Status |
|---|---|
| `Fraction` class (11-item written assignment: copy ctor, `=`, member `+`, `+=`, `==`, `<`, prefix/postfix `++`, `<<`, `>>`, `[]`) | She wrote constructor, `simplify`, `gcd`, `display`, friend `+`, `==`, drafts of `<<` and `>>` (four fixes pending); **not written:** copy ctor, `=`, `+=`, `<`, `++`, `[]` |
| `Complex` class | first lines were hers; the rest tutor-written; not understood-evidenced |
| `MyString` (`new[]`, `char*`) | not started |
| Linked list with head node | she wrote both `Linkedlist` constructors and `display()`; `length()` is one word off (`getData` for `getNext`); insertion, deletion, destructor not started |
| Bank account inheritance (`Account`, `SavingAccount`, `CreditCardAccount`) | she wrote the base class constructor, `deposit`, `getBalance`, `display`; the rest was **tutor-written**; `virtual` and the derived constructor syntax were explained |
| Destructor, `this`, copy constructor, `const` members, initializer list | **summarised from the lecture decks, not yet taught to her** |

## 5. Key facts (verified)

**1.1 Class and objects.** A class combines data and the methods that act on it. Members
default to **private** in a `class` (public in a `struct`). Data goes in the private section,
functions in the public section (data hiding, encapsulation). Private members are reachable
only from member functions and friends. A semicolon is required after the closing brace.
A class **cannot contain a data member of its own type** (`class Node { Node n; };` is
`incomplete type`) but **can contain a pointer or reference** to its own type, which is why a
list node holds `Node* next`. Storage is allocated when an **object** is defined, not when the
class is. Each object has its own copy of the data members; all objects share one copy of each
member function. The lecture slides mark an in-class initialiser (`int year=2007;`) as wrong;
C++11 allows it, so follow the slide for the exam.

**1.2 Overloading and default arguments.** Two functions in the same scope with the same name and
a different parameter list are overloaded. A member function can also be overloaded on `const`
(a const object uses only the const version; a non-const object prefers the non-const one).
Default arguments appear in the declaration only, not again in the out-of-class definition
(repeating them is an error). `o.add(3, 4.5)` with `add(int,int)` and `add(double,double)` is
**ambiguous**, although a slide shows it as a plain call.

**1.3 Constructors.** Same name as the class, no return type, public, run automatically once
when an object is created, cannot be `const`. The compiler supplies a do-nothing default
constructor **only if you define none**; once you define any constructor you must provide your
own default constructor (or give all parameters defaults) if you want `T t;` to work. The
**initializer list** (`Date(int y,int m,int d) : year(y), month(m), day(d) {}`) goes on the
definition only; members are initialised in **declaration order**, not list order; it is
mandatory for `const` or reference members and for members whose class has no default
constructor.

**1.4 Copy constructor.** `T(const T&)`. Called when a new object is initialised from an
existing one (`T B(A); T C = A;`), when an object is **passed by value**, and (per the slides)
when an object is **returned by value**. It takes a reference because a by-value parameter would
need a copy to make the copy. Modern compilers **elide** the copy on `return A;`, so a printed
message may not appear; the slide still says it is called. The compiler's own copy copies member
by member, so with a **pointer member** two objects end up sharing one block and the destructor
frees it twice (tested: `double free` abort); the fix is a copy constructor that allocates new
memory and copies the contents (deep copy). A copy constructor taking a non-const `T&` cannot
copy from a temporary, which is an error in C++98/C++11 for `return T(...)`.

**1.5 Destructor.** `~ClassName()`, no return type, no parameters, cannot be overloaded, public.
Called automatically when a stack object leaves its scope, and for an object made with `new`
only when it is `delete`d. Order is the **reverse of construction**. It is needed when the
class acquired a resource, e.g. memory from `new`: it must `delete` it.

**1.6 `this`.** Every member function has a hidden first parameter, a pointer `this` to the
object it was called on. `A.print()` is `print(&A)`. Inside, `x` means `this->x`. `*this` is the
object itself, used for `return *this;` in `operator=`, `+=`, prefix `++`.

**`const` member functions.** `this` points to a const object: the function may not change the
object and may not call a non-const member. `const` goes on both declaration and definition.
A const object can call only const members.

**1.7 Linked list (head-node version, as taught).** A node holds data and `next`; the last
`next` is `NULL`. `Head` points to a **head node that holds no data**; an empty list is a head
node whose `next` is `NULL`. The first data node is `Head->getNext()`. Walk with a pointer:
`p = Head->getNext(); while (p != NULL) { ...; p = p->getNext(); }`. **Insert** by finding the node
**before** the position: `new->next = before->next; before->next = new;`. **Delete** by finding
the node before the victim: `victim = before->next; before->next = victim->next; delete victim;`.
The head node simplifies both because "insert at the front" is no longer a special case.
Length counts data nodes only. The destructor must walk the chain and `delete` every node,
including the head node. Operations the teacher lists: constructor, `isEmpty`, `print`,
`getLength`, `get(pos)`, `find(value)`, `find(pos)`, `insertAtHead`, `insertAtTail`,
`insertAt(pos,value)`, `removeAt(pos)`, `clear`, destructor; and "insert in ascending order".
The sheet does not say whether `pos` starts at 0 or 1. A node cannot be accessed by array index;
position k means k steps from the head node.

**Operator overloading.** Lecture rules: all operators can be overloaded except `.`, `.*`, `::`,
`?:`, `sizeof`; only existing operators; precedence, associativity and operand count are fixed;
at least one operand must be of class type. A **member** binary operator has one parameter and
its left operand is the object itself, so `c1 + 5` works (via `Complex(5)`) but `5 + c1` does
not; a **friend** (non-member) takes both operands and is written without `Fraction::` and
without repeating `friend`. `=`, `[]`, `()` and `->` **must be members**; `<<` and `>>` must be
non-members, declared `friend`. `operator<<(ostream&, const T&)` returns `ostream&` (so chains
work); `operator>>(istream&, T&)` returns `istream&` and its object parameter is **non-const**.
`operator=(const T&)` returns `T&` via `return *this`. **Prefix `++`** returns `T&`; **postfix
`++`** has a dummy `int` parameter and returns a copy of the old value by value. `==` and `<`
return `bool`. Adding fractions by cross-multiplying and letting the constructor reduce works;
a `gcd` that returns 0 for a zero or negative first argument leaves `0/4` and `-4/12` unreduced.

**Inheritance.** `class SavingAccount : public Account`. The derived class gets all base
members; the base knows nothing of the derived ones. A derived constructor must call a base
constructor in its initializer list (`: Account(no, name, b)`); if the base has no default
constructor and this is left out, the error is `no matching function for call to
'Account::Account()'`. Construction runs base then derived, destruction the reverse. The base's
**private members are not accessible to the derived class**; `protected` is the tool for that,
but she says her class has not covered it, so a workaround is to use the base's public functions
(`deposit(-amount)`). **To make a base-class pointer run the derived version, the base function
must be `virtual`** (tested: without it, `Account* p = &creditCard; p->withdraw(900);` ran the
base version and refused; with it the card went to -900). The teacher said "virtual" in class.

## 6. What to expect and caveats

- The teacher's tracing snippets: a `Complex` class whose constructors print `"2!"` / `"1!"`
  or `"two parameter constructor!"`, a copy constructor that prints `"copy constructor!"`, a
  destructor that prints `"object expires!"`, and `add` taking and returning by value. They test
  exactly the order of constructor, copy-constructor and destructor calls. A real compiler and
  the slides can differ on the copy at `return`.
- The lecture deck's quiz items are TRUE/FALSE and multiple choice about class members, access
  and compile errors.
- **Course compiler:** classroom photos show Dev-C++ 5.11 with TDM-GCC 4.9.2. GCC of that
  generation defaults to the older C++ standard unless told otherwise (not verified for her
  exact setup), so use `NULL` rather than `nullptr`, and expect no C++11 conveniences.
- The class and operator lecture slides contain typos (`Return a;`, `is>>s.a`, a class spelt
  `Poin`, a forward-declaration example that does not compile as written); treat the lecture's
  intent as the answer.

## 7. Where the detail lives

Public repository `er359wb/Wifeys-University`, branch `cpp-programming-tutoring`:
`handover/HANDOVER.md` (full progress record), `curriculum/*.md` (assignment sheets and
transcribed lecture slides, each with a list of points the source leaves unstated).

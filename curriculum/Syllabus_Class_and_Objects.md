# Syllabus excerpt — "1 CLASS AND OBJECTS" (autumn semester)

Source: a screenshot Wifey sent on 2026-11-16 while preparing for a **midterm on
Thursday 2026-11-19**. Transcribed here; the screenshot itself is not committed.
She says this picture is **not the full content** of the semester: the exam also
covers operator overloading and inheritance, which are not in the list.

## The list as shown

1. CLASS AND OBJECTS
   - 1.1 Define a class & objects
   - 1.2 Overload member functions
   - 1.3 Constructors
   - 1.4 Copy Constructor
   - 1.5 Destructor
   - 1.6 Implicit `this` Pointer
   - 1.7 case study — Linked list

## Added by Wifey (from the work done in tutoring)

- operator overloading (the `Fraction` assignment, `Operator_Overloading_Comprehensive.md`)
- inheritance and `virtual` (`BankAccountInheritanceProblem.md`)

## How the exam format is known

Not known. No topics list from the teacher beyond the above, and no format
(multiple choice, trace the code, write a program) has been stated for this exam.

## Coverage so far, by item

| Item | State, with evidence |
|---|---|
| 1.1 class and objects | covered; she wrote classes herself (`Fraction`, `Linkedlist`, `Account`) |
| 1.2 overload member functions | not taught as a topic; only default arguments and operator overloads seen |
| 1.3 constructors | covered; written by her in `Fraction`, `Linkedlist`, `Account` |
| 1.4 copy constructor | partly: she wrote one in the first `Complex` start, and why it takes `const T&` was explained; never written independently since |
| 1.5 destructor | **not taught**; only construction and destruction order was shown once |
| 1.6 implicit `this` pointer | **not taught** |
| 1.7 linked list | in progress: both constructors and `display` written by her, `length()` one word from correct |
| operator overloading | partly: `friend +`, `==`, `<<`, `>>` written; `=`, `+=`, `<`, prefix/postfix `++`, `[]` not yet |
| inheritance, `virtual` | explained; the whole program was written by the tutor, not by her |

## Lecture slides received so far (2026-11-16)

| Syllabus item | Slides |
|---|---|
| 1.1 | `class.md` |
| 1.2 | `overload.md` |
| 1.3 | `constructor.md` |
| 1.4 | `copy_constructor.md` |
| 1.5 | `deconstructor.md` |
| 1.6 `this` | not received |
| 1.7 | `construction_of_linked_list.md` |

The slides say destructors and the `this` pointer are part of the course, so the
exam can ask about them even though tutoring has not reached them yet.

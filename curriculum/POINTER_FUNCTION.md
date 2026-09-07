# POINTER_FUNCTION

Source: `POINTER_FUNCTION.docx`

## Task 1 — Student sort / highest / above-average

Input five students with their student ID and C++ score. Define 3 functions (**no `<algorithm>` allowed**):

1. Sort students by score (descending).
2. Output the student ID of the highest score.
3. Output the students who scored above average.

Write `main()` to test all three.

```
Please enter 5 students' ID and C++ score:
101 90
102 85
103 95
104 70
105 80

--- Students sorted by score (descending) ---
ID: 103, Score: 95
ID: 101, Score: 90
ID: 102, Score: 85
ID: 105, Score: 80
ID: 104, Score: 70

Student ID(s) with highest score: 103

--- Students above average ---
Students with scores above average (84):
ID: 103, Score: 95
ID: 101, Score: 90
ID: 102, Score: 85
```

## Task 2 — Palindrome m, m², m³

Find all numbers m in [11, 999] such that m, m², and m³ are all palindromes. A palindrome reads the same forwards and backwards (e.g. 121, 12321).

Requirement: define a function to test whether a number is a palindrome. Each qualifying m should be printed on its own line, along with its square and cube for verification.

**Status: done** — see `handover/HANDOVER.md` for the working solution and the concept-check evidence.

## Task 3 — Bank Account Management System

Implement a simple bank account manager using only functions: create account, deposit, withdraw, check balance.

Core requirements:
- **No global variables** — all data passed between functions explicitly.
- **Balance passed by reference** so changes inside functions affect the original in `main`.
- The program loops, showing a menu repeatedly until the user exits.
- Each operation is its own function.

Skeleton given in the worksheet (blanks are the worksheet's own, to fill in):

```cpp
int main() {
    int ?????;
    createAccount(????);
    int choice, amount;
    while (true) {
        menu();
        cin >> choice;
        switch (choice) {
            case 1:
                cout << "Enter deposit amount: ";
                cin >> amount;
                deposit(???, amount);
                break;
            case 2:
                cout << "Enter withdrawal amount: ";
                cin >> amount;
                withdraw(???, amount);
                break;
            case 3:
                showBalance(???);
                break;
            case 4:
                cout << "Thank you, goodbye!" << endl;
                return 0;
            default:
                cout << "Invalid option, please try again!" << endl;
        }
    }
}
```

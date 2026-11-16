# Bank Account Class Design — inheritance and method overriding

Source: `BankAccountInheritanceProblem.docx` (original upload name had
`English_1` appended; dropped). Reformatted companion — read this, not the
`.docx`. Received 2026-11-16. A new topic: **inheritance, overriding, and a
base-class pointer**.

## 1. Background

A bank system manages two kinds of accounts: savings accounts and credit card
accounts. They share many features, yet each has its own business rules. Use
class inheritance to design a proper class hierarchy.

## 2. Design requirement

A base class `Account`, and two subclasses `SavingAccount` and
`CreditCardAccount`.

## 3. Members of `Account`

Data members, **all private** ("demonstrating encapsulation"):

| Member | Type |
|---|---|
| `accountNo` (account number) | `string` |
| `ownerName` (owner name) | `string` |
| `balance` | `double` |

Member functions, public:

| Function | Meaning |
|---|---|
| `void deposit(double amount)` | increase the balance |
| `void withdraw(double amount)` | base class gives a **default implementation**: deduct if the balance is sufficient |
| `double getBalance() const` | the current balance |
| `void display() const` | show account information |

## 4. Members of `SavingAccount`

Inherits everything from `Account`, and adds:

- data member `interestRate` (`double`), the annual interest rate
- `void withdraw(double amount)` — **override**: the amount cannot exceed the
  balance; refuse and print a message when the balance is insufficient; the
  balance must never be negative
- `void addInterest()` — compute and add interest according to the rate

## 5. Members of `CreditCardAccount`

Inherits everything from `Account`, and adds:

- data member `creditLimit` (`double`)
- `void withdraw(double amount)` — **override**: allow overdraft within the
  credit limit (the balance may be negative, but not below `-creditLimit`);
  refuse and print a message when the limit is exceeded
- `void repay(double amount)` — repay: increase the balance (note: repayment is
  different from an ordinary deposit)

## 6. Write a `main()` to verify

1. Create a savings account; deposit and withdraw money (including an
   insufficient-balance case); call `getBalance` and `display`.
2. Create a credit card account; withdraw money (including a normal overdraft
   and an over-limit case); call `repay`, then check the balance.
3. Use a **base-class pointer** to refer to each of the two accounts in turn,
   and call `withdraw` to verify that the same function name behaves
   differently in different subclasses.

## Problems in the sheet — flagged, not silently decided

1. **`virtual` is not mentioned, but check 3 cannot work without it.** Calling
   `withdraw` through an `Account*` runs the derived version only if the base
   `withdraw` is declared `virtual`. Compiled both ways, with a credit card
   account holding 0 and `withdraw(900)` called through the base pointer: with
   `virtual` the balance becomes `-900`; without it, the **base** version runs,
   refuses, and the balance stays `0`.
2. **The base data are private, but the derived `withdraw` has to change the
   balance.** A derived class cannot touch a private member of its base. The
   sheet adds no setter or `protected` section. The reference used a small
   `protected` helper `changeBalance(double delta)`, which is an addition; the
   alternatives are to make `balance` itself `protected`, or to call `deposit`
   with a negative amount (works only if `deposit` does not reject negatives, and
   it misuses `deposit`).
3. **`repay` is said to "differ from an ordinary deposit" without saying how.**
   Both increase the balance. The sheet gives no rule (for example a cap, so that
   the balance cannot go above 0). Implemented as a plain increase.
4. **`interestRate` is not defined as a fraction or a percent.** `0.05` and `5`
   give very different results. A fraction (`0.05` meaning 5%) was assumed.
5. **No constructors, no message wording, and no `display` for the derived
   classes are specified.** A base constructor taking number, name and opening
   balance was assumed, with the derived constructors calling it.
6. **`display()` in the base shows base data only.** Showing `interestRate` or
   `creditLimit` would need an override the sheet does not ask for.

## Verified against a reference

A reference with all five points above resolved as stated was compiled with
`g++ -Wall` (no warnings) and printed:

```
Saving: insufficient balance, refused
getBalance = 120
S001 Wifey balance=120
after interest 5%: 126
after normal overdraft: -400
Credit: limit exceeded, refused
after over-limit try:   -400
after repay 250:        -150
Saving: insufficient balance, refused     <- through Account*, savings
savings via pointer: 100
credit  via pointer: -900                 <- through Account*, credit card
```

(The account name `Wifey` in the demo is the stand-in name used throughout this
repository.)

## Concepts this task requires

- inheritance: `class Derived : public Base`
- a derived constructor calling the base constructor in its initializer list
- `private` versus `protected`: what a derived class can and cannot reach
- **overriding**: same signature in the derived class
- `virtual`: needed so a base pointer calls the derived version
- a base-class pointer to a derived object, `Account* p = &s;`
- `const` member functions (met in the `Fraction` work)

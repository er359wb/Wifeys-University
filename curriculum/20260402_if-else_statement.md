# If/Else Statements

Source: `20260402_if-else_statement.docx`

## 1. Sign of a number (`if...else`)

Given an integer, output its sign: `1` for positive, `-1` for negative, `0` for zero.

| Input | Output |
|---|---|
| 1 | 1 |
| -4 | -1 |
| 0 | 0 |

## 2. Leap Year Judgment (`if...else`)

Input a year, determine whether it is a leap year.

A year is a leap year if:
- It is divisible by 4 but not divisible by 100, OR
- It is divisible by 400.

| Input | Output |
|---|---|
| 2024 | 2024 is a leap year. |
| 2000 | 2000 is a leap year. |
| 1900 | 1900 is not a leap year. |

## 3. Game Character Class Judgment (nested `if`)

Enter three values of a character: Strength, Agility, Intelligence (each from 0 to 10). Determine the character's class according to the following rules, **in this order**:

1. If Intelligence ≥ 8 → Mage
2. If Strength ≥ 8 → Warrior
3. If Agility ≥ 8 → Ranger
4. If at least two attributes are ≥ 6 → Omniknight
5. Otherwise → Civilian

| Input (Str, Agi, Int) | Output |
|---|---|
| 5 5 9 | Class: Mage |
| 7 7 4 | Class: Omniknight |
| 3 4 5 | Class: Civilian |

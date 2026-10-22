# Fraction class, part 2 — member operators `==` and `-`

Source: one classroom photo, 2026-10-19, 14:57. **The photo itself is not in
the repository**: a wall poster in the background names the institution, and
this repository is public. This transcription is the only record. It continues
`Fraction_Class_photo_1.md`; the class from that file is unchanged.

## What is on the screen

The teacher extended `main` and highlighted two new lines in red:

```cpp
int main(){
    Fraction a(2,4), b(1,2), c(3,2);
    if(a==b)  cout<<"equal";   // member function        <- red
    a.display();               // output: 1/2
    c.display();               // output: 1u1/2
    c=a-b;                     // as member function     <- red
    c.display();               // output :1
    return 0;
}
int GCD(int a,int b){
    int t;
    ...
```

The red lines are the new work. Both comments say **member function**, in
contrast to `operator+`, which in part 1 is a `friend`.

## What has to be implemented

1. `operator==` as a **member function**: `a == b` is `a.operator==(b)`;
   returns `bool`.
2. `operator-` as a **member function**: `c = a - b` is `c = a.operator-(b)`.

A member operator takes **one** parameter. The left operand is the object the
function is called on, so its fields are used without a prefix; the right
operand is the parameter.

## Problems in the screen, flagged and not silently fixed

1. **The last expected output looks stale.** After `c = a - b;` the comment
   says `output :1`. But a is 2/4 = 1/2 and b is 1/2, so `a - b` is **0**.
   The comment is the same as the earlier `c=a+b` example, where the sum really
   was 1. Most likely it was not updated.
2. **`if(a==b) cout<<"equal";` prints no newline**, so with the lines that
   follow it appears as `equal1/2`. The screen does not say whether that is
   intended.
3. **The teacher's `GCD` on this screen** is a different function from the one
   Wifey wrote (it uses a temporary `t`); only its first lines are visible.
4. **The separator in `1u1/2` is a `u`, not a space.** Part 1's transcription assumed a
   space hidden by the mouse cursor. In this photo no cursor is near it and the `u` is
   plain. Earlier verification in this repository printed `1 1/2` with a space; that
   does not match the screen.

## Verified against a reference

With Wifey's existing class plus the two member operators, compiled with
`g++ -Wall`, the screen's `main` prints:

```
equal1/2
1 1/2   <- printed with a space; the screen shows a u
0/4
```

and `1/2 - 1/3` gives `1/6`, `3/4 - 1/2` gives `1/4`, `a.operator-(b)` and
`a - b` give identical results.

## Two weak spots of her existing `gcd` that subtraction exposes

Her `gcd` returns 0 whenever the first argument is 0 or negative, because its
loop condition is `c <= a`. In `simplify` she guards the division by zero, so
nothing crashes, but nothing is reduced either:

- `a - b` here is `0/4`, **not reduced to `0/1`** (`gcd(0, 4)` is 0)
- `1/6 - 1/2` prints `-4/12`, **not reduced** (`gcd(-4, 12)` is 0)

The screen does not test a negative result. The zero case is on screen, and
its correct answer is 0.

## Concepts this part requires

- operator overloading as a **member** function: one parameter, left operand
  is the object itself
- the difference from `friend operator+`: two parameters, no `this`-side
- `bool` as a return type
- reusing the cross-multiplication from `operator+`, with `-`

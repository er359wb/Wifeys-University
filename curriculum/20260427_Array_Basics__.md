# Array Basics

Source: `20260427_Array_Basics__.docx`

## Basic problems

### Search Element

Write a function to determine whether a target value exists in a given integer array.

### Sum of Array Elements

Take 10 integers as input, calculate/print the sum and average of the **positive** ones. If there are none, output "No positive numbers found."

| Input | Output |
|---|---|
| -1 -2 -3 -4 -5 -6 -7 -8 -9 -10 | No positive numbers found. |
| -5 3 0 7 -2 4 0 9 -1 6 | Sum of positive numbers: 29 / Average of positive numbers: 5.8 |

Approach:
1. Read 10 integers into an array.
2. Traverse, accumulate sum of positives, count them.
3. If positives exist, average = sum/count; else print the no-positives message.
4. Guard against divide-by-zero when there are no positives.

### Maximum and Minimum Values

Given an array of 15 integers, find and output the max and min.

```
Input: -5 7 0 12 -3 4 9 -1 6 2 -8 15 3 -2 10
Output: Maximum value: 15 / Minimum value: -8
```

## Intermediate problems

### Reverse an Array (in place, no extra storage)

Reverse a 1D array's elements in place. Do not use built-in `reverse()` — implement manually.

Approach:
- `left` starts at index 0, `right` starts at index n-1.
- Loop: swap `left`/`right`, move `left` forward and `right` backward.
- Repeat until `left >= right`.

```
Input: 10 20 30 40 50
Output: 50 40 30 20 10
```

### Insert an element

Insert a new element into an array at a specified position. Input: initial array size, the elements, the new value, the insertion position (0-based).

If the position is valid (0 to current size), shift elements from that position rightward by one, then place the new value. If invalid, print an error.

```
Sample 1
Input: size=5, elements=1 2 3 4 5, new element=10, position=2
Output: Updated array: 1 2 10 3 4 5

Sample 2
Input: size=3, elements=7 8 9, new element=0, position=0
Output: Updated array: 0 7 8 9
```

### Remove Specified Elements

Given an array and a target value, remove the element (elements assumed unique in the base version).

```
Sample 1: input 3 1 2 4, target=2 → output 3 1 4
Sample 2: input 5 6 7, target=8 → output "No target number!" then 5 6 7
```

**Extension:** what if there are duplicates?

```
Input: 2 2 1 1 2 2 4 5, target=2
Output: 1 1 4 5
```

(i.e. remove *all* occurrences, not just one — worth confirming which is intended before starting.)

### Selection sort

In-place comparison sort. Maintains a sorted subarray (initially empty) and an unsorted subarray (initially everything).

1. Find the smallest element (its index) in the unsorted part.
2. Swap it with the leftmost element of the unsorted part.
3. Move the sorted/unsorted boundary one position right.
4. Repeat until the unsorted part is empty.

# 2D Arrays

Source: `20260518__2-dimension_array.docx`

## 1. Pascal's triangle (10 rows)

Output 10 lines of Pascal's triangle using a 2D array:

```
1
1  1
1  2  1
1  3  3  1
1  4  6  4  1
1  5 10 10  5  1
...
```

## 2. Combined pattern

Using a 2D array and loops, output the following (Pascal's-triangle-like rows, right-aligned, next to a descending count sequence):

```
      1     2     3     4     5     6
      1     1     2     3     4     5
      1     2     1     2     3     4
      1     3     3     1     2     3
      1     4     6     4     1     2
      1     5    10    10     5     1
```

(Exact spacing is easier read from the original `.docx` if it matters — this is a transcription.)

## 3. (Optional) Saddle point

A saddle point is the value that is the max of its row **and** the min of its column. The worksheet guarantees at most one exists.

```
2  3  4  5
5  6  7  8
9 10 11 12
```

Here 5 is the saddle point.

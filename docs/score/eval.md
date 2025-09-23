# Expressions

In earlier versions of Csound the numbers presented in a score were used as given. There are occasions when some simple evaluation would be easier. This need is increased when there are macros. To assist in this area the syntax of arithmetic expressions within square brackets `[ ]` has been introduced. Expressions built from the operations `+`, `-`, `*`, `/`, `%` ("modulo"), and `^` ("power of") are allowed, together with grouping with `( )`. Unary minus and plus are also supported. The expressions can include numbers, and naturally macros whose values are numeric or arithmetic strings. All calculations are made in floating point numbers. The usual precedence rules are followed when evaluating: expressions within parantheses `( )` are evaluated first and `^` is evaluated before `*`, `/`, and `%` which are evaluated before `+` and `-`.

In addition to arithmetic operations, the following bitwise logical operators are also available: `&` (AND), `|` (OR), and `#` (XOR, exclusive-OR). These operators round their operands to the nearest (long) integer before evaluating. The logical operators have the same precedence as the `*`, `/`, and `%` arithmetic operators.

Finally, the tilde symbol `˜` can be used in an expression wherever a number is permissible to use. Each `˜` will evaluate to a random value between zero (0) and one (1).

## Examples

``` csound-sco
r3  CNT

i1  0  [0.3*$CNT.]
i1  +  [($CNT./3)+0.2]

e
```

As the three copies of the section have the macro `$CNT`. with the different values of 1, 2 and 3, this expands to

``` csound-sco
s
i1  0  0.3
i1  0.3  0.533333
s
i1  0  0.6
i1  0.6  0.866667
s
i1  0  0.9
i1  0.9  1.2
e
```

This is an extreme form, but the evaluation system can be used to ensure that repeated sections are subtly different.

Here are some simple examples of each operator:

``` csound-sco
i1  0   1   [ 110 + 220 ]      ; evaluates to 330
i1  +   .   [ 330 - 55 ]       ; 275
i1  +   .   [ 44 * 10 ]        ; 440
i1  +   .   [ 1100 / 2 ]       ; 550
i1  +   .   [ 5 ^ 4 ]          ; 625
i1  +   .   [ 5660 % 1000 ]    ; 660
i1  +   .   [ 110 & 220 ]      ; 76
i1  +   .   [ 110 | 220 ]      ; 254
i1  +   .   [ 110 # 220 ]      ; 178
i1  +   .   [~]                ; random between 0-1
i1  +   .   [~ * 4 + 1]        ; random between 1-5
i1  +   .   [~ * 95 + 5]       ; random between 5-100

i1  +   .   [ 8 / 2 * 3 ]      ; 12
i1  +   .   [ 4 + 3 - 2 + 1 ]  ; 6
i1  +   .   [ 4 + 3 * 2 + 1 ]  ; 11
i1  +   .   [(4 + 3)*(2 + 1)]  ; 21

i1  +   .   [ 2 * 2 & 3 ]      ; 4
i1  +   .   [ 3 & 2 * 2 ]      ; 0
i1  +   .   [ 4 | 3 * 3 ]      ; 13
```

## The `@` operator

New in Csound version 3.56 are `@x` (next power-of-two greater than or equal to x) and `@@x` (next power-of-two-plus-one greater than or equal to x).

```
[ @ 11 ] will evaluate to 16
[ @@ 11 ] to 17
```

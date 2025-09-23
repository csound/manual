<!--
id:GENfarey
category:
-->
# GENfarey
Fills a table with the Farey Sequence F<sub>n</sub> of the integer n.

Plugin gen in fareygen.

A Farey Sequence F<sub>n</sub> of order n is a list of fractions in their lowest terms between 0 and 1 and in ascending order. Their denominators do not exceed n.
This means a fraction a/b belongs to F<sub>n</sub> if 0 &#8804; a &#8804; b &#8804; n.
The numerator and denominator of each fraction are always coprime.
0 and 1 are included in F<sub>n</sub> as the fractions 0/1 and 1/1.
For example F<sub>5</sub> = {0/1, 1/5, 1/4, 1/3, 2/5, 1/2, 3/5, 2/3, 3/4, 4/5, 1/1}
Some properties of the Farey Sequence:

*  If a/b and c/d are two successive terms of F<sub>n</sub>, then bc - ad = 1.
*  If a/b, c/d, e/f are three successive terms of F<sub>n</sub>, then: c/d = (a+e) / (b+f). In this case c/d is called the mediant fraction between a/b and e/f.
*  If n > 1, then no two successive terms ofF<sub>n</sub> have the same denominator.

The length of any Farey Sequence F<sub>n</sub> is determined by
|F<sub>n</sub>| = 1 + SUM over n (phi(m))
where phi(m) is Euler's totient function, which gives the number of integers &#8804; m that are coprime to m.

Some values for the length of F<sub>n</sub> given n:

| n | F |
|---|---|
| 1 | 2 |
| 2 | 3 |
| 3 | 5 |
| 4 | 7 |
| 5 | 11 |
| 6 | 13 |
| 7 | 19 |
| 8 | 23 |
| 9 | 29 |
| 10 | 33 |
| 11 | 43 |
| 12 | 47 |
| 13 | 59 |
| 14 | 65 |
| 15 | 73 |
| 16 | 81 |
| 17 | 97 |
| 18 | 103 |
| 19 | 121 |
| 20 | 129 |

## Syntax
``` csound-orc
f # time size "farey" fareynum mode
```

### Initialization

_size_ -- number of points in the table. Must
be a power of 2 or power-of-2 plus 1 (see [f statement](../scoregens/f.md)).

_fareynum_ -- the integer n for generating Farey Sequence F<sub>n</sub>

_mode_ -- integer to trigger a specific
output to be written into the table:

1. outputs floating point numbers representing the elements of F<sub>n</sub>.
2.  outputs delta values of successive elements of F<sub>n</sub>, useful for generating note durations for example.
3.  outputs only the denominators of the integer ratios, useful for indexing other tables or instruments for example.
4.  same as mode 2 but with normalised output.
5.  same as mode 0 but with 1 added to each number, useful for generating tables for tuning opcodes, for example _cps2pch_.

## Examples

``` csound-orc
f1 0 -23 "farey" 8 0
```

Generates generates Farey Sequence F<sub>8</sub>. The table contains all
23 elements of F<sub>8</sub> as floating point numbers.

``` csound-orc
f1 0 -18 "farey" 7 1
```

This generates Farey Sequence F<sub>7</sub>. The table contains 18 delta values of F<sub>7</sub>,
i.e. the difference between r<sub>i+1</sub> - r<sub>i</sub>, where r is the ith element of F<sub>n</sub>.

``` csound-orc
f1 0 -43 "farey" 11 2
```

This generates Farey Sequence F<sub>11</sub>. The table contains the denominators of all
43 fractions in F<sub>11</sub>.

``` csound-orc
f1 0 -43 "farey" 11 3
```

This generates Farey Sequence F<sub>11</sub>. The table contains the denominators of all
43 fractions in F<sub>11</sub>, each of those divided by 11, i.e. normalised.

``` csound-orc
f1 0 -18 "farey" 7 4
```

This generates Farey Sequence F<sub>7</sub>. The table contains all fractions of F<sub>7</sub>,
same as mode 0, but this time '1' is added to each table element.

``` csound-orc title="A simple example of the GENfarey routine." linenums="1"
--8<-- "examples/genfarey.csd"
```

Here is a complete example of the GENfarey routine. It uses the files [genfarey-2.csd](../examples/genfarey-2.csd).

``` csound-orc title="Another example of the GENfarey routine." linenums="1"
--8<-- "examples/genfarey-2.csd"
```

These are the diagrams of the waveforms of the GENfarey routines, as used in the example:

<figure markdown="span">
![gidelta ftgen 100,0,-18,"farey",7,1 - delta values of Farey Sequence 7](../images/genfarey-2_1.png)
<figcaption>gidelta ftgen 100,0,-18,"farey",7,1 - delta values of Farey Sequence 7</figcaption>
</figure>

<figure markdown="span">
![gimult ftgen 101,0,-18,"farey",7,2 - generate the denominators of fractions of F_7 ](../images/genfarey-2_2.png)
<figcaption>gimult ftgen 101,0,-18,"farey",7,2 - generate the denominators of fractions of F_7 </figcaption>
</figure>

## See Also

[Models and Emulations](../siggen/models.md)

## Credits

Author: Georg Boenn<br>
University of Glamorgan<br>
2010<br>

New in Csound version 5.13


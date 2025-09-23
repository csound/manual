<!--
id:subtracts
category:Mathematical Operations:Arithmetic and Logic Operations
-->
# -
Subtraction operator.

Arithmetic operators perform operations of change-sign (negate), don't-change-sign, logical AND logical OR, add, subtract, multiply and divide. Note that a value or an expression may fall between two of these operators, either of which could take it as its left or right argument, as in

$$
a + b * c.
$$

In such cases three rules apply:

1. $*$ and $/$ bind to their neighbors more strongly than $+$ and $-$. Thus the above expression is taken as:<br>
$a + (b * c)$ with $*$ taking $b$ and $c$ and then $+$ taking $a$ and $b * c$.

2. $+$ and $-$ bind more strongly than &amp;&amp;, which in turn is stronger than &verbar;&verbar;:<br>
$a \;\&\&\; b - c \;||\; d$ is taken as $(a \;\&\&\; (b - c))\;||\; d$

3. When both operators bind equally strongly, the operations are done left to right:<br>
$a - b - c$ is taken as $(a - b) - c$

Parentheses may be used as above to force particular groupings.

## Syntax
``` csound-orc
-a  (no rate restriction)
a - b  (no rate restriction)
```

where the arguments $a$ and $b$ may be further expressions.

### Arguments

The arguments of $-$ can be scalar values or k-rate one dimensional arrays (vectors), or any combination.  If one of the arguments is an array, so is the value.

## Examples

Here is an example of the - operator. It uses the file [subtracts.csd](../examples/subtracts.csd).

``` csound-csd title="Example of the - operator." linenums="1"
--8<-- "examples/subtracts.csd"
```

Its output should include lines like these:

```
sutain time= note duration - attack - decay --> 3.0-0.1-0.2 = 2.7
sutain time= note duration - attack - decay --> 3.0-0.5-1.5 = 1.0
sutain time= note duration - attack - decay --> 5.0-4.0-0.5 = 0.5
```

## See also

[Arithmetic and Logic Operations](../math/artlogic.md)

## Credits

Arithmetic on vectors is new in version 6.00

<!--
id:opnot
category:Mathematical Operations:Arithmetic and Logic Operations
-->
# !
Logical NOT operator.

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
! a  (logical NOT; not audio-rate)
```

where the argument $a$ may be further expressions.

## Examples

Here is an example of the Logical NOT operator. It uses the file [opnot.csd](../examples/opnot.csd).

``` csound-csd title="Example of the opnot opcode." linenums="1"
--8<-- "examples/opnot.csd"
```

Its output should include lines like these:

```
i1     1.00000
i1     2.00000
i1     1.00000
i1     2.00000
i1     1.00000
i1     2.00000
i1     1.00000
.....
```

## See also

[Arithmetic and Logic Operations](../math/artlogic.md)

<!--
id:raises
category:Mathematical Operations:Arithmetic and Logic Operations
-->
# &circ;
&#8220;Power of&#8221; operator.

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

The operator _&circ;_ raises $a$ to the $b$ power. $b$ may not be audio-rate. Use with caution as precedence may not work correctly. See [pow](../opcodes/pow.md).  (New in Csound version 3.493.)

## Syntax
``` csound-orc
a ^ b  (b not audio-rate)
```

where the arguments $a$ and $b$ may be further expressions.

## Examples

Here is an example of the &circ; operator. It uses the file [raises.csd](../examples/raises.csd).

``` csound-csd title="Example of the &circ; operator." linenums="1"
--8<-- "examples/raises.csd"
```

Its output should include lines like these:

```
i1     0.50000
i1     0.50021
i1     0.50042
......
i1  1327.49320
i1  1327.74465
```

## See also

[Arithmetic and Logic Operations](../math/artlogic.md)

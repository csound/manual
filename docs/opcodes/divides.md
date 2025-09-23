<!--
id:divides
category:Mathematical Operations:Arithmetic and Logic Operations
-->
# &sol;
Division operator.

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
a / b  (no rate restriction)
```

where the arguments $a$ and $b$ may be further expressions.

### Arguments

The arguments of &sol; can be scalar values or k-rate one
dimensional arrays (vectors), or any combination.  If one of the
arguments is an array, so is the value.

## Examples

Here is an example of the &sol; operator. It uses the file [divides.csd](../examples/divides.csd).

``` csound-csd title="Example of the &sol; operator." linenums="1"
--8<-- "examples/divides.csd"
```

Its output should include lines like these:

```
retrigger rate per note duration = 3.333333
retrigger rate per note duration = 5.000000
retrigger rate per note duration = 0.666667
```

## See also

[Arithmetic and Logic Operations](../math/artlogic.md)

## Credits

Arithmetic on vectors is new in version 6.00

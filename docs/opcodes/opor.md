<!--
id:opor
category:Mathematical Operations:Arithmetic and Logic Operations
-->
# &verbar;&verbar;
Logical OR operator.

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
a || b  (logical OR; not audio-rate)
```

where the arguments $a$ and $b$ may be further expressions.

## Examples

Here is an example of the &verbar; operator. It uses the file [logicOR.csd](../examples/logicOR.csd).

``` csound-csd title="Example of the &verbar; operator." linenums="1"
--8<-- "examples/logicOR.csd"
```

Its output should include a line like these:

```
Value:127 ChanNo:11 CtrlNo:62
Value:127 ChanNo:11 CtrlNo:60
Value:127 ChanNo:11 CtrlNo:60
Value:127 ChanNo:11 CtrlNo:60
Value:127 ChanNo:11 CtrlNo:60
....
Value:0 ChanNo:11 CtrlNo:62
Value:0 ChanNo:11 CtrlNo:62
Value:0 ChanNo:11 CtrlNo:62
Value:0 ChanNo:11 CtrlNo:62
....
Value:77 ChanNo:11 CtrlNo:23
Value:77 ChanNo:11 CtrlNo:23
Value:76 ChanNo:11 CtrlNo:23
Value:76 ChanNo:11 CtrlNo:23
....
```

## See also

[Arithmetic and Logic Operations](../math/artlogic.md)

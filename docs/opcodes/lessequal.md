<!--
id:lessequal
category:Instrument Control:Conditional Values
-->
# &lt;=
Determines if one value is less than or equal to another.

## Syntax
``` csound-orc
(a <= b ? v1 : v2)
```

where _a_, _b_, _v1_ and _v2_ may be expressions, but _a_, _b_ not audio-rate.

### Performance

In the above conditional, _a_ and _b_ are first compared. If the indicated relation is true (_a_ less than or equal to _b_), then the conditional expression has the value of _v1_; if the relation is false, the expression has the value of _v2_.

NB.: If _v1_ or _v2_ are expressions, these will be evaluated before the conditional is determined.

In terms of binding strength, all conditional operators (i.e. the relational operators (_&lt;_, etc.), and _?_, and _:_ ) are weaker than the arithmetic and logical operators (_+_, _-_, _*_, _/_, _&amp;&amp;_ and _||_).

These are _operators_ not _opcodes_. Therefore, they can be used within orchestra statements, but do not form complete statements themselves.

## Examples

Here is an example of the &lt;= operator. It uses the file [lessequal.csd](../examples/lessequal.csd).

``` csound-csd title="Example of the &lt;= operator." linenums="1"
--8<-- "examples/lessequal.csd"
```

Its output should include lines like this:

```
random number = 1.035781, result = 3.000000
random number = 0.134037, result = 1.000000
random number = 0.130742, result = 1.000000
random number = 1.002550, result = 3.000000
random number = 0.370565, result = 1.000000
random number = 0.655759, result = 2.000000
random number = 0.676154, result = 2.000000
......
```

## See also

[Conditional Values](../control/conditional.md)

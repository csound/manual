<!--
id:cauchyi
category:Signal Generators:Random (Noise) Generators
-->
# cauchyi
Cauchy distribution random number generator with interpolation between values.

This is an x-class noise generator.

## Syntax
``` csound-orc
ares cauchyi klambda, xamp, xcps
ires cauchyi klambda, xamp, xcps
kres cauchyi klambda, xamp, xcps
```

### Performance

_kalpha_ -- controls the spread from zero (big _kalpha_ = big spread). Outputs both positive and negative numbers.

For more detailed explanation of these distributions, see:

1.  C. Dodge - T.A. Jerse 1985. Computer music. Schirmer books. pp.265 - 286
2.  D. Lorrain. A panoply of stochastic cannons. In C. Roads, ed. 1989. Music machine. Cambridge, Massachusetts: MIT press, pp. 351 - 379.

_xamp_ -- range over which random numbers are distributed.

_xcps_ -- the frequency which new random numbers are generated.

## Examples

Here is an example of the cauchyi opcode. It uses the file [cauchyi.csd](../../examples/cauchyi.csd).

``` csound-orc title="Example of the cauchyi opcode." linenums="1"
--8<-- "examples/cauchyi.csd"
```

## See also

[Random (Noise) Generators](../../siggen/random)

## Credits

Author: John ffitch<br>
Bath<br>
May 2011<br>
New in version 5.14<br>

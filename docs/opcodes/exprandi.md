<!--
id:exprandi
category:Signal Generators:Random (Noise) Generators
-->
# exprandi
Exponential distribution random number generator with interpolation (positive values only).

This is an x-class noise generator.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = exprandi(klambda, xamp, xcps)
    ires = exprandi(klambda, xamp, xcps)
    kres = exprandi(klambda, xamp, xcps)
    ```

=== "Classic"
    ``` csound-orc
    ares exprandi klambda, xamp, xcps
    ires exprandi klambda, xamp, xcps
    kres exprandi klambda, xamp, xcps
    ```

### Performance

_klambda_ -- lambda parameter for the exponential distribution.

The probablity density function of an exponential distribution is an exponential curve, whose mean is 0.69515/lambda. For more detailed explanation of these distributions, see:

1.  C. Dodge - T.A. Jerse 1985. Computer music. Schirmer books. pp.265 - 286
2.  D. Lorrain. A panoply of stochastic cannons. In C. Roads, ed. 1989. Music machine. Cambridge, Massachusetts: MIT press, pp. 351 - 379.

_xamp_ -- range over which random numbers are distributed.

_xcps_ -- the frequency which new random numbers are generated.

## Examples

Here is an example of the exprandi opcode. It uses the file [exprandi.csd](../examples/exprandi.csd).

``` csound-orc title="Example of the exprandi opcode." linenums="1"
--8<-- "examples/exprandi.csd"
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Author: John ffitch<br>
Bath<br>
May 2011<br>
New in version 5.14<br>

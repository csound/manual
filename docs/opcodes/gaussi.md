<!--
id:gaussi
category:Signal Generators:Random (Noise) Generators
-->
# gaussi
Gaussian distribution random number generator with controlled interpolation between values.

This is an x-class noise generator.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = gaussi(krange, xamp, xcps)
    ires = gaussi(krange, xamp, xcps)
    kres = gaussi(krange, xamp, xcps)
    ```

=== "Classic"
    ``` csound-orc
    ares gaussi krange, xamp, xcps
    ires gaussi krange, xamp, xcps
    kres gaussi krange, xamp, xcps
    ```

### Performance

_krange_ -- the range of the random numbers (-_krange_ to +_krange_). Outputs both positive and negative numbers.

_gauss_ returns random numbers following a normal distribution centered around 0.0 (mu = 0.0) with a variance (sigma) of _krange_ / 3.83. Thus more than 99.99% of the random values generated are in the range -_krange_ to +_krange_. If a mean value different of 0.0 is desired, this mean value has to be added to the generated numbers (see example below).

For more detailed explanation of these distributions, see:

1.  C. Dodge - T.A. Jerse 1985. Computer music. Schirmer books. pp.265 - 286
2.  D. Lorrain. A panoply of stochastic cannons. In C. Roads, ed. 1989. Music machine. Cambridge, Massachusetts: MIT press, pp. 351 - 379.

_xamp_ -- range over which random numbers are distributed.

_xcps_ -- the frequency which new random numbers are generated.

## Examples

Here is an example of the gaussi opcode. It uses the file [gaussi.csd](../examples/gaussi.csd).

``` csound-csd title="Example of the gaussi opcode." linenums="1"
--8<-- "examples/gaussi.csd"
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Author: John ffitch<br>
Bath<br>
May 2011<br>
New in version 5.14<br>

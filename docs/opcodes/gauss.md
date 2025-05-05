<!--
id:gauss
category:Signal Generators:Random (Noise) Generators
-->
# gauss
Gaussian distribution random number generator.

This is an x-class noise generator.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = gauss(krange)
    ires = gauss(irange)
    kres = gauss(krange)
    ares = gauss(kmean, ksdev)
    ires = gauss(imean, isdev)
    kres = gauss(kmean, ksdev)
    ```

=== "Classic"
    ``` csound-orc
    ares gauss krange
    ires gauss irange
    kres gauss krange
    ares gauss kmean, ksdev
    ires gauss imean, isdev
    kres gauss kmean, ksdev
    ```

### Performance

_krange_ -- the range of the random numbers (-_krange_ to +_krange_). Outputs both positive and negative numbers.

_kmean_ -- normal distribution mean.

_ksdev_ -- normal distribution standard deviation.

The first version of _gauss_ returns random numbers following a normal distribution centered around 0.0 (mu = 0.0) with a variance (sigma) of _krange_ / 3.83. Thus more than 99.99% of the random values generated are in the range -_krange_ to +_krange_. If a mean value different of 0.0 is desired, this mean value has to be added to the generated numbers (see example below).

The second version takes mean and standard deviation as parameters. They use the more mathematically sound Box-Muller algorithm to compute the normal distribution.

For more detailed explanation of these distributions, see:

1.  C. Dodge - T.A. Jerse 1985. Computer music. Schirmer books. pp.265 - 286
2.  D. Lorrain. A panoply of stochastic cannons. In C. Roads, ed. 1989. Music machine. Cambridge, Massachusetts: MIT press, pp. 351 - 379.

## Examples

Here is an example of the gauss opcode. It uses the file [gauss.csd](../examples/gauss.csd).

``` csound-orc title="Example of the gauss opcode." linenums="1"
--8<-- "examples/gauss.csd"
```

Its output should include lines like this:

```
mean = 0.000, std = 0.260, samples inside the given range: 99.993%
mean = 0.005, std = 0.999, samples inside the given range: 99.998%
mean = 2.700, std = 1.497, samples inside the given range: 100.000%
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Author (first version): Paris Smaragdis <br>
MIT, Cambridge<br>
1995<br>
Author (second version): Victor Lazzarini<br>
Maynooth University, Ireland<br>
2020<br>

Precisions about mu and sigma added by François Pinot after a discussion with Joachim Heintz on the Csound List, December 2010.

Example written by François Pinot, adapted from a csd file by Joachim Heintz, December 010.

Existed in 3.30

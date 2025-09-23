<!--
id:GEN42
category:
-->
# GEN42
Generates a random distribution function of discrete ranges of values by giving a list of groups of three numbers.

## Syntax
``` csound-orc
f # time size -42  min1 max1 prob1 min2 max2 prob2 min3 max3 prob3 ...  minN maxN probN
```

### Performance

The first number of each group is a the minimum value of the range, the second is the maximum value and the third is the probability of that an element belonging to that range of values can be chosen by a random algorithm. Probabilities for a range should be a fraction of 1, and the sum of the probabilities for all the ranges should total 1.0.

This subroutine is designed to be used together with duserrnd and [urd](../opcodes/urd.md) opcodes (see [duserrnd](../opcodes/duserrnd.md) for more information). Since both duserrnd and urd do not use any interpolation, it is suggested to give a size reasonably big.

## Examples

Here is an example of the GEN42 generator. It uses the file [gen42.csd](../examples/gen42.csd).

``` csound-csd title="Example of the GEN42 generator." linenums="1"
--8<-- "examples/gen42.csd"
```

Its output should include lines like these:

```
i1   184.61538
i1   130.76923
i1   169.23077
i1    12.00000
.......

WARNING: Seeding from current time 3751086165

i2   138.46154
i2    12.00000
i2   123.07692
i2   161.53846
i2   123.07692
i2   153.84615
......
```

This is the diagram of the waveform of the GEN42 routine, as used in the example:

<figure markdown="span">
![  f 1 0 -20 -42  10 20 .3 100 200 .7](../images/gen42.png)
<figcaption>  f 1 0 -20 -42  10 20 .3 100 200 .7</figcaption>
</figure>

## Credits

Author: Gabriel Maldonado

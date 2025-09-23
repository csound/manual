<!--
id:trirand
category:Signal Generators:Random (Noise) Generators
-->
# trirand
Triangular distribution random number generator.

This is an x-class noise generator.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = trirand(krange)
    ires = trirand(krange)
    kres = trirand(krange)
    ```

=== "Classic"
    ``` csound-orc
    ares trirand krange
    ires trirand krange
    kres trirand krange
    ```

### Performance

_krange_ -- the range of the random numbers (-_krange_ to +_krange_).

For more detailed explanation of these distributions, see:

1.  C. Dodge - T.A. Jerse 1985. Computer music. Schirmer books. pp.265 - 286
2.  D. Lorrain. A panoply of stochastic cannons. In C. Roads, ed. 1989. Music machine. Cambridge, Massachusetts: MIT press, pp. 351 - 379.

## Examples

Here is an example of the trirand opcode. It uses the file [trirand.csd](../examples/trirand.csd).

``` csound-orc title="Example of the trirand opcode." linenums="1"
--8<-- "examples/trirand.csd"
```

Its output should include a line like this:

```
i   1 time     0.00067:    -4.97993
i   1 time     0.20067:     1.20909
i   1 time     0.40067:    17.45873
i   1 time     0.60067:    52.55409
i   1 time     0.80067:    -1.92888
i   1 time     1.00000:   -11.01149
i   1 time     1.20067:     9.79521
i   1 time     1.40067:    26.98504
i   1 time     1.60067:    24.67405
i   1 time     1.80000:   -67.59846
i   1 time     2.00000:    64.24861
WARNING: Seeding from current time 521999639
i   2 time     3.00067:     3.28969
i   2 time     3.20067:    54.98986
i   2 time     3.40067:   -33.84788
i   2 time     3.60000:   -41.93523
i   2 time     3.80067:    -6.61742
i   2 time     4.00000:    39.67097
i   2 time     4.20000:     2.95123
i   2 time     4.40067:    45.59255
i   2 time     4.60067:    16.57259
i   2 time     4.80067:   -18.80273
i   2 time     5.00000:    -2.01697
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Author: Paris Smaragdis<br>
MIT, Cambridge<br>
1995<br>

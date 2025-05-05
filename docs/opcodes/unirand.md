<!--
id:unirand
category:Signal Generators:Random (Noise) Generators
-->
# unirand
Uniform distribution random number generator (positive values only).

This is an x-class noise generator.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = unirand(krange)
    ires = unirand(krange)
    kres = unirand(krange)
    ```

=== "Classic"
    ``` csound-orc
    ares unirand krange
    ires unirand krange
    kres unirand krange
    ```

### Performance

_krange_ -- the range of the random numbers (0 - _krange_).

For more detailed explanation of these distributions, see:

1.  C. Dodge - T.A. Jerse 1985. Computer music. Schirmer books. pp.265 - 286
2.  D. Lorrain. A panoply of stochastic cannons. In C. Roads, ed. 1989. Music machine. Cambridge, Massachusetts: MIT press, pp. 351 - 379.

## Examples

Here is an example of the unirand opcode. It uses the file [unirand.csd](../examples/unirand.csd).

``` csound-orc title="Example of the unirand opcode." linenums="1"
--8<-- "examples/unirand.csd"
```

Its output should include lines like these:

```
i   1 time     0.00067:    81.47237
i   1 time     0.20067:    41.72671
i   1 time     0.40067:     5.96189
i   1 time     0.60067:    91.59912
i   1 time     0.80067:    85.07127
i   1 time     1.00000:    92.50948
i   1 time     1.20067:    98.79347
i   1 time     1.40067:    98.91449
i   1 time     1.60067:    50.37808
i   1 time     1.80000:    72.02497
i   1 time     2.00000:    52.94362

WARNING: Seeding from current time 4007444022

i   2 time     3.00067:    91.86294
i   2 time     3.20067:    94.68759
i   2 time     3.40067:     1.05825
i   2 time     3.60000:    78.57628
i   2 time     3.80067:    27.67408
i   2 time     4.00000:    76.46347
i   2 time     4.20000:    77.10071
i   2 time     4.40067:    34.28921
i   2 time     4.60067:    37.72286
i   2 time     4.80067:    54.96646
i   2 time     5.00000:    11.67566
B  3.000 ..  5.000 T  5.000 TT  5.000 M:  0.80000  0.80000
Score finished in csoundPerform().
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Author: Paris Smaragdis<br>
MIT, Cambridge<br>
1995<br>

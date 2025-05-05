<!--
id:linrand
category:Signal Generators:Random (Noise) Generators
-->
# linrand
Linear distribution random number generator (positive values only).

This is an x-class noise generator.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = linrand(krange)
    ires = linrand(krange)
    kres = linrand(krange)
    ```

=== "Classic"
    ``` csound-orc
    ares linrand krange
    ires linrand krange
    kres linrand krange
    ```

### Performance

_krange_ -- the range of the random numbers (0 - _krange_). Outputs only positive numbers.

For more detailed explanation of these distributions, see:

1.  C. Dodge - T.A. Jerse 1985. Computer music. Schirmer books. pp.265 - 286
2.  D. Lorrain. A panoply of stochastic cannons. In C. Roads, ed. 1989. Music machine. Cambridge, Massachusetts: MIT press, pp. 351 - 379.

## Examples

Here is an example of the linrand opcode. It uses the file [linrand.csd](../examples/linrand.csd).

``` csound-orc title="Example of the linrand opcode." linenums="1"
--8<-- "examples/linrand.csd"
```

Its output should include a line like this:

```
i   1 time     0.00033:    13.54770
i   1 time     0.20033:    32.38746
i   1 time     0.40033:    47.69304
i   1 time     0.60033:    19.82218
i   1 time     0.80033:    42.98293
i   1 time     1.00000:    81.13174
i   1 time     1.20033:    47.39585
i   1 time     1.40033:    12.53248
i   1 time     1.60033:    35.70722
i   1 time     1.80000:    65.25774
i   1 time     2.00000:    23.24811
Seeding from current time 392575384
i   2 time     3.00033:    23.05609
i   2 time     3.20033:    76.15114
i   2 time     3.40033:    22.78861
i   2 time     3.60000:     0.79064
i   2 time     3.80033:    43.49438
i   2 time     4.00000:    34.10963
i   2 time     4.20000:    31.88702
i   2 time     4.40033:    59.78054
i   2 time     4.60033:     4.96821
i   2 time     4.80033:    24.69674
i   2 time     5.00000:    21.88815
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Author: Paris Smaragdis<br>
MIT, Cambridge<br>
1995<br>

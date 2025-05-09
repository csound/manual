<!--
id:betarand
category:Signal Generators:Random (Noise) Generators
-->
# betarand
Beta distribution random number generator (positive values only).

This is an x-class noise generator.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = betarand(krange, kalpha, kbeta)
    ires = betarand(krange, kalpha, kbeta)
    kres = betarand(krange, kalpha, kbeta)
    ```

=== "Classic"
    ``` csound-orc
    ares betarand krange, kalpha, kbeta
    ires betarand krange, kalpha, kbeta
    kres betarand krange, kalpha, kbeta
    ```

### Performance

_krange_ -- range of the random numbers (0 - _krange_).

_kalpha_ -- alpha value. If _kalpha_ is smaller than one, smaller values favor values near 0.

_kbeta_ -- beta value. If _kbeta_ is smaller than one, smaller values favor values near _krange_.

If both _kalpha_ and _kbeta_ equal one we have uniform distribution. If both _kalpha_ and _kbeta_ are greater than one we have a sort of Gaussian distribution. Outputs only positive numbers.

For more detailed explanation of these distributions, see:

1.  C. Dodge - T.A. Jerse 1985. Computer music. Schirmer books. pp.265 - 286
2.  D. Lorrain. A panoply of stochastic cannons. In C. Roads, ed. 1989. Music machine. Cambridge, Massachusetts: MIT press, pp. 351 - 379.

## Examples

=== "Modern"
    Here is an example of the betarand opcode. It uses the file [betarand-modern.csd](../examples/betarand-modern.csd).
    ``` csound-orc title="Example of the betarand opcode." linenums="1"
    --8<-- "examples/betarand-modern.csd"
    ```

=== "Classic"
    Here is an example of the betarand opcode. It uses the file [betarand.csd](../examples/betarand.csd).
    ``` csound-orc title="Example of the betarand opcode." linenums="1"
    --8<-- "examples/betarand.csd"
    ```

Its output should include a line like:

```
i   1 time     0.00267:    85.74227
i   1 time     0.20267:    12.07606
i   1 time     0.40267:    25.03239
i   1 time     0.60267:     0.42037
i   1 time     0.80267:    76.69589
i   1 time     1.00000:    29.73339
i   1 time     1.20267:    48.29811
i   1 time     1.40267:    75.46507
i   1 time     1.60267:    74.80686
i   1 time     1.80000:    81.37473
i   1 time     2.00000:    55.48827
Seeding from current time 3472120656
i   2 time     3.00267:    57.21408
i   2 time     3.20267:    30.95705
i   2 time     3.40267:    19.71687
i   2 time     3.60000:    64.48965
i   2 time     3.80267:    72.35818
i   2 time     4.00000:    49.65395
i   2 time     4.20000:    55.25888
i   2 time     4.40267:     3.98308
i   2 time     4.60267:    52.98075
i   2 time     4.80267:    58.07925
i   2 time     5.00000:    56.38914
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Author: Paris Smaragdis<br>
MIT, Cambridge<br>
1995<br>

Existed in 3.30

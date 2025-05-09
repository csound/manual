<!--
id:bexprnd
category:Signal Generators:Random (Noise) Generators
-->
# bexprnd
Exponential distribution random number generator.

This is an x-class noise generator.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = bexprnd(krange)
    ires = bexprnd(krange)
    kres = bexprnd(krange)
    ```

=== "Classic"
    ``` csound-orc
    ares bexprnd krange
    ires bexprnd krange
    kres bexprnd krange
    ```

### Performance

_krange_ -- the range of the random numbers (-_krange_ to +_krange_)

For more detailed explanation of these distributions, see:

1.  C. Dodge - T.A. Jerse 1985. Computer music. Schirmer books. pp.265 - 286
2.  D. Lorrain. A panoply of stochastic cannons. In C. Roads, ed. 1989. Music machine. Cambridge, Massachusetts: MIT press, pp. 351 - 379.

## Examples

=== "Modern"
    Here is an example of the bexprnd opcode. It uses the file [bexprnd-modern.csd](../examples/bexprnd-modern.csd).
    ``` csound-orc title="Example of the bexprnd opcode." linenums="1"
    --8<-- "examples/bexprnd-modern.csd"
    ```

=== "Classic"
    Here is an example of the bexprnd opcode. It uses the file [bexprnd.csd](../examples/bexprnd.csd).
    ``` csound-orc title="Example of the bexprnd opcode." linenums="1"
    --8<-- "examples/bexprnd.csd"
    ```

Its output should include a line like:

```
i   1 time     0.00267:    99.27598
i   1 time     0.20267:    74.97176
i   1 time     0.40267:   -35.67213
i   1 time     0.60267:     1.10579
i   1 time     0.80267:   -18.08816
i   1 time     1.00000:    28.93329
i   1 time     1.20267:   320.63733
i   1 time     1.40267:  -332.05614
i   1 time     1.60267:  -212.66361
i   1 time     1.80000:   -92.57433
i   1 time     2.00000:   140.70939
Seeding from current time 4055201702
i   2 time     3.00267:   190.30495
i   2 time     3.20267:   -58.30677
i   2 time     3.40267:   192.39784
i   2 time     3.60000:    12.72448
i   2 time     3.80267:    79.91503
i   2 time     4.00000:    34.44258
i   2 time     4.20000:   167.92680
i   2 time     4.40267:  -117.10278
i   2 time     4.60267:   -70.99155
i   2 time     4.80267:   -23.24037
i   2 time     5.00000:  -226.35500
```-modern

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Author: Paris Smaragdis<br>
MIT, Cambridge<br>
1995<br>

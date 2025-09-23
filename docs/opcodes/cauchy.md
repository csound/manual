<!--
id:cauchy
category:Signal Generators:Random (Noise) Generators
-->
# cauchy
Cauchy distribution random number generator.

This is an x-class noise generator.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = cauchy(kalpha)
    ires = cauchy(kalpha)
    kres = cauchy(kalpha)
    ```

=== "Classic"
    ``` csound-orc
    ares cauchy kalpha
    ires cauchy kalpha
    kres cauchy kalpha
    ```

### Performance

_kalpha_ -- controls the spread from zero (big _kalpha_ = big spread). Outputs both positive and negative numbers.

For more detailed explanation of these distributions, see:

1.  C. Dodge - T.A. Jerse 1985. Computer music. Schirmer books. pp.265 - 286
2.  D. Lorrain. A panoply of stochastic cannons. In C. Roads, ed. 1989. Music machine. Cambridge, Massachusetts: MIT press, pp. 351 - 379.

## Examples

=== "Modern"
    Here is an example of the cauchy opcode. It uses the file [cauchy-modern.csd](../examples/cauchy-modern.csd).
    ``` csound-orc title="Example of the cauchy opcode." linenums="1"
    --8<-- "examples/cauchy-modern.csd"
    ```

=== "Classic"
    Here is an example of the cauchy opcode. It uses the file [cauchy.csd](../examples/cauchy.csd).
    ``` csound-orc title="Example of the cauchy opcode." linenums="1"
    --8<-- "examples/cauchy.csd"
    ```

Its output should include lines like:

```
i   1 time     0.00267:    -0.20676
i   1 time     0.20267:    -0.28814
i   1 time     0.40267:     0.61651
i   1 time     0.60267:   -18.18552
i   1 time     0.80267:     1.18140
i   1 time     1.00000:    -0.75432
i   1 time     1.20267:    -0.02002
i   1 time     1.40267:     0.01785
i   1 time     1.60267:    -0.48834
i   1 time     1.80000:     9.69401
i   1 time     2.00000:    -0.41257
Seeding from current time 3112109827
i   2 time     3.00267:    -0.46887
i   2 time     3.20267:     0.06189
i   2 time     3.40267:    -0.40303
i   2 time     3.60000:     0.89312
i   2 time     3.80267:    -0.40374
i   2 time     4.00000:     0.86557
i   2 time     4.20000:     0.09192
i   2 time     4.40267:    -0.16748
i   2 time     4.60267:     0.30133
i   2 time     4.80267:     0.31657
i   2 time     5.00000:     0.44681
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Author: Paris Smaragdis<br>
MIT, Cambridge<br>
1995<br>

Existed in 3.30

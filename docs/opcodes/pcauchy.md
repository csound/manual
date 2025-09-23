<!--
id:pcauchy
category:Signal Generators:Random (Noise) Generators
-->
# pcauchy
Cauchy distribution random number generator (positive values only).

This is an x-class noise generator.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = pcauchy(kalpha)
    ires = pcauchy(kalpha)
    kres = pcauchy(kalpha)
    ```

=== "Classic"
    ``` csound-orc
    ares pcauchy kalpha
    ires pcauchy kalpha
    kres pcauchy kalpha
    ```

### Performance

_pcauchy_ _kalpha_ -- controls the spread from zero (big kalpha = big spread). Outputs positive numbers only.

For more detailed explanation of these distributions, see:

1.  C. Dodge - T.A. Jerse 1985. Computer music. Schirmer books. pp.265 - 286
2.  D. Lorrain. A panoply of stochastic cannons. In C. Roads, ed. 1989. Music machine. Cambridge, Massachusetts: MIT press, pp. 351 - 379.

## Examples

Here is an example of the pcauchy opcode. It uses the file [pcauchy.csd](../examples/pcauchy.csd).

``` csound-orc title="Example of the pcauchy opcode." linenums="1"
--8<-- "examples/pcauchy.csd"
```

Its output should include a line like this:

```
i   1 time     0.00033:    10.48851
i   1 time     0.20033:     0.29508
i   1 time     0.40033:     1.75214
i   1 time     0.60033:    22.88281
i   1 time     0.80033:    16.06435
i   1 time     1.00000:     0.43110
i   1 time     1.20033:    16.51694
i   1 time     1.40033:     2.98797
i   1 time     1.60033:     1.32767
i   1 time     1.80000:    17.94039
i   1 time     2.00000:     4.85994
Seeding from current time 1526147515
i   2 time     3.00033:     0.89797
i   2 time     3.20033:     9.19447
i   2 time     3.40033:     0.73053
i   2 time     3.60000:     7.43371
i   2 time     3.80033:     5.87640
i   2 time     4.00000:     0.80456
i   2 time     4.20000:     4.50637
i   2 time     4.40033:     2.08145
i   2 time     4.60033:    13.47125
i   2 time     4.80033:     3.16399
i   2 time     5.00000:    11.05428
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Author: Paris Smaragdis<br>
MIT, Cambridge<br>
1995<br>

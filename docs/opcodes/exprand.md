<!--
id:exprand
category:Signal Generators:Random (Noise) Generators
-->
# exprand
Exponential distribution random number generator (positive values only).

This is an x-class noise generator.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = exprand(klambda)
    ires = exprand(klambda)
    kres = exprand(klambda)
    ```

=== "Classic"
    ``` csound-orc
    ares exprand klambda
    ires exprand klambda
    kres exprand klambda
    ```

### Performance

_klambda_ -- reciprocal of lambda parameter for the exponential distribution.

The probablity density function of an exponential distribution is an exponential curve, whose median is log(2)/lambda. For more detailed explanation of these distributions, see:

1.  C. Dodge - T.A. Jerse 1985. Computer music. Schirmer books. Second edition, section 11.1B4
2.  D. Lorrain. A panoply of stochastic cannons. In C. Roads, ed. 1989. Music machine . Cambridge, Massachusetts: MIT press, pp. 351 - 379.

## Examples

Here is an example of the exprand opcode. It uses the file [exprand.csd](../examples/exprand.csd).

``` csound-orc title="Example of the exprand opcode." linenums="1"
--8<-- "examples/exprand.csd"
```

Its output should include lines like this:

```
i   1 time     0.00033:     4.09813
i   1 time     0.20033:    56.39567
i   1 time     0.40033:     3.23362
i   1 time     0.60033:     0.24277
i   1 time     0.80033:    13.71228
i   1 time     1.00000:    12.71885
i   1 time     1.20033:    32.36737
i   1 time     1.40033:     0.29747
i   1 time     1.60033:     4.04450
i   1 time     1.80000:    35.75676
i   1 time     2.00000:     3.69845

Seeding from current time 3034472128

i   2 time     3.00033:     6.67934
i   2 time     3.20033:     2.72431
i   2 time     3.40033:    14.51822
i   2 time     3.60000:    12.10120
i   2 time     3.80033:     1.12266
i   2 time     4.00000:    26.90772
i   2 time     4.20000:     0.43554
i   2 time     4.40033:    28.59836
i   2 time     4.60033:    27.01831
i   2 time     4.80033:    18.19911
i   2 time     5.00000:     4.45125
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Author: Paris Smaragdis<br>
MIT, Cambridge<br>
1995<br>

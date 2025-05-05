<!--
id:weibull
category:Signal Generators:Random (Noise) Generators
-->
# weibull
Weibull distribution random number generator (positive values only).

This is an x-class noise generator

## Syntax
=== "Modern"
    ``` csound-orc
    ares = weibull(ksigma, ktau)
    ires = weibull(ksigma, ktau)
    kres = weibull(ksigma, ktau)
    ```

=== "Classic"
    ``` csound-orc
    ares weibull ksigma, ktau
    ires weibull ksigma, ktau
    kres weibull ksigma, ktau
    ```

### Performance

_ksigma_ -- scales the spread of the distribution.

_ktau_ -- if greater than one, numbers near _ksigma_ are favored. If smaller than one, small values are favored. If t equals 1, the distribution is exponential. Outputs only positive numbers.

For more detailed explanation of these distributions, see:

1.  C. Dodge - T.A. Jerse 1985. Computer music. Schirmer books. pp.265 - 286
2.  D. Lorrain. A panoply of stochastic cannons. In C. Roads, ed. 1989. Music machine. Cambridge, Massachusetts: MIT press, pp. 351 - 379.

## Examples

Here is an example of the weibull opcode. It uses the file [weibull.csd](../examples/weibull.csd).

``` csound-orc title="Example of the weibull opcode." linenums="1"
--8<-- "examples/weibull.csd"
```

Its output should include a line like these:

```
i   1 time     0.00073:   168.59070
i   1 time     0.20027:    98.72078
i   1 time     0.40054:    48.57351
i   1 time     0.60009:   171.46941
i   1 time     0.80036:    50.20434
i   1 time     1.00063:    50.84775
i   1 time     1.20018:    18.16301
i   1 time     1.40045:    44.41001
i   1 time     1.60000:     0.98506
i   1 time     1.80027:    36.19192

WARNING: Seeding from current time 2444541554

i   2 time     3.00045:    20.81653
i   2 time     3.20000:   116.17060
i   2 time     3.40027:     9.23891
i   2 time     3.59982:    95.67111
i   2 time     3.80009:   296.52851
i   2 time     4.00036:    39.28636
i   2 time     4.19991:    13.54326
i   2 time     4.40018:    54.92388
i   2 time     4.59973:   268.05584
i   2 time     4.80000:    95.27069
i   2 time     5.00027:    91.62076

WARNING: Seeding from current time 2447542341

i   3 time     6.00091:    94.40902
i   3 time     6.20045:   111.10193
i   3 time     6.40073:    99.38797
i   3 time     6.60027:    98.54267
i   3 time     6.80054:   106.53899
i   3 time     7.00082:   106.30752
i   3 time     7.20036:    88.75486
i   3 time     7.40063:   106.45703
i   3 time     7.60091:    84.59854
i   3 time     7.80045:   106.76515
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Author: Paris Smaragdis<br>
MIT, Cambridge<br>
1995<br>

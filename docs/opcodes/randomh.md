<!--
id:randomh
category:Signal Generators:Random (Noise) Generators
-->
# randomh
Generates random numbers with a user-defined limit and holds them for a period of time.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = randomh(kmin, kmax, xcps [,imode] [,ifirstval])
    kres = randomh(kmin, kmax, kcps [,imode] [,ifirstval])
    ```

=== "Classic"
    ``` csound-orc
    ares randomh kmin, kmax, xcps [,imode] [,ifirstval]
    kres randomh kmin, kmax, kcps [,imode] [,ifirstval]
    ```

### Initialization

_imode_ (optional, default=0) -- generation mode of the first output value (see below)

_ifirstval_ (optional, default=0) -- first output value

### Performance

_kmin_ -- minimum range limit

_kmax_ -- maximum range limit

_kcps, xcps_ -- rate of random break-point generation

The _randomh_ opcode is similar to [randh](../opcodes/randh.md) but allows the user to set arbitrary minimum and maximum values.

When _imode_ = 0 (the default), the _kmin_ argument value is outputted during _1/kcps_ (resp. _1/xcps_) seconds at the beginning of the note. Then, the normal process takes place with a new random number generated and held every _1/kcps_ (resp. _1/xcps_) seconds.

When _imode_ = 2, the _ifirstval_ argument value is outputted during _1/kcps_ (resp. _1/xcps_) seconds at the beginning of the note. Then, the normal process takes place with a new random number generated and held every _1/kcps_ (resp. _1/xcps_) seconds.

When _imode_ = 3, the generation process begins with a random value from the initialization time.

## Examples

Here is an example of the randomh opcode. It uses the file [randomh.csd](../examples/randomh.csd).

``` csound-orc title="Example of the randomh opcode." linenums="1"
--8<-- "examples/randomh.csd"
```

Its output should include lines like this:

```
Mode: 0
i1   220.00000
i1   396.26079
i1   240.75446
i1   364.24577
...

Mode: 2
i1   330.00000
i1   416.50935
i1   356.11619
i1   433.59324
...

Mode: 3
i1   261.17741
i1   402.00891
i1   393.86592
i1   307.19839
...
```

Two musical examples featuring the randomh opcode:
[FtmorfRandomh_Cucchi.csd](../examples/musical/FtmorfRandomh_Cucchi.csd) and [Ftmorf_Cucchi.csd](../examples/musical/Ftmorf_Cucchi.csd), both by Stefano Cucchi.

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Author: Gabriel Maldonado

Arguments _imode_ and _ifirstval_
added by François Pinot, Jan. 2011, after a discussion with Peiman Khosravi on
the csnd list.

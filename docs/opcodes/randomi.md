<!--
id:randomi
category:Signal Generators:Random (Noise) Generators
-->
# randomi
Generates a user-controlled random number series with interpolation between each new number.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = randomi(kmin, kmax, xcps [,imode] [,ifirstval])
    kres = randomi(kmin, kmax, kcps [,imode] [,ifirstval])
    ```

=== "Classic"
    ``` csound-orc
    ares randomi kmin, kmax, xcps [,imode] [,ifirstval]
    kres randomi kmin, kmax, kcps [,imode] [,ifirstval]
    ```

### Initialization

_imode_ (optional, default=0) -- first interpolation cycle mode (see below)

_ifirstval_ (optional, default=0) -- first output value

### Performance

_kmin_ -- minimum range limit

_kmax_ -- maximum range limit

_kcps, xcps_ -- rate of random break-point generation

The _randomi_ opcode is similar to [randi](../opcodes/randi.md) but allows the user to set arbitrary minimum and maximum values.

When _imode_ = 0 (the default), the _kmin_ argument value is outputted during _1/kcps_ (resp. _1/xcps_) seconds at the beginning of the note, before the first random number is generated. Then the normal interpolation process takes place, first between _kmin_ and the first random number generated, and then between successive generated random numbers, each interpolation cycle having a duration of _1/kcps_ (resp. _1/xcps_) seconds.

When _imode_ = 1, a random number is generated at initialization and interpolation begins immediately between the _kmin_ argument value and that random number.

When _imode_ = 2, a random number is generated at initialization and interpolation begins immediately between the _ifirstval_ argument value and that random number.

When _imode_ = 3, two random numbers are generated at initialization as breakpoints for the first interpolation cycle.

## Examples

Here is an example of the randomi opcode. It uses the file [randomi.csd](../examples/randomi.csd).

``` csound-orc title="Example of the randomi opcode." linenums="1"
--8<-- "examples/randomi.csd"
```

Its output should include lines like this:

```
Mode: 0
k1 = 220.000000
k1 = 220.000000
k1 = 220.146093
k1 = 246.827703
k1 = 395.595775
...

Mode: 1
k1 = 220.000000
k1 = 224.325329
k1 = 274.370074
k1 = 343.216049
k1 = 414.324347
...

Mode: 2
k1 = 330.000000
k1 = 292.628171
k1 = 334.519777
k1 = 290.610602
k1 = 394.905366
...

Mode: 3
k1 = 360.727674
k1 = 431.680412
k1 = 380.625254
k1 = 289.267139
k1 = 303.038109
...
```

## See also

[Random (Noise) Generators](../siggen/random.md)

## Credits

Author: Gabriel Maldonado

Arguments _imode_ and _ifirstval_ added by François Pinot, Jan. 2011, after a discussion with Peiman Khosravi on the csnd list.

Example written by Kevin Conder, adapted for new args by François Pinot.

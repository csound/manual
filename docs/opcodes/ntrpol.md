<!--
id:ntrpol
category:Signal Modifiers:Sample Level Operators
-->
# ntrpol
Calculates the weighted mean value (i.e. linear interpolation) of two input signals.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = ntrpol(asig1, asig2, kpoint [, imin] [, imax])
    ires = ntrpol(isig1, isig2, ipoint [, imin] [, imax])
    kres = ntrpol(ksig1, ksig2, kpoint [, imin] [, imax])
    ```

=== "Classic"
    ``` csound-orc
    ares ntrpol asig1, asig2, kpoint [, imin] [, imax]
    ires ntrpol isig1, isig2, ipoint [, imin] [, imax]
    kres ntrpol ksig1, ksig2, kpoint [, imin] [, imax]
    ```

### Initialization

_imin_ -- minimum xpoint value (optional, default 0)

_imax_ -- maximum xpoint value (optional, default 1)

### Performance

_xsig1_, _xsig2_ -- input signals

_xpoint_ -- interpolation point between the two values

_ntrpol_ opcode outputs the linear interpolation between two input values. _xpoint_ is the distance of evaluation point from the first value. With the default values of _imin_ and _imax_, (0 and 1) a zero value indicates no distance from the first value and the maximum distance from the second one. With a 0.5 value, _ntrpol_ will output the mean value of the two inputs, indicating the exact half point between _xsig1_ and _xsig2_. A 1 value indicates the maximum distance from the first value and no distance from the second one. The range of _xpoint_ can be also defined with _imin_ and _imax_ to make its management easier.

These opcodes are useful for crossfading two signals.

## Examples

Here is an example of the ntrpol opcode. It uses the file [ntrpol.csd](../examples/ntrpol.csd).

``` csound-csd title="Example of the ntrpol opcode." linenums="1"
--8<-- "examples/ntrpol.csd"
```

## See also

[Sample Level Operators](../sigmod/sample.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
October 1998<br>

New in Csound version 3.49

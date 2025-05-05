<!--
id:oscils
category:Signal Generators:Basic Oscillators
-->
# oscils
A simple, fast sine oscillator.

It uses only one multiply, and two add operations to generate one sample of output, and does not require a function table.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = oscils(iamp, icps, iphs [, iflg])
    ```

=== "Classic"
    ``` csound-orc
    ares oscils iamp, icps, iphs [, iflg]
    ```

### Initialization

_iamp_ -- output amplitude.

_icps_ -- frequency in Hz (may be zero or negative, however the absolute value must be less than _sr_/2).

_iphs_ -- start phase between 0 and 1.

_iflg_ -- sum of the following values:

*   _2_: use double precision even if Csound was compiled to use floats.  This improves quality (especially in the case of long performance time), but may be up to twice as slow.
*   _1_: skip initialization.

### Performance

_ares_ -- audio output

## Examples

Here is an example of the oscils opcode. It uses the file [oscils.csd](../examples/oscils.csd).

``` csound-orc title="Example of the oscils opcode." linenums="1"
--8<-- "examples/oscils.csd"
```

## See also

[Basic Oscillators](../siggen/basic.md)

## Credits

Author: Istvan Varga<br>
January 2002<br>

New in version 4.18

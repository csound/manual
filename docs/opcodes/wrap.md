<!--
id:wrap
category:Signal Modifiers:Signal Limiters
-->
# wrap
Wraps-around the signal that exceeds the low and high thresholds.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = wrap(asig, klow, khigh)
    ires = wrap(isig, ilow, ihigh)
    kres = wrap(ksig, klow, khigh)
    ```

=== "Classic"
    ``` csound-orc
    ares wrap asig, klow, khigh
    ires wrap isig, ilow, ihigh
    kres wrap ksig, klow, khigh
    ```

### Initialization

_isig_ -- input signal

_ilow_ -- low threshold

_ihigh_ -- high threshold

### Performance

_xsig_ -- input signal

_klow_ -- low threshold

_khigh_ -- high threshold

_wrap_ wraps-around the signal that exceeds the low and high thresholds.

This opcode is useful in several situations, such as table indexing or for clipping and modeling a-rate, i-rate or k-rate signals. _wrap_ is also useful for wrap-around of table data when the maximum index is not a power of two (see [table](../opcodes/table.md) and [tablei](../opcodes/tablei.md)). Another use of _wrap_ is in cyclical event repeating, with arbitrary cycle length.

## Examples

Here is an example of the wrap opcode. It uses the file [wrap.csd](../examples/wrap.csd).

``` csound-csd title="Example of the wrap opcode." linenums="1"
--8<-- "examples/wrap.csd"
```

## See also

[Signal Limiters](../sigmod/siglimit.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>

New in Csound version 3.49

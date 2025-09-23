<!--
id:mirror
category:Signal Modifiers:Signal Limiters
-->
# mirror
Reflects the signal that exceeds the low and high thresholds.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = mirror(asig, klow, khigh)
    ires = mirror(isig, ilow, ihigh)
    kres = mirror(ksig, klow, khigh)
    ```

=== "Classic"
    ``` csound-orc
    ares mirror asig, klow, khigh
    ires mirror isig, ilow, ihigh
    kres mirror ksig, klow, khigh
    ```

### Initialization

_isig_ -- input signal

_ilow_ -- low threshold

_ihigh_ -- high threshold

### Performance

_xsig_ -- input signal

_klow_ -- low threshold

_khigh_ -- high threshold

_mirror_ &#8220;reflects&#8221; the signal that exceeds the low and high thresholds.

This opcode is useful in several situations, such as table indexing or for clipping and modeling a-rate, i-rate or k-rate signals.

## Examples

Here is an example of the mirror opcode. It uses the file [mirror.csd](../examples/mirror.csd).

``` csound-csd title="Example of the mirror opcode." linenums="1"
--8<-- "examples/mirror.csd"
```

## See also

[Signal Limiters](../sigmod/siglimit.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>

New in Csound version 3.49

<!--
id:limit
category:Signal Modifiers:Signal Limiters
-->
# limit
Sets the lower and upper limits of the value it processes.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = limit(asig, klow, khigh)
    ires = limit(isig, ilow, ihigh)
    kres = limit(ksig, klow, khigh)
    ires[] = limit(isig[], ilow, ihigh)
    kres[] = limit(ksig[], klow, khigh)
      )
    ```

=== "Classic"
    ``` csound-orc
    ares limit asig, klow, khigh
    ires limit isig, ilow, ihigh
    kres limit ksig, klow, khigh
    ires[] limit isig[], ilow, ihigh
    kres[] limit ksig[], klow, khigh
    
    ```

### Initialization

_isig_ -- input signal

_ilow_ -- low threshold

_ihigh_ -- high threshold

### Performance

_xsig_ -- input signal

_klow_ -- low threshold

_khigh_ -- high threshold

_limit_ sets the lower and upper limits on the _xsig_ value it processes. If _xhigh_ is lower than _xlow_, then the output will be the average of  the two - it will not be affected by _xsig_.

This opcode is useful in several situations, such as table indexing or for clipping and modeling a-rate, i-rate or k-rate signals.

## Examples

Here is an example of the limit opcode. It uses the file [limit.csd](../examples/limit.csd).

``` csound-csd title="Example of the limit opcode." linenums="1"
--8<-- "examples/limit.csd"
```

## See also

[Signal Limiters](../sigmod/siglimit.md)

[Array opcodes](../math/array.md)

## Credits

Author: Robin Whittle<br>
Australia<br>

New in Csound version 3.46

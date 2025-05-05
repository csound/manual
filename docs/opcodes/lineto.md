<!--
id:lineto
category:Signal Modifiers:Standard Filters:Control
-->
# lineto
Generate glissandos starting from a control signal.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = lineto(ksig, ktime)
    ```

=== "Classic"
    ``` csound-orc
    kres lineto ksig, ktime
    ```

### Performance

_kres_ -- Output signal.

_ksig_ -- Input signal.

_ktime_ -- Time length of glissando in seconds.

_lineto_ adds glissando (i.e. straight lines) to a stepped input signal (for example, produced by [randh](../opcodes/randh.md) or [lpshold](../opcodes/lpshold.md)).  It generates a straight line starting from previous step value, reaching the new step value in _ktime_ seconds. When the new step value is reached, such value is held until a new step occurs. Be sure that _ktime_ argument value is smaller than the time elapsed between two consecutive steps of the original signal, otherwise discontinuities will occur in output signal.

When used together with the output of [lpshold](../opcodes/lpshold.md) it emulates the glissando effect of old analog sequencers.

> :memo: **Note**
>
> No new value for _ksig_ or _ktime_ will have effect until the previous _ktime_ has elapsed.

## Examples

Here is an example of the lineto opcode. It uses the file [lineto.csd](../examples/lineto.csd).

``` csound-csd title="Example of the lineto opcode." linenums="1"
--8<-- "examples/lineto.csd"
```

## See also

[Standard Filters: Control signal filters](../sigmod/standard.md)

## Credits

Author: Gabriel Maldonado

New in Version 4.13

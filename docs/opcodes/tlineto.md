<!--
id:tlineto
category:Signal Modifiers:Standard Filters:Control
-->
# tlineto
Generate glissandos starting from a control signal with a trigger.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = tlineto(ksig, ktime, ktrig)
    ```

=== "Classic"
    ``` csound-orc
    kres tlineto ksig, ktime, ktrig
    ```

### Performance

_kres_ -- Output signal.

_ksig_ -- Input signal.

_ktime_ -- Time length of glissando in seconds.

_ktrig_ -- Trigger signal.

_tlineto_ is similar to [lineto](../opcodes/lineto.md) but can be applied to any kind of signal (not only stepped signals) without producing discontinuities.  Last value of each segment is sampled and held from input signal each time _ktrig_ value is set to a nonzero value. Normally _ktrig_ signal consists of a sequence of zeroes (see [trigger opcode](../opcodes/trigger.md)).

The effect of glissando is quite different from [port](../opcodes/port.md). Since in these cases, the lines are straight. Also the context of usage is different.

## Examples

Here is an example of the tlineto opcode. It uses the file [tlineto.csd](../examples/tlineto.csd).

``` csound-csd title="Example of the tlineto opcode." linenums="1"
--8<-- "examples/tlineto.csd"
```

## See also

[Standard Filters: Control signal filters](../sigmod/standard.md)

## Credits

Author: Gabriel Maldonado

New in Version 4.13

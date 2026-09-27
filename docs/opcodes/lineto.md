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

_ktime_ -- Ramp duration in seconds. Positive durations are rounded up to a whole number of control cycles. Zero or negative durations jump to the new target immediately.

_lineto_ adds linear ramps to a stepped input signal, such as the output of [randh](../opcodes/randh.md) or [lpshold](../opcodes/lpshold.md). It starts at the first value of _ksig_. When it accepts a new target, it moves linearly to that value over _ktime_, then holds it until another ramp starts.

When used together with the output of [lpshold](../opcodes/lpshold.md) it emulates the glissando effect of old analog sequencers.

> :memo: **Note**
>
> _lineto_ finishes the current ramp before accepting another target or duration. Once the ramp ends, it uses the latest _ksig_ and _ktime_. Use [tlineto](../opcodes/tlineto.md) to interrupt a ramp with a trigger.

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

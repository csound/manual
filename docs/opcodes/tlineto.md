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

_ktime_ -- Ramp duration in seconds. Positive durations are rounded up to a whole number of control cycles. Zero or negative durations jump to the new target immediately.

_ktrig_ -- Trigger signal. Any nonzero value starts a new ramp.

_tlineto_ starts at the first value of _ksig_. On each control cycle where _ktrig_ is nonzero, it starts a new linear ramp from the current output to the current _ksig_, using _ktime_ as the duration. A trigger can interrupt an active ramp. After a ramp ends, the output holds its target until the next trigger.

Use one-cycle trigger pulses with zeroes between them, for example from [trigger](../opcodes/trigger.md). Holding _ktrig_ nonzero restarts the ramp every cycle and prevents a positive-duration ramp from advancing.

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

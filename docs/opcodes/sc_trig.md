<!--
id:sc_trig
category:Signal Modifiers:Standard Filters:Control
status:deprecated
-->
# sctrig
Timed trigger (Replaced by trighold).

Plugin opcode in scugens.

Port of Supercollider's Trig ugen. This opcode is deprecated and renamed to [trighold](../opcodes/trighold.md),

## Syntax
=== "Modern"
    ``` csound-orc
    aout = sc_trig(ain, kdur)
    kout = sc_trig(kin, kdur)
    ```

=== "Classic"
    ``` csound-orc
    aout sc_trig ain, kdur
    kout sc_trig kin, kdur
    ```

### Initialization

_initialvalue_ If given, sets the internal state. Default=0

### Performance

_ain_ -- Trigger. Trigger can be any signal. A trigger happens when the signal changes from non-positive to positive.

_kdur_ -- Duration of the trigger in seconds.

When a nonpositive to positive transition occurs at the input, Trig outputs the level of the triggering input for the specified duration, otherwise it outputs zero.

## Examples
=== "Modern"
    Here is an example of the sctrig opcode. It uses the file [sctrig.csd](../examples/sctrig.csd).
    ``` csound-csd title="Example of the sctrig opcode." linenums="1"
    --8<-- "examples/sctrig.csd"
    ```

=== "Classic"
    Here is an example of the sc_trig opcode. It uses the file [sc_trig.csd](../examples/sc_trig.csd).
    ``` csound-csd title="Example of the sc_trig opcode." linenums="1"
    --8<-- "examples/sc_trig.csd"
    ```

## See Also

[sc_lag](../opcodes/sc_lag.md),
[metro](../opcodes/metro.md),
[mpulse](../opcodes/mpulse.md)
[trigger](../opcodes/trigger.md)

## Credits

By: Eduardo Moguillansky 2017

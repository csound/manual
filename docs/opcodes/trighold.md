<!--
id:trighold
category:Signal Modifiers:Standard Filters:Control
-->
# trighold
Timed trigger, holds a value for a given time.

Plugin opcode in scugens.

Port of Supercollider's Trig ugen. When a nonpositive to positive transition occurs at the input, trighold outputs the level of the triggering input for the specified duration, otherwise it outputs zero.

## Syntax
=== "Modern"
    ``` csound-orc
    aout = trighold(ain, kdur)
    kout = trighold(kin, kdur)
    ```

=== "Classic"
    ``` csound-orc
    aout trighold ain, kdur
    kout trighold kin, kdur
    ```

### Initialization

_initialvalue_ If given, sets the internal state. Default=0

### Performance

_ain_ -- Trigger. Trigger can be any signal. A trigger happens when the signal changes from non-positive to positive.

_kdur_ -- Duration of the trigger in seconds.

## Examples

Here is an example of the trighold opcode. It uses the file [trighold.csd](../examples/trighold.csd).

``` csound-csd title="Example of the trighold opcode." linenums="1"
--8<-- "examples/trighold.csd"
```

## See also

[Sensing and Control: Tempo and Sequencing](../control/sensing.md)

## Credits

By: Eduardo Moguillansky 2017

<!--
id:schedwhen
category:Instrument Control:Invocation
-->
# schedwhen
Adds a new score event.

## Syntax
=== "Modern"
    ``` csound-orc
    schedwhen(ktrigger, kinsnum, kwhen, kdur [, ip4] [, ip5] [...])
    schedwhen(ktrigger, "insname", kwhen, kdur [, ip4] [, ip5] [...])
    ```

=== "Classic"
    ``` csound-orc
    schedwhen ktrigger, kinsnum, kwhen, kdur [, ip4] [, ip5] [...]
    schedwhen ktrigger, "insname", kwhen, kdur [, ip4] [, ip5] [...]
    ```

### Initialization

_ip4, ip5, ..._ -- Equivalent to p4, p5, etc., in a score [i statement](../scoregens/i.md).

### Performance

_kinsnum_ -- instrument number. Equivalent to p1 in a score [i statement](../scoregens/i.md).

_&#8220;insname&#8221;_ -- A string (in double-quotes) representing a named instrument.

_ktrigger_ -- trigger value for new event

_kwhen_ -- start time of the new event. Equivalent to p2 in a score [i statement](../scoregens/i.md).

_kdur_ -- duration of event. Equivalent to p3 in a score [i statement](../scoregens/i.md).

_schedwhen_ adds a new score event. The event is only scheduled when the k-rate value _ktrigger_ is first non-zero. The arguments, including options, are the same as in a score. The _kwhen_ time (p2) is measured from the time of this event.

If the duration is zero or negative the new event is of MIDI type, and inherits the release sub-event from the scheduling instruction.

> :memo: **Note**
>
> Note that the _schedwhen_ opcode can't accept string p-fields. If you need to pass strings when instantiating an instrument, use the [scoreline](../opcodes/scoreline.md) or [scoreline_i](../opcodes/scoreline_i.md) opcode.

## Examples

Here is an example of the schedwhen opcode. It uses the file [schedwhen.csd](../examples/schedwhen.csd).

``` csound-csd title="Example of the schedwhen opcode." linenums="1"
--8<-- "examples/schedwhen.csd"
```

## See also

[Instrument Invocation](../control/invocat.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
November 1998<br>

New in Csound version 3.491

Based on work by Gabriel Maldonado

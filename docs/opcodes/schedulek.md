<!--
id:schedulek
category:Instrument Control:Invocation
-->
# schedulek
Adds a new score event.

## Syntax
=== "Modern"
    ``` csound-orc
    schedulek(knsnum, kwhen, kdur [, kp4] [, kp5] [...])
    schedulek("insname", kwhen, kdur [, kp4] [, kp5] [...])
    schedulek(kPar[])
    ```

=== "Classic"
    ``` csound-orc
    schedulek knsnum, kwhen, kdur [, kp4] [, kp5] [...]
    schedulek "insname", kwhen, kdur [, kp4] [, kp5] [...]
    schedulek kPar[]
    ```

### Performance

_knsnum_ -- instrument number. Equivalent to p1 in a score [i statement](../scoregens/i.md). _knsnum_ must be a number greater than the number of the calling instrument.

_&#8220;insname&#8221;_ -- A string (in double-quotes) representing a named instrument.

_kwhen_ -- start time of the new event. Equivalent to p2 in a score [i statement](../scoregens/i.md). _kwhen_ must be nonnegative. If _kwhen_ is zero, _insum_ must be greater than or equal to the p1 of the current instrument.

_kdur_ -- duration of event. Equivalent to p3 in a score [i statement](../scoregens/i.md).

_kPar[]_ -- event parameters as a k-rate array.

_kp4, kp5, ..._ -- Equivalent to p4, p5, etc., in a score [i statement](../scoregens/i.md). The opcode also accepts strings as arguments for p4-pN.

_schedulek_ adds a new score event. The arguments, including options, are the same as in a score. The _kwhen_ time (p2) is measured from the time of this event.

If the duration is zero or negative the new event is of MIDI type, and inherits the release sub-event from the scheduling instruction.

## Examples

Here is an example of the schedulek opcode. It uses the file [schedulek.csd](../examples/schedulek.csd).

``` csound-csd title="Example of the schedule opcode." linenums="1"
--8<-- "examples/schedulek.csd"
```

A musical example featuring the schedulek opcode: [Schedulek_Heintz.csd](../examples/musical/Schedulek_Heintz.csd) by Joachim Heintz.

## See also

[Instrument Invocation](../control/invocat.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
January 2020<br>

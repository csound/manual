<!--
id:schedule
category:Instrument Control:Invocation
-->
# schedule
Adds a new score event.

## Syntax
=== "Modern"
    ``` csound-orc
    schedule(insnum, iwhen, idur [, ip4] [, ip5] [...])
    schedule("insname", iwhen, idur [, ip4] [, ip5] [...])
    schedule(iPar[])
    ```

=== "Classic"
    ``` csound-orc
    schedule insnum, iwhen, idur [, ip4] [, ip5] [...]
    schedule "insname", iwhen, idur [, ip4] [, ip5] [...]
    schedule iPar[]
    ```

### Initialization

_insnum_ -- instrument number. Equivalent to p1 in a score [i statement](../scoregens/i.md). _insnum_ must be a number greater than the number of the calling instrument.

_&#8220;insname&#8221;_ -- A string (in double-quotes) representing a named instrument.

_iwhen_ -- start time of the new event. Equivalent to p2 in a score [i statement](../scoregens/i.md). _iwhen_ must be nonnegative. If _iwhen_ is zero, _insum_ must be greater than or equal to the p1 of the current instrument.

_idur_ -- duration of event. Equivalent to p3 in a score [i statement](../scoregens/i.md).

_iPar[]_ -- event parameters as an i-time array.

_ip4, ip5, ..._ -- Equivalent to p4, p5, etc., in a score [i statement](../scoregens/i.md). The opcode also accepts strings as arguments for p4-pN.

### Performance

_schedule_ adds a new score event. The arguments, including options, are the same as in a score. The _iwhen_ time (p2) is measured from the time of this event.

If the duration is zero or negative the new event is of MIDI type, and inherits the release sub-event from the scheduling instruction.

## Examples

Here is an example of the schedule opcode. It uses the file [schedule.csd](../examples/schedule.csd).

``` csound-csd title="Example of the schedule opcode." linenums="1"
--8<-- "examples/schedule.csd"
```

## See also

[Instrument Invocation](../control/invocat.md)

More information on this opcode: [http://www.csoundjournal.com/issue15/phrase_loops.html](http://www.csoundjournal.com/issue15/phrase_loops.html)  , written by Jim Aikin

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
November 1998<br>

Example written by Kevin Conder.

New in Csound version 3.491

Based on work by Gabriel Maldonado

Thanks goes to David Gladstein, for clarifying the _iwhen_ parameter.

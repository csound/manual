<!--
id:nstance
category:Instrument Control:Invocation
-->
# nstance
Schedules a new instrument instance, storing the instance handle in a variable.

This handle can be used later to refer directly to the running nstance. This opcode is similar to schedule, but has the added facility of retrieving the nstance handle.

## Syntax
=== "Modern"
    ``` csound-orc
    iHandle = nstance(insnum, iwhen, idur [, ip4] [, ip5] [...])
    iHandle = nstance("insname", iwhen, idur [, ip4] [, ip5] [...])
    ```

=== "Classic"
    ``` csound-orc
    iHandle nstance insnum, iwhen, idur [, ip4] [, ip5] [...]
    iHandle nstance "insname", iwhen, idur [, ip4] [, ip5] [...]
    ```

### Initialization

_iHandle_ -- this variable will contain a handle to the event instance. It can be used, for example, to stop the given instrument instance via the turnoff opcode. Note that the instance handle is only valid once the instrument is initialised.

_insnum_ -- instrument number. Equivalent to p1 in a score [i statement](../scoregens/i.md). _insnum_ must be a number greater than the number of the calling instrument.

_&#8220;insname&#8221;_ -- A string (in double-quotes) representing a named instrument.

_iwhen_ -- start time of the new event. Equivalent to p2 in a score [i statement](../scoregens/i.md). _iwhen_ must be nonnegative. If _iwhen_ is zero, _insum_ must be greater than or equal to the p1 of the current instrument.

_idur_ -- duration of event. Equivalent to p3 in a score [i statement](../scoregens/i.md).

_ip4, ip5, ..._ -- Equivalent to p4, p5, etc., in a score [i statement](../scoregens/i.md).

### Performance

_nstance_ adds a new score event. The arguments, including options, are the same as in a score. The _iwhen_ time (p2) is measured from the time of this event.

If the duration is zero or negative the new event is of MIDI type, and inherits the release sub-event from the scheduling instruction.

> :memo: **Note**
>
> Note that the _nstance_ opcode cannot accept string p-fields. If you need to pass strings when instantiating an instrument, use the [scoreline](../opcodes/scoreline.md) or [scoreline_i](../opcodes/scoreline_i.md) opcode.

## Examples

Here is an example of the nstance opcode. It uses the file [nstance.csd](../examples/nstance.csd).

``` csound-csd title="Example of the nstance opcode." linenums="1"
--8<-- "examples/nstance.csd"
```

## See also

[Instrument Invocation](../control/invocat.md)

More information on this opcode: [http://www.csoundjournal.com/issue15/phrase_loops.html](http://www.csoundjournal.com/issue15/phrase_loops.html), written by Jim Aikin

## Credits

Author: Victor Lazzarini<br>
November 2013<br>

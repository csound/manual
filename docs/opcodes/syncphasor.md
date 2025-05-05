<!--
id:syncphasor
category:Signal Generators:Phasors
-->
# syncphasor
Produces a normalized moving phase value with sync input and output.

Produces a moving phase value between zero and one and an extra impulse output ("sync out") whenever its phase value crosses or is reset to zero. The phase can be reset at any time by an impulse on the "sync in" parameter.

## Syntax
=== "Modern"
    ``` csound-orc
    aphase, asyncout = syncphasor(xcps, asyncin, [, iphs])
    ```

=== "Classic"
    ``` csound-orc
    aphase, asyncout syncphasor xcps, asyncin, [, iphs]
    ```

### Initialization

_iphs_ (optional) -- initial phase, expressed as a fraction of a cycle (0 to 1). A negative value will cause phase initialization to be skipped. The default value is zero.

### Performance

_aphase_ -- the output phase value; always between 0 and 1.

_asyncout_ -- the sync output has a value of 1.0 for one sample whenever the phase value crosses zero or whenever the sync input is non-zero.  It is zero at all other times.

_asyncin_ -- the sync input causes the phase to reset  to zero whenever _asyncin_ is non-zero.

_xcps_ -- frequency of the phasor in cycles-per-second.  If _xcps_ is negative, the phase value will decrease from 1 to 0 instead of increasing.

An internal phase is successively accumulated in accordance with the _xcps_ frequency to produce a moving phase value, normalized to lie in the range 0 &lt;= phs &lt; 1.  When used as the index to a [table](../opcodes/table.md) unit, this phase (multiplied by the desired function table length) will cause it to behave like an oscillator.

The phase of _syncphasor_ though can be synced to another phasor (or other signal) using the _asyncin_ parameter.  Any time that _asyncin_ is a non-zero value, the value of _aphase_ will be reset to zero.  _syncphasor_ also outputs its own "sync" signal that consists of a one-sample impulse whenever its phase crosses zero or is reset.  This makes it easy to chain together multiple _syncphasor_ opcodes to create an oscillator "hard sync" effect.

## Examples

Here is an example of the syncphasor opcode. It uses the file [syncphasor.csd](../examples/syncphasor.csd).

``` csound-orc title="Example of the syncphasor opcode." linenums="1"
--8<-- "examples/syncphasor.csd"
```

Here is another example of the syncphasor opcode. It uses the file [syncphasor-CZresonance.csd](../examples/syncphasor-CZresonance.csd).

``` csound-orc title="Another example of the syncphasor opcode." linenums="1"
--8<-- "examples/syncphasor-CZresonance.csd"
```

## See also

[Phasors](../siggen/phasors.md)

## Credits

Adapted from the _phasor_ opcode by Anthony Kozar<br>
January 2008<br>

New in Csound version 5.08

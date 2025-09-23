<!--
id:gtadsr
category:Signal Generators:Envelope Generators
-->
# gtadsr
A gated linear attack-decay-sustain with exponential release.

This opcode can work either as a signal generator or as a signal processor. It is controlled by a gate k-rate signal (0 or  > 0) which switches the envelope attack-decay-sustain phase on/off. With gate > 0 (high), the envelope cycles through the attack and decay phases, and is sustained at the sustain level. Whenever gate is 0 (low), the envelope enters the release phase, decaying exponentially to 0. The attack and decay times are fixed with gate > 0, but can be changed once the gate is zero.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = gtadsr(asig, katt, kdec, ksus, krel, kgate)
    xres = gtadsr(kamp, katt, kdec, ksus, krel, kgate)
    ```

=== "Classic"
    ``` csound-orc
    ares gtadsr asig, katt, kdec, ksus, krel, kgate
    xres gtadsr kamp, katt, kdec, ksus, krel, kgate
    ```

### Performance

_x/ares_ -- output signal (k or a-rate)

_asig_ -- input signal (envelope as an amplitude processor)

_kamp_ -- maximum amplitude (envelope as a
signal generator)

_katt_ -- duration of attack phase

_kdec_ -- duration of decay

_ksus_ -- level for sustain phase (in the
range 0 - 1)

_krel_ -- duration of release phase

_kgate_ -- gate signal (0 = low, > 0 high).

The length of the sustain is calculated from the length of the note. This means _gtadsr_ is not suitable for use with MIDI events.

## Examples

Here is an example of the gtadsr opcode. It uses the file [gtadsr.csd](../examples/gtadsr.csd).

``` csound-csd title="Example of the gtadsr opcode." linenums="1"
--8<-- "examples/gtadsr.csd"
```

## See Also

[Envelope Generators](../siggen/envelope.md)

## Credits

Author: Victor Lazzarini;

New in version 6.17

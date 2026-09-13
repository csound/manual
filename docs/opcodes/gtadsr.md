<!--
id:gtadsr
category:Signal Generators:Envelope Generators
-->
# gtadsr
A gated linear attack-decay-sustain with exponential release.

This opcode can generate an envelope or apply it to an audio signal. A positive _kgate_ starts attack and decay, then holds the sustain level. A zero or negative gate starts release. Attack and decay durations are captured when the gate becomes positive.

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

_katt_ -- attack duration in seconds; must be nonnegative.

_kdec_ -- decay duration in seconds; must be nonnegative.

_ksus_ -- level for sustain phase (in the
range 0 - 1)

_krel_ -- release time in seconds for a 60 dB drop in envelope level. Zero or negative values end release immediately.

_kgate_ -- gate signal (zero or negative = low, positive = high).

Attack reaches the peak envelope level before decay begins, and decay reaches _ksus_. Zero or very short attack and decay times each take at least one output sample at audio rate, or one control period at control rate. If the gate becomes positive during release, a new attack starts from the current level and lasts for the newly captured attack duration.

Sustain lasts while the gate stays positive; it is not calculated from the score note's duration. For MIDI use, drive the gate from the note state and keep the instrument running long enough for release.

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

<!--
id:expsegr
category:Signal Generators:Linear and Exponential Generators
-->
# expsegr
Trace a series of exponential segments between specified points including a release segment.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = expsegr(ia, idur1, ib [, idur2] [, ic] [...], irel, iz)
    kres = expsegr(ia, idur1, ib [, idur2] [, ic] [...], irel, iz)
    ```

=== "Classic"
    ``` csound-orc
    ares expsegr ia, idur1, ib [, idur2] [, ic] [...], irel, iz
    kres expsegr ia, idur1, ib [, idur2] [, ic] [...], irel, iz
    ```

### Initialization

_ia_ -- starting value. Zero is illegal for exponentials.

_ib, ic_, etc. -- value after _dur1_ seconds, etc. For exponentials, must be non-zero and must agree in sign with _ia_.

_idur1_ -- duration in seconds of first segment. A negative value skips initialization and preserves the current envelope state. Zero jumps immediately to _ib_.

_idur2, idur3_, etc. -- duration in seconds of subsequent segments. A zero or negative duration jumps to the next value and continues with the following segment. The default is zero.

_irel, iz_ -- duration in seconds and final value of the release segment. Like the other values, _iz_ must be non-zero and have the same sign as _ia_.

### Performance

These units generate control or audio signals whose values can pass through 2 or more specified points. If the note ends before the specified segments finish, the release starts from the current value. If the segments finish first, the last value before the release holds until the note ends.

Segment durations round to the nearest whole control period for _kres_ and down to whole samples for _ares_. A duration that becomes zero steps jumps to the next value without taking an extra step.
_expsegr_ is amongst the Csound &#8220;r&#8221; units that contain a note-off sensor and release time extender. When each senses an event termination or MIDI noteoff, it immediately extends the performance time of the current instrument by _irel _seconds, and sets out to reach the value _iz_ by the end of that period (no matter which segment the unit is in). MIDI Note Off velocity does not control the release segment. For two or more extenders in an instrument, extension is by the greatest period.

_expsegr_ starts its release when the note ends or it receives a MIDI note-off. The release duration rounds to whole control periods at both output rates. A release that rounds to zero jumps straight to _iz_. The instrument stays active for one extra control period to output _iz_. If several opcodes extend the note, the longest extension applies.

You can use other pre-made envelopes which start a release segment upon receiving a note off message, like [linsegr](../opcodes/linsegr.md) and [madsr](../opcodes/madsr.md), or you can construct more complex envelopes using [xtratim](../opcodes/xtratim.md) and [release](../opcodes/release.md). Note that you do not need to use [xtratim](../opcodes/xtratim.md) if you are using _expsegr_, since the time is extended automatically.

## Examples

Here is an example of the expsegr opcode. It uses the file [expsegr.csd](../examples/expsegr.csd).

``` csound-csd title="Example of the expsegr opcode." linenums="1"
--8<-- "examples/expsegr.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Author: Barry L. Vercoe

New in Csound 3.47

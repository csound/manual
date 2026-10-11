<!--
id:linsegr
category:Signal Generators:Linear and Exponential Generators
-->
# linsegr
Trace a series of line segments between specified points including a release segment.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = linsegr(ia, idur1, ib [, idur2] [, ic] [...], irel, iz)
    kres = linsegr(ia, idur1, ib [, idur2] [, ic] [...], irel, iz)
    ```

=== "Classic"
    ``` csound-orc
    ares linsegr ia, idur1, ib [, idur2] [, ic] [...], irel, iz
    kres linsegr ia, idur1, ib [, idur2] [, ic] [...], irel, iz
    ```

### Initialization

_ia_ -- starting value.

_ib, ic_, etc. -- value after _dur1_ seconds, etc.

_idur1_ -- duration in seconds of first segment. A zero or negative value will cause all initialization to be skipped.

_idur2, idur3_, etc. -- duration in seconds of subsequent segments. A zero or negative duration jumps to the next value and continues with the following segment. The default is zero.

_irel, iz_ -- duration in seconds and final value of a note releasing segment.

For Csound versions prior to 5.00, the release time cannot be longer than 32767/[kr](../opcodes/kr.md) seconds. This limit has been extended to (2<sup>31</sup>-1)/kr.

### Performance

These units generate control or audio signals whose values can pass through 2 or more specified points. If the note ends before the specified segments finish, the release starts from the current value. If the segments finish first, the last value before the release holds until the note ends.

Segment durations round to the nearest whole control period for _kres_ or sample for _ares_. A positive duration that rounds to zero jumps to the next value without taking an extra step. The release duration rounds to whole control periods at both rates; a release that rounds to zero jumps straight to _iz_.

_linsegr_ is amongst the Csound &#8220;r&#8221; units that contain a note-off sensor and release time extender. When each senses an event termination or MIDI noteoff, it immediately extends the performance time of the current instrument by _irel _seconds, and sets out to reach the value _iz_ by the end of that period (no matter which segment the unit is in). MIDI Note Off velocity does not control the release segment. For two or more extenders in an instrument, extension is by the greatest period.

You can use other pre-made envelopes which start a release segment upon receiving a note off message, like [linenr](../opcodes/linenr.md) and [expsegr](../opcodes/expsegr.md), or you can construct more complex envelopes using [xtratim](../opcodes/xtratim.md) and [release](../opcodes/release.md). Note that you do not need to use [xtratim](../opcodes/xtratim.md) if you are using _linsegr_, since the time is extended automatically.

## Examples

Here is an example of the linsegr opcode. It uses the file [linsegr.csd](../examples/linsegr.csd).

``` csound-csd title="Example of the linsegr opcode." linenums="1"
--8<-- "examples/linsegr.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Author: Barry L. Vercoe

December 2002, December 2006. Thanks to Istvan Varga, added documentation about the maximum release time.

New in Csound 3.47

<!--
id:cossegr
category:Signal Generators:Linear and Exponential Generators
-->
# cossegr
Trace a series of line segments between specified points with
cosine interpolation, including a release segment.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = cossegr(ia, idur1, ib [, idur2] [, ic] [...], irel, iz)
    kres = cossegr(ia, idur1, ib [, idur2] [, ic] [...], irel, iz)
    ```

=== "Classic"
    ``` csound-orc
    ares cossegr ia, idur1, ib [, idur2] [, ic] [...], irel, iz
    kres cossegr ia, idur1, ib [, idur2] [, ic] [...], irel, iz
    ```

### Initialization

_ia_ -- starting value.

_ib, ic_, etc. -- value after _dur1_ seconds, etc.

_idur1_ -- duration in seconds of first segment. A zero or negative value will cause all initialization to be skipped.

_idur2, idur3_, etc. -- duration in seconds of subsequent segments. A zero or negative value will terminate the initialization process with the preceding point, permitting the last-defined line or curve to be continued indefinitely in performance. The default is zero.

_irel, iz_ -- duration in seconds and final value of a note releasing segment.

### Performance

These units generate control or audio signals whose values can pass through 2 or more specified points. The sum of _dur_ values may or may not equal the instrument's performance time: a shorter performance will truncate the specified pattern, while a longer one will cause the last-defined segment to continue on in the same direction.

_cossegr_ is amongst the Csound &#8220;r&#8221; units that contain a note-off sensor and release time extender. When each senses an event termination or MIDI noteoff, it immediately extends the performance time of the current instrument by _irel _seconds, and sets out to reach the value _iz_ by the end of that period (no matter which segment the unit is in). &#8220;r&#8221; units can also be modified by MIDI noteoff velocities. For two or more extenders in an instrument, extension is by the greatest period.

You can use other pre-made envelopes which start a release segment upon receiving a note off message, like [linenr](../opcodes/linenr.md) and [expsegr](../opcodes/expsegr.md), or you can construct more complex envelopes using [xtratim](../opcodes/xtratim.md) and [release](../opcodes/release.md). Note that you do not need to use [xtratim](../opcodes/xtratim.md) if you are using _cossegr_, since the time is extended automatically.

## Examples

Here is an example of the cossegr opcode. It uses the file [cossegr.csd](../examples/cossegr.csd).

``` csound-orc title="Example of the cossegr opcode." linenums="1"
--8<-- "examples/cossegr.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Author: John ffitch

August 2012.

New in Csound 5.18

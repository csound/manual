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

_idur2, idur3_, etc. -- duration in seconds of subsequent segments. A zero or negative duration jumps to that segment's end value and continues with the next segment.

_irel, iz_ -- duration in seconds and final value of a note releasing segment.

### Performance

Before the release, segment durations use whole samples at audio rate and whole control periods at control rate. A positive duration that rounds to zero steps also jumps to its end value; later segments still run.

After the segments before the release finish, _cossegr_ holds their final value until the note ends or it receives a MIDI note-off. The release starts from the current output, even if an earlier segment is still running, and ends at _iz_. MIDI Note Off velocity does not control the release segment.

At both output rates, _irel_ rounds to the nearest whole control period. A release that rounds to zero jumps straight to _iz_. The instrument stays active for one extra control period to output _iz_. If several opcodes extend the note, the longest extension applies.

You can use other pre-made envelopes which start a release segment upon receiving a note off message, like [linenr](../opcodes/linenr.md) and [expsegr](../opcodes/expsegr.md), or you can construct more complex envelopes using [xtratim](../opcodes/xtratim.md) and [release](../opcodes/release.md). Note that you do not need to use [xtratim](../opcodes/xtratim.md) if you are using _cossegr_, since the time is extended automatically.

## Examples

Here is an example of the cossegr opcode. It uses the file [cossegr.csd](../examples/cossegr.csd).

``` csound-csd title="Example of the cossegr opcode." linenums="1"
--8<-- "examples/cossegr.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Author: John ffitch

August 2012.

New in Csound 5.18

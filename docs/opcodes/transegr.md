<!--
id:transegr
category:Signal Generators:Linear and Exponential Generators
-->
# transegr
Constructs a user-definable envelope with extended release segment.

Like [transeg](../opcodes/transeg.md), with a final segment that starts at note-off.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = transegr(ia, idur, itype, ib [, idur2] [, itype] [, ic] ...)
    kres = transegr(ia, idur, itype, ib [, idur2] [, itype] [, ic] ...)
    ```

=== "Classic"
    ``` csound-orc
    ares transegr ia, idur, itype, ib [, idur2] [, itype] [, ic] ...
    kres transegr ia, idur, itype, ib [, idur2] [, itype] [, ic] ...
    ```

### Initialization

_ia_ -- starting value.

_ib, ic,_ etc. -- target value of each segment.

_idur_ -- duration in seconds of the first segment. A zero or negative value skips initialization and preserves a running envelope, including its release.

_idur2,... idurx_ etc. -- duration in seconds of each later segment. The last segment is the release. A zero or negative duration makes a later segment jump to its target.

_itype, itype2,_ etc. -- curve shape. Zero gives a straight line. For a nonzero value, the curve is:

```
start + (end - start) * (1 - exp(itype*t)) / (1 - exp(itype))
```

Here, _t_ runs from 0 to 1 over the segment.

### Performance

If _itype_ &gt; 0, there is a slowly rising (concave) or slowly decaying (convex) curve, while if _itype_ &lt; 0, the curve is fast rising (convex) or fast decaying (concave). See also [GEN16](../scoregens/gen16.md).

At audio rate, durations round to the nearest sample. At control rate, durations truncate to whole control periods. A duration that becomes zero after rounding or truncation makes the segment jump to its target.

The envelope runs through all segments except the last, then holds the value before the release. With only one segment, it holds _ia_ until note-off.

Note-off starts the final segment from the envelope's current value, even if an earlier segment is still running. This happens at the end of a timed note, on a MIDI note-off, on a negative p1 [note event](../scoregens/i.md), or when [turnoff2](../opcodes/turnoff2.md) requests a release.

_transegr_ extends the note long enough to output the release endpoint. A zero-length release still outputs its target. If another opcode keeps the note alive longer, _transegr_ holds its endpoint without stretching the release.

## Examples

Here is an example of the transegr opcode. It uses the file [transegr.csd](../examples/transegr.csd).

``` csound-csd title="Example of the transegr opcode." linenums="1"
--8<-- "examples/transegr.csd"
```

## See also

[Linear and Exponential Generators](../siggen/lineexp.md)

## Credits

Author: John ffitch<br>
january 2010<br>

New in Csound version 5.12

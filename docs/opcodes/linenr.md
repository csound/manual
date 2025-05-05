<!--
id:linenr
category:Signal Generators:Envelope Generators
-->
# linenr
The _linen_ opcode extended with a final release segment.

_linenr_ -- same as [linen](../opcodes/linen.md) except that the final segment is entered only on sensing a MIDI note release. The note is then extended by the decay time.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = linenr(xamp, irise, idec, iatdec)
    kres = linenr(kamp, irise, idec, iatdec)
    ```

=== "Classic"
    ``` csound-orc
    ares linenr xamp, irise, idec, iatdec
    kres linenr kamp, irise, idec, iatdec
    ```

### Initialization

_irise_ -- rise time in seconds. A zero or negative value signifies no rise modification.

_idec_ -- decay time in seconds. Zero means no decay.

_iatdec_ -- attenuation factor by which the closing steady state value is reduced exponentially over the decay period. This value must be positive and is normally of the order of .01. A large or excessively small value is apt to produce a cutoff which is audible. A zero or negative value is illegal.

### Performance

_kamp, xamp_ -- input amplitude signal.

_linenr_ is unique within Csound in containing a _note-off sensor_ and _release time extender_. When it senses either a score event termination or a MIDI noteoff, it will immediately extend the performance time of the current instrument by _idec_ seconds, then execute an exponential decay towards the factor _iatdec_. For two or more units in an instrument, extension is by the greatest _idec_.

You can use other pre-made envelopes which start a release segment upon receiving a note off message, like [linsegr](../opcodes/linsegr.md) and [expsegr](../opcodes/expsegr.md), or you can construct more complex envelopes using [xtratim](../opcodes/xtratim.md) and [release](../opcodes/release.md). Note that you don't need to use [xtratim](../opcodes/xtratim.md) if you are using _linenr_, since the time is extended automatically.

These &#8220;r&#8221; units can also be modified by MIDI noteoff velocities (see veloffs).

## Examples

Here is an example of the linenr opcode. It uses the file [linenr.csd](../examples/linenr.csd).

``` csound-csd title="Example of the linenr opcode." linenums="1"
--8<-- "examples/linenr.csd"
```

## See Also

[Envelope Generators](../siggen/envelope.md)

<!--
id:envlpxr
category:Signal Generators:Envelope Generators
-->
# envlpxr
The _envlpx_ opcode with a final release segment.

_envlpxr_ is the same as [envlpx](../opcodes/envlpx.md) except that the final segment is entered only on sensing a MIDI note release. The note is then extended by the decay time.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = envlpxr(xamp, irise, idec, ifn, iatss, iatdec [, ixmod] [,irind])
    kres = envlpxr(kamp, irise, idec, ifn, iatss, iatdec [, ixmod] [,irind])
    ```

=== "Classic"
    ``` csound-orc
    ares envlpxr xamp, irise, idec, ifn, iatss, iatdec [, ixmod] [,irind]
    kres envlpxr kamp, irise, idec, ifn, iatss, iatdec [, ixmod] [,irind]
    ```

### Initialization

_irise_ -- rise time in seconds. A zero or negative value signifies no rise modification.

_idec_ -- decay time in seconds. Zero means no decay.

_ifn_ -- function table number of stored rise shape with extended guard point.

_iatss_ --  attenuation factor determining the exponential change in value over time during the pseudo steady state period between the end of the rise and the beginning of the decay (at the note's release).  A factor greater than 1 causes an exponential growth and a factor less than 1 creates an exponential decay. A factor of 1 will maintain a true steady state at the last rise value; 0 is illegal. The value will change by _abs_(_iatss_) per second.

_iatdec_ --  the ratio of the value at the end of the decay period to the value at its beginning (when the note is released). It must be positive and is normally of the order of .01. A large or excessively small value is apt to produce a cutoff which is audible. A zero or negative value is illegal.

_ixmod_ (optional, between +- .9 or so) -- exponential curve modifier, influencing the steepness of the exponential trajectory during the steady state. Values less than zero will cause an accelerated growth or decay towards the target (e.g. _subito piano_). Values greater than zero will cause a retarded growth or decay. The default value is zero (unmodified exponential).

_irind _ (optional) -- independence flag. If left zero, the release time (_idec_) will influence the extended life of the current note following a note-off. If non-zero, the _idec_ time is quite independent of the note extension (see below). The default value is 0.

### Performance

_kamp, xamp_ -- input amplitude signal.

_envlpxr_ is an example of the special Csound &#8220;r&#8221; units that contain a note-off sensor and release time extender. When each senses a score event termination or a MIDI noteoff, it will immediately extend the performance time of the current instrument by _idec_ seconds unless it is made independent by _irind_. Then it will begin a decay from wherever it was at the time.

You can use other pre-made envelopes which start a release segment upon receiving a note off message, like [linsegr](../opcodes/linsegr.md) and [expsegr](../opcodes/expsegr.md), or you can construct more complex envelopes using [xtratim](../opcodes/xtratim.md) and [release](../opcodes/release.md). Note that you do not need to use [xtratim](../opcodes/xtratim.md) if you are using _envlpxr_, since the time is extended automatically.

**Multiple &#8220;r&#8221; units**. When two or more &#8220;r&#8221; units occur in the same instrument it is usual to have only one of them influence the overall note duration. This is normally the master amplitude unit. Other units controlling, say, filter motion can still be sensitive to note-off commands while not affecting the duration by making them independent (_irind_ non-zero). Depending on their own _idec_ (release time) values, independent &#8220;r&#8221; units may or may not reach their final destinations before the instrument terminates. If they do, they will simply hold their target values until termination. If two or more &#8220;r&#8221; units are simultaneously master, note extension is by the greatest _idec_.

## Examples

Here is an example of the envlpxr opcode. It uses the file [envlpxr.csd](../examples/envlpxr.csd).

``` csound-csd title="Example of the envlpxr opcode." linenums="1"
--8<-- "examples/envlpxr.csd"
```

## See Also

[Envelope Generators](../siggen/envelope.md)

## Credits

Thanks goes to Luis Jure for pointing out a mistake with _iatss_.

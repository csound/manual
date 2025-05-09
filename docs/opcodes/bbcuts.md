<!--
id:bbcuts
category:Signal Generators:Sample Playback
-->
# bbcuts
Generates breakbeat-style cut-ups of a stereo audio stream.

The BreakBeat Cutter automatically generates cut-ups of a source audio stream in the style of drum and bass/jungle breakbeat manipulations.  There are two versions, for mono (_bbcutm_) or stereo (_bbcuts_) sources.  Whilst originally based on breakbeat cutting, the opcode can be applied to any type of source audio.

The prototypical cut sequence favoured over one bar with eighth note subdivisions would be

```
3+ 3R + 2
```

where we take a 3 unit block from the source's start, repeat it, then 2 units from the 7th and 8th eighth notes of the source.

We talk of rendering phrases (a sequence of cuts before reaching a new phrase at the beginning of a bar) and units (as subdivision th notes).

The opcode comes most alive when multiple synchronised versions are used simultaneously.

## Syntax
=== "Modern"
    ``` csound-orc
    a1,a2 = bbcuts(asource1, asource2, ibps, isubdiv, ibarlength, iphrasebars, \
                   inumrepeats [, istutterspeed] [, istutterchance] [, ienvchoice])
    ```

=== "Classic"
    ``` csound-orc
    a1,a2 bbcuts asource1, asource2, ibps, isubdiv, ibarlength, iphrasebars, \
                 inumrepeats [, istutterspeed] [, istutterchance] [, ienvchoice]
    ```

### Initialization

_ibps_ -- Tempo to cut at, in beats per second.

_isubdiv_ -- Subdivisions unit, for a bar. So 8 is eighth notes (of a 4/4 bar).

_ibarlength_ -- How many beats per bar. Set to 4 for default 4/4 bar behaviour.

_iphrasebars_ -- The output cuts are generated in phrases, each phrase is up to iphrasebars long

_inumrepeats_ --  In normal use the algorithm would allow up to one additional repeat of a given cut at a time. This parameter allows that to be changed. Value 1 is normal- up to one extra repeat. 0 would avoid repeating, and you would always get back the original source except for enveloping and stuttering.

_istutterspeed_ -- (optional, default=1) The stutter can be an integer multiple of the subdivision speed. For instance, if subdiv is 8 (quavers) and stutterspeed is 2, then the stutter is in semiquavers (sixteenth notes= subdiv 16). The default is 1.

_istutterchance_ -- (optional, default=0) The tail of a phrase has this chance of becoming a single repeating one unit cell stutter (0.0 to 1.0). The default is 0.

_ienvchoice_ -- (optional, default=1) choose 1 for on (exponential envelope for cut grains) or 0 for off. Off will cause clicking, but may give good noisy results, especially for percussive sources. The default is 1, on.

### Performance

_asource_ -- The audio signal to be cut up. This version runs in real-time without knowledge of future audio.

## Examples

=== "Modern"
    Here is an example of the bbcuts opcode. It uses the file [bbcuts-modern.csd](../examples/bbcuts-modern.csd).
    ``` csound-orc title="Example of the bbcuts opcode." linenums="1"
    --8<-- "examples/bbcuts-modern.csd"
    ```

=== "Classic"
    Here is an example of the bbcuts opcode. It uses the file [bbcuts.csd](../examples/bbcuts.csd).
    ``` csound-orc title="Example of the bbcuts opcode." linenums="1"
    --8<-- "examples/bbcuts.csd"
    ```

## See also

[Sample Playback](../siggen/sample.md)

## Credits

Author: Nick Collins<br>
London<br>
August 2001<br>

New in version 4.13

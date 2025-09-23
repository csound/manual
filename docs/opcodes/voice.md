<!--
id:voice
category:Signal Generators:Models and Emulations
-->
# voice
An emulation of a human voice.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = voice(kamp, kfreq, kphoneme, kform, kvibf, kvamp, ifn, ivfn)
    ```

=== "Classic"
    ``` csound-orc
    ares voice kamp, kfreq, kphoneme, kform, kvibf, kvamp, ifn, ivfn
    ```

### Initialization

_ifn_, _ivfn_ -- two table numbers containing the carrier waveform and the vibrato waveform. The files [impuls20.aiff](../examples/impuls20.aiff), [ahh.aiff](../examples/ahh.aiff), [eee.aiff](../examples/eee.aiff), or [ooo.aiff](../examples/ooo.aiff) are suitable for the first of these, and a sine wave for the second. These files are available from [ftp://ftp.cs.bath.ac.uk/pub/dream/documentation/sounds/modelling/](ftp://ftp.cs.bath.ac.uk/pub/dream/documentation/sounds/modelling/).

### Performance

_kamp_ -- Amplitude of note.

_kfreq_ -- Frequency of note played. It can be varied in performance.

_kphoneme_ -- an integer in the range 0 to 16, which select the formants for the sounds:

*   &#8220;eee&#8221;, &#8220;ihh&#8221;, &#8220;ehh&#8221;, &#8220;aaa&#8221;,
*   &#8220;ahh&#8221;, &#8220;aww&#8221;, &#8220;ohh&#8221;, &#8220;uhh&#8221;,
*   &#8220;uuu&#8221;, &#8220;ooo&#8221;, &#8220;rrr&#8221;, &#8220;lll&#8221;,
*   &#8220;mmm&#8221;, &#8220;nnn&#8221;, &#8220;nng&#8221;, &#8220;ngg&#8221;.

At present the phonemes

*   &#8220;fff&#8221;, &#8220;sss&#8221;, &#8220;thh&#8221;, &#8220;shh&#8221;,
*   &#8220;xxx&#8221;, &#8220;hee&#8221;, &#8220;hoo&#8221;, &#8220;hah&#8221;,
*   &#8220;bbb&#8221;, &#8220;ddd&#8221;, &#8220;jjj&#8221;, &#8220;ggg&#8221;,
*   &#8220;vvv&#8221;, &#8220;zzz&#8221;, &#8220;thz&#8221;, &#8220;zhh&#8221;

are not available (!)

_kform_ -- Gain on the phoneme. values 0.0 to 1.2 recommended.

_kvibf_ -- frequency of vibrato in Hertz. Suggested range is 0 to 12

_kvamp_ -- amplitude of the vibrato

## Examples

Here is an example of the voice opcode. It uses the file [voice.csd](../examples/voice.csd), and [impuls20.aiff](../examples/impuls20.aiff).

``` csound-orc title="Example of the voice opcode." linenums="1"
--8<-- "examples/voice.csd"
```

## See Also

[Models and Emulations](../siggen/models.md)

## Credits

Author: John ffitch (after Perry Cook)<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 3.47

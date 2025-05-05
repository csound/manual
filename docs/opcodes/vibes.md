<!--
id:vibes
category:Signal Generators:Models and Emulations
-->
# vibes
Physical model related to the striking of a metal block as found in a vibraphone.

The method is a physical model developed from Perry Cook, but re-coded for Csound.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = vibes(kamp, kfreq, ihrd, ipos, imp, kvibf, kvamp, ivibfn, idec)
    ```

=== "Classic"
    ``` csound-orc
    ares vibes kamp, kfreq, ihrd, ipos, imp, kvibf, kvamp, ivibfn, idec
    ```

### Initialization

_ihrd_ -- the hardness of the stick used in the strike. A range of 0 to 1 is used. 0.5 is a suitable value.

_ipos_ -- where the block is hit, in the range 0 to 1.

_imp_ -- a table of the strike impulses. The file [marmstk1.wav](../examples/marmstk1.wav) is a suitable function from measurements and can be loaded with a [GEN01](../scoregens/gen01.md) table. It is also available at [ftp://ftp.cs.bath.ac.uk/pub/dream/documentation/sounds/modelling/](ftp://ftp.cs.bath.ac.uk/pub/dream/documentation/sounds/modelling/).

_ivfn_ -- shape of tremolo, usually a sine table, created by a function

_idec_ --  time before end of note when damping is introduced

### Performance

_kamp_ -- Amplitude of note.

_kfreq_ -- Frequency of note played.

_kvibf_ -- frequency of tremolo in Hertz. Suggested range is 0 to 12

_kvamp_ -- amplitude of the tremolo

## Examples

Here is an example of the vibes opcode. It uses the file [vibes.csd](../examples/vibes.csd), and [marmstk1.wav](../examples/marmstk1.wav).

``` csound-orc title="Example of the vibes opcode." linenums="1"
--8<-- "examples/vibes.csd"
```

A musical example featuring the vibes opcode: [Vibes_Pena.csd](../examples/musical/Vibes_Pena.csd), by luis Antunes Pena.

## See Also

[Models and Emulations](../siggen/models.md)

## Credits

Author: John ffitch (after Perry Cook)<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 3.47

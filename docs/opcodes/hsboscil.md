<!--
id:hsboscil
category:Signal Generators:Additive Synthesis/Resynthesis
-->
# hsboscil
An oscillator which takes tonality and brightness as arguments, relative to a base frequency.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = hsboscil(kamp, ktone, kbrite, ibasfreq, iwfn, ioctfn \
                    [, ioctcnt] [, iphs])
    ```

=== "Classic"
    ``` csound-orc
    ares hsboscil kamp, ktone, kbrite, ibasfreq, iwfn, ioctfn \
                  [, ioctcnt] [, iphs]
    ```

### Initialization

_ibasfreq_ -- base frequency to which tonality and brighness are relative

_iwfn_ -- function table of the waveform, usually a sine

_ioctfn_ -- function table used for weighting the octaves, usually something like:

```f1 0  1024  -19  1  0.5  270  0.5```

_ioctcnt_ (optional) -- number of octaves used for brightness blending. Must be in the range 2 to 10. Default is 3.

_iphs_ (optional, default=0) -- initial phase of the oscillator. If _iphs_ = -1, initialization is skipped.

### Performance

_kamp_ -- amplitude of note

_ktone_ -- cyclic tonality parameter relative to _ibasfreq_ in logarithmic octave, range 0 to 1, values >&gt; 1 can be used, and are internally reduced to _frac_(_ktone_).

_kbrite_ -- brightness parameter relative to _ibasfreq_, achieved by weighting _ioctcnt_ octaves. It is scaled in such a way, that a value of 0 corresponds to the orignal value of _ibasfreq_, 1 corresponds to one octave above _ibasfreq_, -2 corresponds to two octaves below _ibasfreq_, etc. _kbrite_ may be fractional.

_hsboscil_ takes tonality and brightness as arguments, relative to a base frequency (_ibasfreq_). Tonality is a cyclic parameter in the logarithmic octave, brightness is realized by mixing multiple weighted octaves. It is useful when tone space is understood in a concept of polar coordinates.

Making _ktone_ a line, and _kbrite_ a constant, produces Risset's glissando.

Oscillator table _iwfn_ is always read interpolated. Performance time requires about _ioctcnt_ * _oscili_.

## Examples

Here is an example of the hsboscil opcode. It uses the file [hsboscil.csd](../examples/hsboscil.csd).

``` csound-orc title="Example of the hsboscil opcode." linenums="1"
--8<-- "examples/hsboscil.csd"
```

Here is an example of the hsboscil opcode in a MIDI instrument. It uses the file [hsboscil_midi.csd](../examples/hsboscil_midi.csd).

``` csound-orc title="Example of the hsboscil opcode in a MIDI instrument." linenums="1"
--8<-- "examples/hsboscil_midi.csd"
```

## See also

[Additive Synthesis/Resynthesis](../siggen/additive.md)

## Credits

Author: Peter Neubäcker<br>
Munich, Germany<br>
August, 1999<br>

New in Csound version 3.58

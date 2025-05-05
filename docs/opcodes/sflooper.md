<!--
id:sflooper
category:Signal Generators:Sample Playback
-->
# sflooper
Plays a SoundFont2 (SF2) sample preset, generating a stereo sound, with user-defined
time-varying crossfade looping.

Similar to _sfplay_. Unlike that opcode, though, it ignores the looping points set in the SF2 file and substitutes them for a user-defined crossfade loop. It is a cross between [sfplay](../opcodes/sfplay.md) and [flooper2](../opcodes/flooper2.md). In order to understand the usage of these opcodes, the user must have some knowledge of the SF2  format, so a brief description of this format can be found in the [SoundFont2 File Format](../siggen/sample.md) section.

## Syntax
=== "Modern"
    ``` csound-orc
    ar1, ar2 = sflooper(ivel, inotenum, kamp, kpitch, ipreindex, kloopstart, \
                        kloopend, kcrossfade [, istart, imode, ifenv, iskip, iflag])
    ```

=== "Classic"
    ``` csound-orc
    ar1, ar2 sflooper ivel, inotenum, kamp, kpitch, ipreindex, kloopstart, \
                      kloopend, kcrossfade [, istart, imode, ifenv, iskip, iflag]
    ```

### Initialization

_ivel_ -- velocity value

_inotenum_ -- MIDI note number value

_ipreindex_ -- preset index

_istart _ -- playback start pos in seconds

_imode _ -- loop modes: 0 forward, 1 backward, 2 back-and-forth [def: 0]

_ifenv _ -- if non-zero, crossfade envelope shape table number. The default, 0, sets the crossfade to linear.

_iskip _ -- if 1, the opcode initialisation is skipped, for tied notes, performance continues from the position in the loop where the previous note stopped. The default, 0, does not skip initialisation

_iflag_ -- flag regarding the behavior of _kpitch_ and _inotenum_

### Performance

_kamp_ -- amplitude scaling

_kpitch_ -- pitch control (transposition ratio, negative values are not allowed) or frequency multiplier, depending by iflag. When iflag = 0, kpitch is a multiplier of a the default frequency, assigned by SF2 preset to the inotenum value. When iflag = 1, kpitch is the absolute frequency of the output sound, in Hz. Default is 0. When iflag = 0, inotenum sets the frequency of the output according to the MIDI note number used, and kpitch is used as a multiplier. When iflag = 1, the frequency of the output, is set directly by kpitch. This allows the user to use any kind of micro-tuning based scales. However, this method is designed to work correctly only with presets tuned to the default equal temperament. Attempts to use this method with a preset already having non-standard tunings, or with drum-kit-based presets, could give unexpected results.

_kloopstart_ -- loop start point (secs). Note that although k-rate, loop parameters such as this are only updated once per loop cycle. If loop start is set beyond the end of the sample, no looping will result.

_kloopend_ -- loop end point (secs), updated once per loop cycle.

_kcrossfade _ -- crossfade length (secs), updated once per loop cycle and limited to loop length.

_sflooper_ plays a preset, generating a stereo sound.

These opcodes only support the sample structure of SF2 files. The modulator structure of the SoundFont2 format is not supported in Csound. Any modulation or processing to the sample data is left to the Csound user, bypassing all restrictions forced by the SF2 standard.

Note: The looping points are set on the root key of every sample that is part of the preset of the soundfont. For instance, a soundfont can have a single sample for the whole keyboard. In that case, sflooper will work like flooper and flooper2, because as the sample is transposed, played back at different rates, the loop will get short or longer. If however the soundfont has a sample for each key, than there will be no transposition and the loop will stay the same length (unless you change kpitch).

## Examples

Here is an example of the sflooper opcode. It uses the file [sflooper.csd](../examples/sflooper.csd).

``` csound-csd title="Example of the sflooper opcode." linenums="1"
--8<-- "examples/sflooper.csd"
```

## See also

[Soundfonts](../siggen/sample.md)

More information on soundfonts is in the Floss Manuals: [https://flossmanual.csound.com/midi/reading-midi-files](https://flossmanual.csound.com/midi/reading-midi-files)

For other information on soundfonts look in the Wikipedia: [http://en.wikipedia.org/wiki/Soundfont](http://en.wikipedia.org/wiki/Soundfont)

## Credits

Author: Victor Lazzarini<br>
August 2007<br>

New in Csound Version 5.07

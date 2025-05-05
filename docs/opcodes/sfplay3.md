<!--
id:sfplay3
category:Signal Generators:Sample Playback
-->
# sfplay3
Plays a SoundFont2 (SF2) sample preset, generating a stereo sound with cubic interpolation.

These opcodes allow management the sample-structure of SF2 files. In order to understand the usage of these opcodes, the user must have some knowledge of the SF2 format, so a brief description of this format can be found in the [SoundFont2 File Format](../siggen/sample.md) section.

## Syntax
=== "Modern"
    ``` csound-orc
    ar1, ar2 = sfplay3(ivel, inotenum, xamp, xfreq, ipreindex [, iflag] \
                       [, ioffset] [, ienv])
    ```

=== "Classic"
    ``` csound-orc
    ar1, ar2 sfplay3 ivel, inotenum, xamp, xfreq, ipreindex [, iflag] \
                     [, ioffset] [, ienv]
    ```

### Initialization

_ivel_ -- velocity value

_inotenum_ -- MIDI note number value

_ipreindex_ -- preset index

_iflag_ (optional) -- flag regarding the behavior of _xfreq_ and _inotenum_

_ioffset_ (optional) -- start playing at offset, in samples.

_ienv_ (optional) -- enables and determines amplitude envelope. 0 = no envelope, 1 = linear attack and decay, 2 = linear attack, exponential decay (see below). Default = 0.

### Performance

_xamp_ -- amplitude correction factor

_xfreq_ -- frequency value or frequency multiplier, depending by _iflag_. When _iflag_ = 0, _xfreq_ is a multiplier of a the default frequency, assigned by SF2 preset to the _inotenum_ value. When _iflag_ = 1, _xfreq_ is the absolute frequency of the output sound, in Hz. Default is 0.

When _iflag_ = 0, _inotenum_ sets the frequency of the output according to the MIDI note number used, and _xfreq_ is used as a multiplier. When _iflag_ = 1, the frequency of the output, is set directly by _xfreq_. This allows the user to use any kind of micro-tuning based scales. However, this method is designed to work correctly only with presets tuned to the default equal temperament. Attempts to use this method with a preset already having non-standard tunings, or with drum-kit-based presets, could give unexpected results.

Adjustment of the amplitude can be done by varying the _xamp_ argument, which acts as a multiplier.

Notice that both _xamp_ and _xfreq_ can use k-rate as well as a-rate signals. Both arguments must use variables of the same rate, or _sfplay3_ will not work correctly. _ipreindex_ must contain the number of a previously assigned preset, or Csound will crash.

The _ioffset_ parameter allows the sound to start from a sample different than the first one. The user should make sure that its value is within the length of the specific sound. Otherwise, Csound will probably crash.

The _ienv_ parameter enables and determines the type of amplitude envelope used. The default value is 0, or no envelope. If _ienv_ is set to 1, the attack and decay portions are linear. If set to 2, the attack is linear and the decay is exponential. The release portion of the envelope has not yet been implemented.

_sfplay3_ plays a preset, generating a stereo sound with cubic interpolation. _ivel_ does not directly affect the amplitude of the output, but informs _sfplay3_ about which sample should be chosen in multi-sample, velocity-split presets.

_sfplay3_ is a cubic-interpolation version of [sfplay](../opcodes/sfplay.md). Difference of sound-quality is noticeable specially in bass-frequency-transposed samples. In high-freq-transposed samples the difference is less noticeable, and I suggest to use linear-interpolation versions, because they are faster.

These opcodes only support the sample structure of SF2 files. The modulator structure of the SoundFont2 format is not supported in Csound. Any modulation or processing to the sample data is left to the Csound user, bypassing all restrictions forced by the SF2 standard.

## Examples

Here is an example of the sfplay3 opcode. It uses the file [sfplay3.csd](../examples/sfplay3.csd).

``` csound-csd title="Example of the sfplay3 opcode." linenums="1"
--8<-- "examples/sfplay3.csd"
```

## See also

[Soundfonts](../siggen/sample.md)

More information on soundfonts is in the Floss Manuals: [https://flossmanual.csound.com/midi/reading-midi-files](https://flossmanual.csound.com/midi/reading-midi-files)

For other information on soundfonts look in the Wikipedia: [http://en.wikipedia.org/wiki/Soundfont](http://en.wikipedia.org/wiki/Soundfont)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
May 2000<br>

New in Csound Version 4.07

New optional parameter _ienv_ in version 5.09

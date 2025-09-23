<!--
id:mixer
category:Utilities
-->
# mixer
Mixes together a number of soundfiles, starting at different times and with individual channel selection from the input files.

## Syntax
```
mixer [OPTIONS ... ] infile [[OPTIONS... ] infile] ...
```

### Initialization

Flags:

* -_A_ = Generate an AIFF output file.
* -_W_ = Generate an WAV output file.
* -_h_ = Generate an output file with no header.
* -_c_ = Generate 8-bit signed_char sound samples.
* -_a_ = Generate alaw sound samples.
* -_u_ = Generate ulaw sound samples.
* -_s_ = Generate short integer sound samples.
* -_l_ = Generate long (32 bit) integer sound samples.
* -_f_ = Generate floating point samples.
* -_F arg_ = Specifies the gain to be applied to the following input file.  If arg is a floating point number that gain is applied uniformly to the input.  Alternatively it could be a file name which specifies a breakpoint file for varying the gain for different periods.
* -_S integer_ = Indicate at which sample to start to mix in the next input file.
* -_T fpnum_ = Indicate at which time (in seconds) to start to mix in the next input file.
* -_1_ = Mix in channel 1 from next sound file.
* -_2_ = Mix in channel 2 from next sound file.
* -_3_ = Mix in channel 3 from next sound file.
* -_4_ = Mix in channel 4 from next sound file.
* -_^ intx inty_ = Mix in channel x from next sound file as channel y in the output.
* -_v_ = Verbose mode.
* -_R_ = Continually rewrite the header while writing soundfile (WAV/AIFF).
* -_H integer_ = Show a "heart-beat" to indicate progress, in style 1, 2 or 3.
* -_N_ = Alert call (usually ringing the bell) when finished.
* -_o fname_ = output file name (default: test.wav)

## Examples

The default values are

```
mixer -s -otest -F 1.0 -S 0
```

For example

```
mixer -F 0.96 in1.wav -S 300 -2 in2.aiff -S 300 -^4 1 in3.wav -o out.wav
```

This creates a new sound file with a constant gain of 0.96 from in1.wav with the second channel of in2.aiff mixed in after 300 samples and channel 4 of in3.wav outpout as channel 1 after 300 samples.

## Credits

Author: John ffitch

1994

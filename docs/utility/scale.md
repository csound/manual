<!--
id:scaleutility
category:Utilities
-->
# scale
Scale the amplitude of a sound file.

Takes a sound file and scales it by applying a gain, either constant or variable.  The scale can be specified as a multiplier, a maximum or a percentage of 0db.

## Syntax
```
scale [OPTIONS ... ] infile
```

### Initialization

Flags:

* -_A_ = Generate an AIFF outout file.
* -_W_ = Generate an WAV outout file.
* -_h_ = Generate an outout file with no header.
* -_c_ = Generate 8-bit signed_char sound samples.
* -_a_ = Generate alaw sound samples.
* -_u_ = Generate ulaw sound samples.
* -_s_ = Generate short integer sound samples.
* -_l_ = Generate long (32 bit) integer sound samples.
* -_f_ = Generate floating point samples.
* -_F arg_ = Specifies the gain to be applied.  If arg is a floating point number that gain is applied uniformly to the input.  Alternatively it could be a file name which specifies a breakpoint file for varying the gain for different periods.
* -_M fpnum_ = Scales the input so the maximum absolute displacement is the value given.
* -_P fpnum_ = Scales the input so the maximum absolute displacement is the pencentage given of 0db.
* -_R_ = Continually rewrite the header while writing soundfile (WAV/AIFF).
* -_H integer_ = Show a "heart-beat" to indicate progress, in style 1, 2 or 3.
* -_N_ = Alert call (usually ringing the bell) when finished.
* -_o fname_ = output file name (default: test.wav)

## Examples

```
scale -s -W -F 0.96 -o out.wav sound.wav
```

This creates a new sound file with a constant gain of 0.96.  It is particularly useful if the input file is in floating point format.

## Credits

Author: John ffitch

1994

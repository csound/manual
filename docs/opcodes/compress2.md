<!--
id:compress2
category:Signal Modifiers:Amplitude Modifiers
-->
# compress2
Compress, limit, expand, duck or gate an audio signal.

This unit functions as an audio compressor, limiter, expander, or noise gate, using either soft-knee or hard-knee mapping, and with dynamically variable performance characteristics.  It takes two audio input signals, _aasig_ and _acsig_, the first of which is modified by a running analysis of the second. Both signals can be the same, or the first can be modified by a different controlling signal.

_compress2_ first examines the controlling _acsig_ by performing envelope detection.  This is directed by two control values _katt_ and _krel_, defining the attack and release time constants (in seconds) of the detector.  The detector rides the peaks (not the RMS) of the control signal. Typical values are .01 and .1, the latter usually being similar to _ilook_.

The running envelope is next converted to decibels, then passed through a mapping function to determine what compresser action (if any) should be taken.  The mapping function is defined by four decibel control values.  These are given as negative values, where 0 db corresponds to an amplitude of 0dbfs.

## Syntax
=== "Modern"
    ``` csound-orc
    ar = compress2(aasig, acsig, kthresh, kloknee, khiknee, kratio, katt, krel, ilook)
    ```

=== "Classic"
    ``` csound-orc
    ar compress2 aasig, acsig, kthresh, kloknee, khiknee, kratio, katt, krel, ilook
    ```

### Initialization

_ilook_ -- lookahead time in seconds, by which an internal envelope release can sense what is coming.  This induces a delay between input and output, but a small amount of lookahead improves the performance of the envelope detector.  Typical value is .05 seconds, sufficient to sense the peaks of the lowest frequency in _acsig_.

### Performance

_kthresh_ -- sets the lowest decibel level that will be allowed through. This is a threshold of a separate noise gate, normally set at -90 dB or less, but if higher the threshold will begin removing low-level signal energy such as background noise.

_kloknee_, _khiknee_ -- decibel break-points denoting where compression or expansion will begin. These set the boundaries of a soft-knee curve joining the low-amplitude 1:1 line and the higher-amplitude compression ratio line.  Typical values are -52 and -30 dB. If the two breakpoints are equal, a hard-knee (angled) map will result.

_kratio_ -- ratio of compression when the signal level is above the knee. The value 2 will advance the output just one decibel for every input gain of two;  3 will advance just one in three; 20 just one in twenty, etc. Inverse ratios will cause signal expansion:  .5 gives two for one, .25 four for one, etc.  The value 1 will result in no change.

The actions of compress2 will depend on the parameter settings given.  A hard-knee compressor-limiter, for instance, is obtained from a near-zero attack time, equal-value break-points, and a very high ratio (say 100).  A noise-gate plus expander is obtained from some positive threshold, and a fractional ratio above the knee.  A voice-activated music compressor (ducker) will result from feeding the music into _aasig_ and the speech into _acsig_.  A voice de-esser will result from feeding the voice into both, with the _acsig_ version being preceded by a band-pass filter that emphasizes the sibilants. Each application will require some experimentation to find the best parameter settings;  these have been made k-variable to make this practical.

## Examples

=== "Modern"
    Here is an example of the compress2 opcode. It uses the file [compress2-modern.csd](../examples/compress2-modern.csd).
    ``` csound-csd title="Example of the compress2 opcode." linenums="1"
    --8<-- "examples/compress2-modern.csd"
    ```

=== "Classic"
    Here is an example of the compress2 opcode. It uses the file [compress2.csd](../examples/compress2.csd).
    ``` csound-csd title="Example of the compress2 opcode." linenums="1"
    --8<-- "examples/compress2.csd"
    ```

## See also

[Amplitude Modifiers and Dynamic processing](../sigmod/ampmod.md)

## Credits

Written by John ffitch after Barry L. Vercoe from Extended but with more common dB values, new in version 6.07.

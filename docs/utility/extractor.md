<!--
id:extractor
category:Utilities
-->
# extractor
Extract a section of audio, by time or sample, from an existing sound file.

## Syntax
```
extractor [OPTIONS ... ] infile
```

### Initialization

Flags:

* -_S integer_ = Start the extract at the given sample number.
* -_Z integer_ = End the extract at the given sample number.
* -_Q integer_ = Extract given number of samples.
* -_T fpnum_ = Start the extract at the given time in seconds.
* -_E fpnum_ = End the extract at the given time in seconds.
* -_D fpnum_ = Extract given time in seconds.
* -_v_ = Verbose mode.
* -_R_ = Continually rewrite the header while writing soundfile (WAV/AIFF).
* -_H integer_ = Show a "heart-beat" to indicate progress, in style 1, 2 or 3.
* -_N_ = Alert call (usually ringing the bell) when finished.
* -_v_ = Verbose mode.
* -_o fname_ = output file name (default: test.wav)

## Examples

The default values are

```
extractor -S 0 -Z end-of-file -otest
```

For example

```
extractor -S 10234 -D 2.13 in.aiff -o out.wav
```

This creates a new sound file taken from sample 10234 and lasting 2.13 seconds.

Here is a complete example of the extractor utility. It uses the file [extractor.csd](../examples/extractor.csd).

``` csound-csd title="Example of the extractor utility." linenums="1"
--8<-- "examples/extractor.csd"
```

> :memo: **NOTE**
>
> This utility was added before we had waveform editors and DAWs.

## Credits

Author: John ffitch

1994

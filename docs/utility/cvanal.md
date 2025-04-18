<!--
id:cvanal
category:Utilities
-->
# cvanal
Converts a soundfile into a single Fourier transform frame.

Impulse Response Fourier Analysis for [convolve](../opcodes/convolve.md) operator

## Syntax
```
csound -U cvanal [flags] infilename outfilename
cvanal [flags] infilename outfilename
```

### Initialization

_cvanal_ -- converts a soundfile into a single Fourier transform frame. The output file can be used by the _convolve_ operator to perform Fast Convolution between an input signal and the original impulse response. Analysis is conditioned by the flags below. A space is optional between the flag and its argument.

_-s rate_ -- sampling rate of the audio input file. This will over-ride the srate of the soundfile header, which otherwise applies. If neither is present, the default is 10000.

_-c channel_ -- channel number sought. If omitted, the default is to process all channels. If a value is given, only the selected channel will be processed.

_-b begin_ -- beginning time (in seconds) of the audio segment to be analyzed. The default is 0.0

_-d duration_ -- duration (in seconds) of the audio segment to be analyzed. The default of 0.0 means to the end of the file.

_-X_ -- write machine independent format analysis file.

### Files

The output file has a special _convolve_ header, containing details of the source audio file. The analysis data is stored as &#8220;float&#8221;, in rectangular (real/imaginary) form.

> :memo: **Note**
>
> The analysis file is _not_ system independent! Ensure that the original impulse recording/data is retained. If/when required, the analysis file can be recreated.

## Examples

```
cvanal asound cvfile
```

will analyze the soundfile "asound" to produce the file "cvfile" for the use with [convolve](../opcodes/convolve.md).

To use data that is not already contained in a soundfile, a soundfile converter that accepts text files may be used to create a standard audio file, e.g., the .DAT format for SOX. This is useful for implementing FIR filters.

Here is an example of the cvanal utility. It uses the file [cvanal.csd](../examples/cvanal.csd).

``` csound-csd title="Example of the cvanal utility." linenums="1"
--8<-- "examples/cvanal.csd"
```

## Credits

Author: Greg Sullivan

Based on algorithm given in _Elements Of Computer Music_, by F. Richard Moore.

<!--
id:pvanal
category:Utilities
-->
# pvanal
Converts a soundfile into a series of short-time Fourier transform frames.

Fourier analysis for the Csound [pvoc](../opcodes/pvoc.md) generator

## Syntax
```
csound -U pvanal [flags] infilename outfilename
pvanal [flags] infilename outfilename
```

### Pvanal extension to create a PVOC-EX file.

The standard Csound utility program pvanal has been extended to enable a PVOC-EX format file to be created, using the existing interface. To create a PVOC-EX file, the file name must be given the required extension, &#8220;.pvx&#8221;, e.g &#8220;test.pvx&#8221;. The requirement for the FFT size to be a power of two is here relaxed, and any positive value is accepted; odd numbers are rounded up internally. However, power-of-two sizes are still to be preferred for all normal applications.

The channel select flags are ignored, and all source channels will be analysed and written to the output file, up to a compiler-set limit of eight channels. The analysis window size (iwinsize) is set internally to double the FFT size.

### Initialization

_pvanal_ converts a soundfile into a series of short-time Fourier transform (STFT) frames at regular timepoints (a frequency-domain representation). The output file can be used by [pvoc](../opcodes/pvoc.md) to generate audio fragments based on the original sample, with timescales and pitches arbitrarily and dynamically modified. Analysis is conditioned by the flags below. A space is optional between the flag and its argument.

_-s srate_ -- sampling rate of the audio input file. This will over-ride the srate of the soundfile header, which otherwise applies. If neither is present, the default is 10000.

_-c channel_ -- channel number sought. The default is 1.

_-b begin_ -- beginning time (in seconds) of the audio segment to be analyzed. The default is 0.0

_-d duration_ -- duration (in seconds) of the audio segment to be analyzed. The default of 0.0 means to the end of the file.

_-n frmsiz_ -- STFT frame size, the number of samples in each Fourier analysis frame. Must be a power of two, in the range 16 to 16384. For clean results, a frame must be larger than the longest pitch period of the sample. However, very long frames result in temporal "smearing" or reverberation. The bandwidth of each STFT bin is determined by sampling rate / frame size. The default framesize is the smallest power of two that corresponds to more than 20 milliseconds of the source (e.g. 256 points at 10 kHz sampling, giving a 25.6 ms frame).

_-w windfact_ -- Window overlap factor. This controls the number of Fourier transform frames per second. Csound's [pvoc](../opcodes/pvoc.md) will interpolate between frames, but too few frames will generate audible distortion; too many frames will result in a huge analysis file. A good compromise for windfact is 4, meaning that each input point occurs in 4 output windows, or conversely that the offset between successive STFT frames is framesize/4. The default value is 4. Do not use this flag with _-h_.

_-h hopsize_ -- STFT frame offset. Converse of above, specifying the increment in samples between successive frames of analysis (see also [lpanal](../utility/lpanal.md)). Do not use with _-w_.

_-H_ -- Use a Hamming window instead of the default von Hann window.

_-K_ -- Use a Kaiser window instead of the default von Hann window.  The Kaiser parameter default is 6.8, but can be set with the _-B_ option.

_-B beta_ -- Set the beta parameter for any Kaiser window used to the floating point value beta.

### Files

The output file has a special _pvoc_ header containing details of the source audio file, the analysis frame rate and overlap. Frames of analysis data are stored as float, with the magnitude and &#8220;frequency&#8221; (in Hz) for the first N/2 + 1 Fourier bins of each frame in turn. &#8220;Frequency&#8221; encodes the phase increment in such a way that for strong harmonics it gives a good indication of the true frequency. For low amplitude or rapidly moving harmonics it is less meaningful.

### Diagnostics

Prints total number of frames, and frames completed every 20th frame.

## Examples

```
pvanal asound pvfile
```

will analyze the soundfile "asound" using the default frmsiz and windfact to produce the file "pvfile" suitable for use with pvoc.

Here is an example of the pvanal utility. It uses the file [pvanal.csd](../examples/pvanal.csd).

``` csound-csd title="Example of the pvanal utility." linenums="1"
--8<-- "examples/pvanal.csd"
```

## Credits

Author: Dan Ellis

MIT Media Lab

Cambridge, Massachussetts

1990

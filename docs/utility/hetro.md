<!--
id:hetro
category:Utilities
-->
# hetro
Decomposes an input soundfile into component sinusoids.

Hetrodyne filter analysis for the Csound [adsyn](../opcodes/adsyn.md) generator.

## Syntax
```
csound -U hetro [flags] infilename outfilename
hetro [flags] infilename outfilename
```

### Initialization

_hetro_ takes an input soundfile, decomposes it into component sinusoids, and outputs a description of the components in the form of breakpoint amplitude and frequency tracks. Analysis is conditioned by the control flags below. A space is optional between flag and value.

_-s srate_ -- sampling rate of the audio input file. This will over-ride the srate of the soundfile header, which otherwise applies. If neither is present, the default is 10000. Note that for _adsyn_ synthesis the srate of the source file and the generating orchestra need not be the same.

_-c channel_ -- channel number sought. The default is 1.

_-b begin_ -- beginning time (in seconds) of the audio segment to be analyzed. The default is 0.0

_-d duration_ -- duration (in seconds) of the audio segment to be analyzed. The default of 0.0 means to the end of the file. Maximum length is 32.766 seconds.

_-f begfreq_ -- estimated starting frequency of the fundamental, necessary to initialize the filter analysis. The default is 100 (cps).

_-h partials_ -- number of harmonic partials sought in the audio file. Default is 10, maximum is a function of memory available.

_-M maxamp_ -- maximum amplitude summed across all concurrent tracks. The default is 32767.

_-m minamp_ -- amplitude threshold below which a single pair of amplitude/frequency tracks is considered dormant and will not contribute to output summation. Typical values: 128 (48 db down from full scale), 64 (54 db down), 32 (60 db down), 0 (no thresholding). The default threshold is 64 (54 db down).

_-n brkpts_ -- initial number of analysis breakpoints in each amplitude and frequency track, prior to thresholding (_-m_) and linear breakpoint consolidation. The initial points are spread evenly over the duration. The default is 256.

_-l cutfreq_ -- substitute a 3rd order Butterworth low-pass filter with cutoff frequency _cutfreq_ (in Hz), in place of the default averaging comb filter. The default is 0 (don't use).

### Performance

As of Csound 4.08, _hetro_ can write SDIF output files if the output file name ends with ".sdif" or ".SDIF". See the [sdif2ad utility](../utility/sdif2ad.md) for more information about the Csound's SDIF support.

#### File Format

The output file contains time-sequenced amplitude and frequency values for each partial of an additive complex audio source. The information is in the form of breakpoints (time, value, time, value, ....) using 16-bit integers in the range 0 - 32767. Time is given in milliseconds, and frequency in Hertz (cps). The breakpoint data is exclusively non-negative, and the values -1 and -2 uniquely signify the start of new amplitude and frequency tracks. A track is terminated by the value 32767. Before being written out, each track is data-reduced by amplitude thresholding and linear breakpoint consolidation.

A component partial is defined by two breakpoint sets: an amplitude set, and a frequency set. Within a composite file these sets may appear in any order (amplitude, frequency, amplitude ....; or amplitude, amplitude..., then frequency, frequency,...). During [adsyn](../opcodes/adsyn.md) resynthesis the sets are automatically paired (amplitude, frequency) from the order in which they were found. There should be an equal number of each.

A legal _adsyn_ control file could have following format:

```
-1 time1 value1 ... timeK valueK 32767 ; amplitude breakpoints for partial 1
-2 time1 value1 ... timeL valueL 32767 ; frequency breakpoints for partial 1
-1 time1 value1 ... timeM valueM 32767 ; amplitude breakpoints for partial 2
-2 time1 value1 ... timeN valueN 32767 ; frequency breakpoints for partial 2
-2 time1 value1 ..........
-2 time1 value1 ..........             ; pairable tracks for partials 3 and 4
-1 time1 value1 ..........
-1 time2 value1 ..........
```

## Examples

```
hetro -s44100 -b.5 -d2.5 -h16 -M24000 audiofile.test adsynfile7
```

This will analyze 2.5 seconds of channel 1 of a file "audiofile.test", recorded at 44.1 kHz, beginning .5 seconds from the start, and place the result in a file "adsynfile7". We request just the first 16 harmonics of the sound, with 256 initial breakpoint values per amplitude or frequency track, and a peak summation amplitude of 24000. The fundamental is estimated to begin at 100 Hz. Amplitude thresholding is at 54 db down.

The Butterworth LPF is not enabled.

Here is an example of the hetro utility. It uses the file [hetro.csd](../examples/hetro.csd).

``` csound-csd title="Example of the hetro utility." linenums="1"
--8<-- "examples/hetro.csd"
```

## Credits

Author: Tom Sullivan<br>
1992<br>
Author: John ffitch<br>
1994<br>
Author: Richard Dobson<br>
2000<br>

October 2002. Thanks to Rasmus Ekman, added a note about the SDIF format.

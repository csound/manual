<!--
id:dnoise
category:Utilities
-->
# dnoise
Reduces noise in a file.

This is a noise reduction scheme using frequency-domain noise-gating.

## Syntax
```
dnoise [flags] -i noise_ref_file -o output_soundfile soundfile_format input_soundfile
```

### Initialization

Dnoise specific flags:

* _(no flag)_ input soundfile to be denoised
* _-i fname_ input reference noise soundfile
* _-o fname_ output soundfile
* _-N fnum_ # of bandpass filters (default: 1024)
* _-w fovlp_ filter overlap factor: {0,1,(2),3} DON'T USE _-w_ AND _-M_
* _-M awlen_ analysis window length (default: N-1 unless _-w_ is specified)
* _-L swlen_ synthesis window length (default: M)
* _-D dfac_ decimation factor (default: M/8)
* _-b btim_ begin time in noise reference soundfile (default: 0)
* _-B smpst_ starting sample in noise reference soundfile (default: 0)
* _-e etim_ end time in noise reference soundfile (default: end of file)
* _-E smpend_ final sample in noise reference soundfile (default: end of file)
* _-t thr_ threshold above noise reference in dB (default: 30)
* _-S gfact_ sharpness of noise-gate turnoff, range: 1 to 5 (default: 1)
* _-n numfrm_ number of FFT frames to average over (default: 5)
* _-m mingain_ minimum gain of noise-gate when off in dB (default: -40)

Soundfile format options:

* _-A_ AIFF format output
* _-W_ WAV format output
* _-J_ IRCAM format output
* _-h_ skip soundfile header (not valid for AIFF/WAV output)
* _-8_ 8-bit unsigned char sound samples
* _-c_ 8-bit signed_char sound samples
* _-a_ alaw sound samples
* _-u_ ulaw sound samples
* _-s_ short_int sound samples
* _-l_ long_int sound samples
* _-f_ float sound samples. Floats also supported for WAV files. (New in Csound 3.47.)

Additional options:

* _-R_ verbose - print status info
* _-H [N]_ print a heartbeat character at each soundfile write.
* _-- fname_ output to log file fname
* _-V_ verbose - print status info

    > :memo: **Note**
    >
    > DNOISE also looks at the environment variable SFOUTYP to determine soundfile output format.
    >
    > The -i flag is used for a reference noise file (normally created from a short section of the denoised file, where only noise is audible). The input soundfile to be denoised can be given anywhere on the command line, without a flag.

### Performance

This is a noise reduction scheme using frequency-domain noise-gating.  This should work best in the case of high signal-to-noise with hiss-type noise.

The algorithm is that suggested by Moorer &amp; Berger in &#8220;Linear-Phase Bandsplitting: Theory and Applications&#8221; presented at the 76th Convention 1984 October 8-11 New York of the Audio Engineering Society (preprint &num;2132) except that it uses the Weighted Overlap-Add formulation for short-time Fourier analysis-synthesis in place of the recursive formulation suggested by Moorer &amp; Berger.  The gain in each frequency bin is computed independently according to

```
gain = g0 + (1-g0) * [avg / (avg + th*th*nref)] ^ sh
```

where _avg_ and _nref_ are the mean squared signal and noise respectively for the bin in question.  (This is slightly different than in Moorer &amp; Berger.)

The critical parameters _th_ and _g0_ are specified in dB and internally converted to decimal values.  The _nref_ values are computed at the start of the program on the basis of a noise_soundfile (specified in the command line) which contains noise without signal.

The _avg_ values are computed over a rectangular window of m FFT frames looking both ahead and behind the current time.  This corresponds to a temporal extent of m*D/R (which is typically (m*N/8)/R).  The default settings&namerasmus; of N, M, and D should be appropriate for most uses.  A higher sample rate than 16 Khz might indicate a higher N.

## Examples

Here is an example of the dnoise utility. It uses the file [dnoise.csd](../examples/dnoise.csd), [MathewsNoise.wav](../examples/MathewsNoise.wav) and [MathewsN.wav](../examples/MathewsN.wav).

``` csound-csd title="Example of the dnoise utility." linenums="1"
--8<-- "examples/dnoise.csd"
```

## Credits

Author: Mark Dolson<br>
August 26, 1989

Author: John ffitch<br>
December 30, 2000

Updated by Rasmus Ekman on March 11, 2002.

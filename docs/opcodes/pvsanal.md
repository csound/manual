<!--
id:pvsanal
category:Spectral Processing:Streaming
-->
# pvsanal
Generate an fsig from a mono audio source ain, using phase vocoder overlap-add analysis.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsanal(ain, ifftsize, ioverlap, iwinsize, iwintype [, iformat] [, iinit])
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsanal ain, ifftsize, ioverlap, iwinsize, iwintype [, iformat] [, iinit]
    ```

### Initialization

_ifftsize_ -- FFT size in samples for overlap-add analysis. Use a size greater than 32; odd sizes are rounded up to the next even number. Powers of two are efficient but not required. The output has _ifftsize/2 + 1_ bins, from DC to Nyquist. Bin spacing is _sr/ifftsize_: for a size of 1024 at 44100 Hz, it is about 43.07 Hz. The estimated frequencies can differ from the bin centres, so neighbouring bins can follow the same partial and low bins can report negative frequencies. Sliding analysis uses _iwinsize_ instead (see below).

As a rule, the only reason to use a non power-of-two value for _ifftsize_ would be to match the known fundamental frequency of a strongly pitched source. Values with many small factors can be almost as efficient as power-of-two sizes; for  example: 384, for a source pitched at around low A=110Hz.

_ioverlap_ -- The distance in samples (&#8220;hop size&#8221;) between overlapping analysis frames. A common choice is _ifftsize/4_, e.g. 256 for the example above. In overlap-add mode it must not exceed _ifftsize/2_. _ioverlap_ determines the underlying analysis rate, as _sr/ioverlap_. _ioverlap_ does not require to be a simple factor of _ifftsize_; for example a value of 160 would be legal. The choice of _ioverlap_ may be dictated by the degree of pitch modification applied to the _fsig_, if any. As a rule of thumb, the more extreme the pitch shift, the higher the analysis rate needs to be, and hence the smaller the value for _ioverlap_. A higher analysis rate can also be advantageous with broadband transient sounds, such as drums (where a small analysis window gives less smearing, but more frequency-related errors).

Distinct fsigs may run at different analysis rates, even in the same instrument. [F-signal assignment](assign.md) gives the destination the source's properties at initialization; it does not convert between analysis rates. Sources assigned to the same destination during performance must have matching properties, including _ioverlap_.

_iwinsize_ -- The size in samples of the analysis window filter (as set by _iwintype_). For overlap-add analysis, use at least _ifftsize_; larger windows can also be useful. Though other proportions are permitted, it is recommended that _iwinsize_ always be an integral multiple of _ifftsize_, e.g. 2048 for the example above. Internally, the analysis window (Hamming, von Hann) is multiplied by a sinc function, so that amplitudes are zero at the boundaries between frames. The larger analysis window size has been found to be especially important for oscillator bank resynthesis (e.g. using _pvsadsyn_), as it has the effect of increasing the frequency resolution of the analysis, and hence the accuracy of the resynthesis. As noted above, _iwinsize_ determines the overall latency of the analysis/resynthesis system. In many cases, and especially in the absence of pitch modifications, it will be found that setting _iwinsize=ifftsize_ works very well, and offers the lowest latency.

_iwintype_ -- The shape of the analysis window. Hamming (0) and von Hann (1) work in both analysis modes. Overlap-add analysis also supports Kaiser (2), or a negative function table number to use a custom window from that table.

Sliding analysis supports these additional windows:

* 4 = Blackman
* 5 = exact Blackman
* 6 = Nuttall C3
* 7 = three-term Blackman–Harris
* 8 = minimum Blackman–Harris
* 9 = rectangular

Kaiser and custom table windows are not supported in sliding mode. The window type is stored with the other properties of the stream (see [pvsinfo](../opcodes/pvsinfo.md)).

_iformat_ -- (optional) The analysis format. Currently only one format is implemented by this opcode:

* 0 =  amplitude + frequency

    This is the classic phase vocoder format; easy to process, and a natural format for oscillator-bank resynthesis. It would be very easy (tempting, one might say) to treat an fsig frame not purely as a phase vocoder frame but as a generic additive synthesis frame. It is indeed possible to use an fsig this way, but it is important to bear in mind that the two are not, strictly speaking, directly equivalent.

    Other important formats (supported by PVOC-EX) are:

* 1 =  amplitude + phase
* 2 =  complex (real + imaginary)

iformat is provided in case it proves useful later to add support for these other formats. Formats 0 and 1 are very closely related (as the phase is &#8220;wrapped&#8221; in both cases - it is a trivial matter to convert from one to the other), but the complex format might warrant a second explicit signal type (a &#8220;csig&#8221;) specifically for convolution-based processes, and other processes where the full complement of arithmetic operators may be useful.

_iinit_ -- (optional) Skip reinitialization. This is not currently implemented for any of these opcodes, and it remains to be seen if it is even practical.

### Sliding analysis

When _ioverlap_ is smaller than _ksmps_, or is at most 10 samples, `pvsanal` uses a sliding DFT. It produces a spectrum for every audio sample, so the output hop size is 1.

In this mode, _iwinsize_ sets both the window length and the transform size; _ifftsize_ is ignored. Use a positive whole number of samples. Odd sizes are rounded up to the next even number, with a minimum transform size of 2. The windows are periodic, and the output contains _iwinsize/2 + 1_ bins after rounding.

Sliding analysis uses unnormalized DFT magnitudes. For example, a constant signal of amplitude 1 has DC magnitude _iwinsize/2_ with a Hann window. These magnitudes differ from the normalized output of overlap-add analysis.

> :warning: **Warning**
>
> It is unsafe to use the same f-variable for both input and output of pvs opcodes. Using the same one might lead to undefined behavior on some opcodes. Use a different one on the left and right sides of the opcode.

### Note boundaries

With sample-accurate scheduling, sliding analysis sets every bin to zero for samples outside the note within its first and last control blocks. It analyzes only the active input samples.

## Examples

Here is an example of the pvsanal opcode. It uses the file [pvsanal.csd](../examples/pvsanal.csd).

``` csound-csd title="Example of the pvsanal opcode." linenums="1"
--8<-- "examples/pvsanal.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Richard Dobson<br>
August 2001 <br>

New in version 4.13

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

_ifftsize_ -- The FFT size in samples. Need not be a power of two (though these are especially efficient), but must be even. Odd numbers are rounded up internally. _ifftsize_ determines the number of analysis bins in _fsig_, as _ifftsize/2 + 1_. For example, where _ifftsize_ = 1024, _fsig_ will contain 513 analysis bins, ordered linearly from the fundamental to Nyquist. The fundamental of analysis (which in principle gives the lowest resolvable frequency) is determined as _sr/ifftsize_. Thus, for the example just given and assuming _sr_ = 44100, the fundamental of analysis is 43.07Hz. In practice, due to the phase-preserving nature of the phase vocoder, the frequency of any bin can deviate bilaterally, so that DC components are recorded. Given a strongly pitched signal, frequencies in adjacent bins can bunch very closely together, around partials in the source, and the lowest bins may even have negative frequencies.

As a rule, the only reason to use a non power-of-two value for _ifftsize_ would be to match the known fundamental frequency of a strongly pitched source. Values with many small factors can be almost as efficient as power-of-two sizes; for  example: 384, for a source pitched at around low A=110Hz.

_ioverlap_ -- The distance in samples (&#8220;hop size&#8221;) between overlapping analysis frames. As a rule, this needs to be at least _ifftsize/4_, e.g. 256 for the example above. _ioverlap_ determines the underlying analysis rate, as _sr/ioverlap_. _ioverlap_ does not require to be a simple factor of _ifftsize_; for example a value of 160 would be legal. The choice of _ioverlap_ may be dictated by the degree of pitch modification applied to the _fsig_, if any. As a rule of thumb, the more extreme the pitch shift, the higher the analysis rate needs to be, and hence the smaller the value for _ioverlap_. A higher analysis rate can also be advantageous with broadband transient sounds, such as drums (where a small analysis window gives less smearing, but more frequency-related errors).

Note that it is possible, and reasonable, to have distinct fsigs in an orchestra (even in the same instrument), running at different analysis rates. Interactions between such fsigs is currently unsupported,  and the fsig assignment opcode does not allow copying between fsigs with different properties, even if the only difference is in _ioverlap_. However, this is not a closed issue, as it is possible in theory to achieve crude rate conversion (especially with regard to in-memory analysis files) in ways analogous to time-domain techniques.

_iwinsize_ -- The size in samples of the analysis window filter (as set by _iwintype_). This must be at least _ifftsize_, and can usefully be larger. Though other proportions are permitted, it is recommended that _iwinsize_ always be an integral multiple of _ifftsize_, e.g. 2048 for the example above. Internally, the analysis window (Hamming, von Hann) is multiplied by a sinc function, so that amplitudes are zero at the boundaries between frames. The larger analysis window size has been found to be especially important for oscillator bank resynthesis (e.g. using _pvsadsyn_), as it has the effect of increasing the frequency resolution of the analysis, and hence the accuracy of the resynthesis. As noted above, _iwinsize_ determines the overall latency of the analysis/resynthesis system. In many cases, and especially in the absence of pitch modifications, it will be found that setting _iwinsize=ifftsize_ works very well, and offers the lowest latency.

_iwintype_ -- The shape of the analysis
window. Currently three choices computed windows implemented:

* 0 = Hamming window
* 1 = von Hann window
* 3 = Kaiser window (not in sliding form)

These are also supported by the PVOC-EX file format.  The window type is stored as an internal attribute of the fsig, together with the other parameters (see [pvsinfo](../opcodes/pvsinfo.md)). Other types may be implemented later on; if the value of wintype is strictly negative then the absolute value is used as the number of an f-table which must pre-exist. A significant issue here is the common constraint of f-tables to power-of-two sizes, so this method does not offer a complete solution.  Most users will find the Hamming window meets all normal needs, and can be regarded as the default choice.

_iformat_ -- (optional) The analysis format. Currently only one format is implemented by this opcode:

* 0 =  amplitude + frequency

    This is the classic phase vocoder format; easy to process, and a natural format for oscillator-bank resynthesis. It would be very easy (tempting, one might say) to treat an fsig frame not purely as a phase vocoder frame but as a generic additive synthesis frame. It is indeed possible to use an fsig this way, but it is important to bear in mind that the two are not, strictly speaking, directly equivalent.

    Other important formats (supported by PVOC-EX) are:

* 1 =  amplitude + phase
* 2 =  complex (real + imaginary)

iformat is provided in case it proves useful later to add support for these other formats. Formats 0 and 1 are very closely related (as the phase is &#8220;wrapped&#8221; in both cases - it is a trivial matter to convert from one to the other), but the complex format might warrant a second explicit signal type (a &#8220;csig&#8221;) specifically for convolution-based processes, and other processes where the full complement of arithmetic operators may be useful.

_iinit_ -- (optional) Skip reinitialization. This is not currently implemented for any of these opcodes, and it remains to be seen if it is even practical.

> :warning: **Warning**
>
> It is unsafe to use the same f-variable for both input and output of pvs opcodes. Using the same one might lead to undefined behavior on some opcodes. Use a different one on the left and right sides of the opcode.

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

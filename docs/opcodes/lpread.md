<!--
id:lpread
category:Spectral Processing:LPC
-->
# lpread
Reads a control file of time-ordered information frames.

## Syntax
=== "Modern"
    ``` csound-orc
    krmsr, krmso, kerr, kcps = lpread(ktimpnt, ifilcod [, inpoles] [, ifrmrate])
    ```

=== "Classic"
    ``` csound-orc
    krmsr, krmso, kerr, kcps lpread ktimpnt, ifilcod [, inpoles] [, ifrmrate]
    ```

### Initialization

_ifilcod_ -- integer or character-string denoting a control-file (reflection coefficients and four parameter values) derived from n-pole linear predictive spectral analysis of a source audio signal. An integer denotes the suffix of a file _lp.m_; a character-string (in double quotes) gives a filename, optionally a full pathname. If not fullpath, the file is sought first in the current directory, then in that of the environment variable SADIR (if defined). Memory usage depends on the size of the file, which is held entirely in memory during computation but shared by multiple calls (see also _adsyn_, [pvoc](../opcodes/pvoc.md)).

_inpoles_ (optional, default=0) -- number of poles in the lpc analysis. It is required only when the control file does not have a header; it is ignored when a header is detected.

_ifrmrate_ (optional, default=0) -- frame rate per second in the lpc analysis. It is required only when the control file does not have a header; it is ignored when a header is detected.

### Performance

_lpread_ accesses a control file of time-ordered information frames, each containing n-pole filter coefficients derived from linear predictive analysis of a source signal at fixed time intervals (e.g. 1/100 of a second), plus four parameter values:

_krmsr_ -- root-mean-square (rms) of the residual of analysis

_krmso_ -- rms of the original signal

_kerr_ -- the normalized error signal

_kcps_ -- pitch in Hz

_ktimpnt_ -- The passage of time, in seconds, through the analysis file. _ktimpnt_ must always be positive, but can move forwards or backwards in time, be stationary or discontinuous, as a pointer into the analysis file.

_lpread_ gets its values from the control file according to the input value _ktimpnt_ (in seconds). If _ktimpnt_ proceeds at the analysis rate, time-normal synthesis will result; proceeding at a faster, slower, or variable rate will result in time-warped synthesis. At each k-period, _lpread_ interpolates between adjacent frames to more accurately determine the parameter values (presented as output) and the filter coefficient settings (passed internally to a subsequent [lpreson](../opcodes/lpreson.md)).

The error signal _kerr_ (between 0 and 1) derived during predictive analysis reflects the deterministic/random nature of the analyzed source. This will emerge low for pitched (periodic) material and higher for noisy material. The transition from voiced to unvoiced speech, for example, produces an error signal value of about .3. During synthesis, the error signal value can be used to determine the nature of the [lpreson](../opcodes/lpreson.md) driving function: for example, by arbitrating between pitched and non-pitched input, or even by determining a mix of the two. In normal speech resynthesis, the pitched input to [lpreson](../opcodes/lpreson.md) is a wideband periodic signal or pulse train derived from a unit such as [buzz](../opcodes/buzz.md), and the nonpitched source is usually derived from [rand](../opcodes/rand.md). However, any audio signal can be used as the driving function, the only assumption of the analysis being that it has a flat response.

[lpfreson](../opcodes/lpfreson.md) is a formant shifted [lpreson](../opcodes/lpreson.md), in which _kfrqratio_ is the (cps) ratio of shifted to original formant positions. This permits synthesis in which the source object changes its apparent acoustic size. [lpfreson](../opcodes/lpfreson.md) with _kfrqratio_ = 1 is equivalent to [lpreson](../opcodes/lpreson.md).

Generally, [lpreson](../opcodes/lpreson.md) provides a means whereby the time-varying content and spectral shaping of a composite audio signal can be controlled by the dynamic spectral content of another. There can be any number of lpread/lpreson (or lpfreson) pairs in an instrument or in an orchestra; they can read from the same or different control files independently.

## Examples

Here is an example of the lpread opcode. It uses the file [lpread.csd](../examples/lpread.csd).

``` csound-csd title="Example of the lpread opcode." linenums="1"
--8<-- "examples/lpread.csd"
```

## See also

[Linear Predictive Coding (LPC) Resynthesis](../spectral/lpcresyn.md)

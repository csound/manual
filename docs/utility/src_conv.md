<!--
id:src_conv
category:Utilities
-->
# src_conv
Converts the sample rate of an audio file at sample rate Rin to a sample rate of Rout.

Optionally the ratio (Rin / Rout) may be linearly time-varying according to a set of (time, ratio) pairs in an auxiliary file.

## Syntax
```
src_conv [flags] infile
```

### Initialization

Flags:

* -_P num_ = pitch transposition ratio (srate / r) [don't specify both P and r]
* -_Q num_  =quality factor (1, 2, 3, 4 or 5: default = 3)
* -_i filnam_ = auxiliary breakpoints file (no breakpoint by default. i.e. No ratio change)
* -_r num_ = output sample rate (must be specified if no P)
* -_o fnam_ = sound output filename (default: test.wav)
* -_A_ = create an AIFF format output soundfile
* -_J_ = create an IRCAM format output soundfile
* -_W_ = create a WAV format output soundfile (default after Csound version 6.15)
* -_h_ = no header on output soundfile
* -_c_ = 8-bit signed_char sound samples
* -_a_ = alaw sound samples
* -_8_ = 8-bit unsigned_char sound samples
* -_u_ = ulaw sound samples
* -_s_ = short_int (16 bit) sound samples (default)
* -_3_ = 24-bit sound samples
* -_l_ = long_int sound samples
* -_f_ = float sound samples
* -_r N_ = orchestra srate override
* -_K_ = Do not generate PEAK chunks
* -_R_ = continually rewrite header while writing soundfile (WAV/AIFF)
* -_H#_ = print a heartbeat style 1, 2 or 3 at each soundfile write
* -_N_ = notify (ring the bell) when done

This program performs arbitrary sample-rate conversion with high fidelity using the libsamplerate library.

The five levels of accuracy are:

* 1: A linear converter. The quality is poor, but the conversion speed is blindingly fast.
* 2:  A Zero Order Hold converter (interpolated value is equal to the last value). The quality is poor but the conversion speed is blindingly fast.
* 3: This is the fastest bandlimited interpolator and has an SNR of 97dB and a bandwidth of 80%.
* 4: This is another bandlimited interpolator much like the previous one. It has an SNR of 97dB and a bandwidth of 90%. The speed of the conversion is much faster than the next one. Blindingly fast.
* 5: This is a bandlimited interpolator derived from the mathematical sinc function and this is the highest quality sinc based converter, providing a worst case Signal-to-Noise Ratio (SNR) of 97dB at a bandwidth of 97%.

## Examples

Here is an example of src_conv. It uses the file [src_conv.csd](../examples/src_conv.csd).

``` csound-csd title="Example of src_conv." linenums="1"
--8<-- "examples/src_conv.csd"
```

## Credits

Author: John ffitch; based on code by Erik de Castro Lopo

May 2015

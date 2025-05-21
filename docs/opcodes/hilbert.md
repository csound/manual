<!--
id:hilbert
category:Signal Modifiers:Specialized Filters
-->
# hilbert
A Hilbert transformer.

## Syntax
=== "Modern"
    ``` csound-orc
    c:a, s:a = hilbert(sig:a)
    csig:Complex[] = hilbert(sig:a)
    ```

=== "Classic"
    ``` csound-orc
    ac, as hilbert asig
    sig:Complex[] hilbert asig
    ```

### Performance

_sig_ -- input signal

_c_ -- cosine output of _sig_

_s_ -- sine output of _sig_

_csig_ -- Complex array containing the analytic signal.

_hilbert_ is an IIR filter based implementation of a broad-band 90 degree phase difference network. The input to _hilbert_ is an audio signal, with a frequency range from 15 Hz to 15 kHz. The outputs of _hilbert_ have an identical frequency response to the input (i.e. they sound the same), but the two outputs have a constant phase difference of 90 degrees, plus or minus some small amount of error, throughout the entire frequency range. The outputs are in quadrature.

_hilbert_ is useful in the implementation of many digital signal processing techniques that require a signal in phase quadrature. _ar1_ corresponds to the cosine output of _hilbert_, while _ar2_ corresponds to the sine output. The two outputs have a constant phase difference throughout the audio range that corresponds to the phase relationship between cosine and sine waves.

Internally, _hilbert_ is based on two parallel 6th-order allpass filters. Each allpass filter implements a phase lag that increases with frequency; the difference between the phase lags of the parallel allpass filters at any given point is approximately 90 degrees.

Unlike an FIR-based Hilbert transformer, the output of _hilbert_ does not have a linear phase response. However, the IIR structure used in _hilbert_ is far more efficient to compute, and the nonlinear phase response can be used in the creation of interesting audio effects, as in the second example below.

## Examples

The first example implements frequency shifting, or single sideband amplitude modulation. Frequency shifting is similar to ring modulation, except the upper and lower sidebands are separated into individual outputs. By using only one of the outputs, the input signal can be "detuned," where the harmonic components of the signal are shifted out of harmonic alignment with each other, e.g. a signal with harmonics at 100, 200, 300, 400 and 500 Hz, shifted up by 50 Hz, will have harmonics at 150, 250, 350, 450, and 550 Hz.

Here is the first example of the hilbert opcode. It uses the file [hilbert.csd](../examples/hilbert.csd), and [drumsMlp.wav](../examples/drumsMlp.wav).

``` csound-csd title="Example of the hilbert opcode implementing frequency shifting." linenums="1"
--8<-- "examples/hilbert.csd"
```

The second example is a variation of the first, but with the output being fed back into the input. With very small shift amounts (i.e. between 0 and +-6 Hz), the result is a sound that has been described as a &#8220;barberpole phaser&#8221; or &#8220;Shepard tone phase shifter.&#8221; Several notches appear in the spectrum, and are constantly swept in the direction opposite that of the shift, producing a filtering effect that is reminiscent of Risset's &#8220;endless glissando&#8221;.

Here is the second example of the hilbert opcode. It uses the file [hilbert_barberpole.csd](../examples/hilbert_barberpole.csd).

``` csound-csd title="Example of the hilbert opcode sounding like a &#8220;barberpole phaser&#8221;." linenums="1"
--8<-- "examples/hilbert_barberpole.csd"
```

## See also

[Specialized Filters: Other filters](../sigmod/speciali.md)

## Technical History

The use of phase-difference networks in frequency shifters was pioneered by Harald Bode<sup>1</sup>. Bode and Bob Moog provide an excellent description of the implementation and use of a frequency shifter in the analog realm in <sup>2</sup>; this would be an excellent first source for those that wish to explore the possibilities of single sideband modulation. Bernie Hutchins provides more applications of the frequency shifter, as well as a detailed technical analysis<sup>3</sup>. A recent paper by Scott Wardle<sup>4</sup> describes a digital implementation of a frequency shifter, as well as some unique applications.

### References

1.   H. Bode, "Solid State Audio Frequency Spectrum Shifter." AES Preprint No. 395 (1965).
2.   H. Bode and R.A. Moog, "A High-Accuracy Frequency Shfiter for Professional Audio Applications." _Journal of the Audio Engineering Society_, July/August 1972, vol. 20, no. 6, p. 453.
3.   B. Hutchins. _Musical Engineer's Handbook_ (Ithaca, NY: Electronotes, 1975), ch. 6a.
4.   S. Wardle, "A Hilbert-Transformer Frequency Shifter for Audio." Available online at [http://www.iua.upf.es/dafx98/papers/](http://www.iua.upf.es/dafx98/papers/).

## Credits

Author: Sean Costello<br>
Seattle, Washington<br>
1999<br>

New in Csound version 3.55

The examples were updated April 2002. Thanks go to Sean Costello for fixing the barberpole example.

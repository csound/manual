<!--
id:resonz
category:Signal Modifiers:Standard Filters:Resonant
-->
# resonz
A second-order, two-pole two-zero bandpass filter with variable frequency response.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = resonz(asig, xcf, xbw [, iscl] [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares resonz asig, xcf, xbw [, iscl] [, iskip]
    ```

### Initialization

The optional initialization variables for _resonr_ and _resonz_ are identical to the i-time variables for [reson](../opcodes/reson.md).

_iskip_ -- initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

_iscl_ -- coded scaling factor for resonators. A value of 1 signifies a peak response factor of 1, i.e.  all frequencies other than _kcf_ are attenuated in accordance with the (normalized) response curve. A value of 2 raises the response factor so that its overall RMS value equals 1. This intended equalization of input and output power assumes all frequencies are physically present; hence it is most applicable to white noise. A zero value signifies no scaling of the signal, leaving that to some later adjustment (see [balance](../opcodes/balance.md)). The default value is 0.

### Performance

_resonr_ and _resonz_ are variations of the classic two-pole bandpass resonator ([reson](../opcodes/reson.md)). Both filters have two zeroes in their transfer functions, in addition to the two poles. _resonz_ has its zeroes located at z = 1 and z = -1. _resonr_ has its zeroes located at +sqrt(_R_) and -sqrt(_R_), where _R_ is the radius of the poles in the complex z-plane. The addition of zeroes to _resonr_ and _resonz_ results in the improved selectivity of the magnitude response of these filters at cutoff frequencies close to 0, at the expense of less selectivity of frequencies above the cutoff peak.

_resonr_ and _resonz_ are very close to constant-gain as the center frequency is swept, resulting in a more efficient control of the magnitude response than with traditional two-pole resonators such as _reson_.

_resonr_ and _resonz_ produce a sound that is considerably different from _reson_, especially for lower center frequencies; trial and error is the best way of determining which resonator is best suited for a particular application.

_asig_ -- input signal to be filtered

_xcf_ -- cutoff or resonant frequency of the filter, measured in Hz

_xbw_ -- bandwidth of the filter (the Hz difference between the upper and lower half-power points)

## Examples

Here is an example of the resonr and resonz opcodes. It uses the file [resonz.csd](../examples/resonz.csd).

``` csound-csd title="Example of the resonr and resonz opcodes." linenums="1"
--8<-- "examples/resonr.csd"
```

## Technical History

_resonr_ and _resonz_ were originally described in an article by Julius O. Smith and James B. Angell.<sup>1</sup> Smith and Angell recommended the _resonz_ form (zeros at +1 and -1) when computational efficiency was the main concern, as it has one less multiply per sample, while _resonr_ (zeroes at + and - the square root of the pole radius R) was recommended for situations when a perfectly constant-gain center peak was required.

Ken Steiglitz, in a later article <sup>2</sup>, demonstrated that _resonz_ had constant gain at the true peak of the filter, as opposed to _resonr_, which displayed constant gain at the pole angle. Steiglitz also recommended _resonz_ for its sharper notches in the gain curve at zero and Nyquist frequency. Steiglitz's recent book <sup>3</sup> features a thorough technical discussion of _reson_ and _resonz_, while Dodge and Jerse's textbook <sup>4</sup> illustrates the differences in the response curves of _reson_ and _resonz_.

### References

1.   Smith, Julius O. and Angell, James B., "A Constant-Gain Resonator Tuned by a Single Coefficient," _Computer Music Journal_, vol. 6, no. 4, pp. 36-39, Winter 1982.
2.   Steiglitz, Ken, "A Note on Constant-Gain Digital Resonators," _Computer Music Journal_, vol. 18, no. 4, pp. 8-10, Winter 1994.
3.   Ken Steiglitz, _A Digital Signal Processing Primer, with Applications to Digital Audio and Computer Music_. Addison-Wesley Publishing Company, Menlo Park, CA, 1996.
4.   Dodge, Charles and Jerse, Thomas A., _Computer Music: Synthesis, Composition, and Performance_. New York: Schirmer Books, 1997, 2nd edition, pp. 211-214.

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Sean Costello<br>
Seattle, Washington<br>
1999<br>

New in Csound version 3.55

Audio rate parameters introduced in version 6.02

November 2013.

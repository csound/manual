<!--
id:phaser2
category:Signal Modifiers:Special Effects
-->
# phaser2
Second-order allpass filters arranged in a series.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = phaser2(asig, kfreq, kq, kord, kmode, ksep, kfeedback)
    ```

=== "Classic"
    ``` csound-orc
    ares phaser2 asig, kfreq, kq, kord, kmode, ksep, kfeedback
    ```

### Performance

_kfreq_ -- frequency (in Hz) of the filter(s). This is the center frequency of the notch of the first allpass filter in the series. This frequency is used as the base frequency from which the frequencies of the other notches are derived.

_kq_ -- Q of each notch. Higher Q values result in narrow notches. A Q between 0.5 and 1 results in the strongest "phasing" effect, but higher Q values can be used for special effects.

_kord_ -- the number of allpass stages in series. These are second-order filters, and iord can range from 1 to 2499. With higher orders, the computation time increases.

_kfeedback_ -- amount of the output which is fed back into the input of the allpass chain. With larger amounts of feedback, more prominent notches appear in the spectrum of the output. _kfeedback_ must be between -1 and +1. for stability.

_kmode_ -- used in calculation of notch frequencies.

> :memo: **Note**
>
> Although _kord_ and _kmode_ are listed as k-rate, they are in fact accessed only at init-time. So if you are using k-rate arguments, they must be assigned with [init](../opcodes/init.md).

_ksep_ -- scaling factor used, in conjunction with _imode_, to determine the frequencies of the additional notches in the output spectrum.

_phaser2_ implements _iord_ number of second-order allpass sections, connected in series. The use of second-order allpass sections allows for the precise placement of the frequency, width, and depth of notches in the frequency spectrum. _iord_ is used to directly determine the number of notches in the spectrum; e.g. for _iord_ = 6, there will be 6 notches in the output spectrum.

There are two possible modes for determining the notch frequencies. When _imode_ = 1, the notch frequencies are determined by the following function:

```
frequency of notch N = kbf + (ksep * kbf * N-1)
```

For example, with _imode_ = 1 and _ksep_ = 1, the notches will be in harmonic relationship with the notch frequency determined by _kfreq_ (i.e. if there are 8 notches, with the first at 100 Hz, the next notches will be at 200, 300, 400, 500, 600, 700, and 800 Hz). This is useful for generating a "comb filtering" effect, with the number of notches determined by _iord_. Different values of _ksep_ allow for inharmonic notch frequencies and other special effects. _ksep_ can be swept to create an expansion or contraction of the notch frequencies. A useful visual analogy for the effect of sweeping _ksep_ would be the bellows of an accordion as it is being played - the notches will be seperated, then compressed together, as _ksep_ changes.

When _imode_ = 2, the subsequent notches are powers of the input parameter _ksep_ times the initial notch frequency specified by _kfreq_. This can be used to set the notch frequencies to octaves and other musical intervals. For example, the following lines will generate 8 notches in the output spectrum, with the notches spaced at octaves of _kfreq_:

``` csound-orc
aphs    phaser2    ain, kfreq, 0.5, 8, 2, 2, 0
aout    =          ain + aphs
```

When _imode_ = 2, the value of _ksep_ must be greater than 0. _ksep_ can be swept to create a compression and expansion of notch frequencies (with more dramatic effects than when _imode_ = 1).

## Examples

Here is an example of the phaser2 opcode. It uses the file [phaser2.csd](../examples/phaser2.csd).

``` csound-csd title="Example of the phaser2 opcode." linenums="1"
--8<-- "examples/phaser2.csd"
```

## Technical History

A general description of the differences between flanging and phasing can be found in Hartmann [1]. An early implementation of first-order allpass filters connected in series can be found in Beigel [2], where the bilinear z-transform is used for determining the phase shift frequency of each stage. Cronin [3] presents a similar implementation for a four-stage phase shifting network. Chamberlin [4] and Smith [5] both discuss using second-order allpass sections for greater control over notch depth, width, and frequency.

### References

1.   Hartmann, W.M. "Flanging and Phasers." Journal of the Audio Engineering Society, Vol. 26, No. 6, pp. 439-443, June 1978.
2.   Beigel, Michael I. "A Digital 'Phase Shifter' for Musical Applications, Using the Bell Labs (Alles-Fischer) Digital Filter Module." Journal of the Audio Engineering Society, Vol. 27, No. 9, pp. 673-676,September 1979.
3.   Cronin, Dennis. "Examining Audio DSP Algorithms." Dr. Dobb's Journal, July 1994, p. 78-83.
4.   Chamberlin, Hal. Musical Applications of Microprocessors. Second edition. Indianapolis, Indiana: Hayden Books, 1985.
5.   Smith, Julius O. "An Allpass Approach to Digital Phasing and Flanging." Proceedings of the 1984 ICMC, p. 103-108.

## See also

[Special Effects](../sigmod/speciale.md)

## Credits

Author: Sean Costello<br>
Seattle, Washington<br>
1999<br>

November 2002. Added a note about the _kord_ and _kmode_ parameters, thanks to Rasmus Ekman.

New in Csound version 4.0

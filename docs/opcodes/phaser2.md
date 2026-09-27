<!--
id:phaser2
category:Signal Modifiers:Special Effects
-->
# phaser2
Second-order allpass filters arranged in a series.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = phaser2(asig, kfreq, kq, kord, kmode, ksep, kfeedback [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares phaser2 asig, kfreq, kq, kord, kmode, ksep, kfeedback [, iskip]
    ```

### Initialization

_iskip_ (optional, default=0) -- zero clears the filter history and feedback. A nonzero value keeps them on reinitialization.

### Performance

_kfreq_ -- frequency in Hz of the first allpass stage. The other stage frequencies depend on _kmode_ and _ksep_.

_kq_ -- Q of each notch. Higher Q values result in narrow notches. A Q between 0.5 and 1 results in the strongest "phasing" effect, but higher Q values can be used for special effects.

_kord_ -- number of second-order allpass stages in series. Use a positive integer. More stages require more computation.

_kfeedback_ -- amount of the output which is fed back into the input of the allpass chain. With larger amounts of feedback, more prominent notches appear in the spectrum of the output. _kfeedback_ must be between -1 and +1. for stability.

_kmode_ -- used in calculation of notch frequencies.

> :memo: **Note**
>
> Although _kord_ and _kmode_ are listed as k-rate, they are in fact accessed only at init-time. So if you are using k-rate arguments, they must be assigned with [init](../opcodes/init.md).

_ksep_ -- spacing factor used with _kmode_ to set the frequencies of the later stages.

_phaser2_ connects _kord_ second-order allpass stages in series. With fixed controls and zero feedback, the chain changes phase while keeping a flat magnitude response. Mix the output with the input to create notches in the spectrum, as shown below.

There are two modes for setting the stage frequencies. When _kmode_ = 1, stage _N_ (counting from 1) uses:

```
frequency of stage N = kfreq * (1 + ksep * (N - 1))
```

For example, with _kmode_ = 1, _ksep_ = 1, and _kfreq_ = 100, the first four stages use 100, 200, 300, and 400 Hz. Vary _ksep_ to change their spacing.

When _kmode_ = 2, stage _N_ uses `kfreq * ksep^(N - 1)`. For example, the following lines space eight stages an octave apart and mix the result with the input:

``` csound-orc
aphs    phaser2    ain, kfreq, 0.5, 8, 2, 2, 0
aout    =          ain + aphs
```

Use a positive _ksep_ in mode 2. Values above 1 raise the frequency of each later stage; values between 0 and 1 lower it.

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

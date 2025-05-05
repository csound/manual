<!--
id:phaser1
category:Signal Modifiers:Special Effects
-->
# phaser1
First-order allpass filters arranged in a series.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = phaser1(asig, kfreq, kord, kfeedback [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares phaser1 asig, kfreq, kord, kfeedback [, iskip]
    ```

### Initialization

_iskip_ (optional, default=0) -- used to control initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_kfreq_ -- frequency (in Hz) of the filter(s). This is the frequency at which each filter in the series shifts its input by 90 degrees.

_kord_ -- the number of allpass stages in series. These are first-order filters and can range from 1 to 4999.

> :memo: **Note**
>
> Although _kord_ is listed as k-rate, it is in fact accessed only at init-time. So if you are using a k-rate argument, it must be assigned with [init](../opcodes/init.md).

_kfeedback_ -- amount of the output which is fed back into the input of the allpass chain. With larger amounts of feedback, more prominent notches appear in the spectrum of the output. _kfeedback_ must be between -1 and +1. for stability.

_phaser1_ implements _iord_ number of first-order allpass sections, serially connected, all sharing the same coefficient. Each allpass section can be represented by the following difference equation:

```
y(n) = C * x(n) + x(n-1) - C * y(n-1)
```

where x(n) is the input, x(n-1) is the previous input, y(n) is the output, y(n-1) is the previous output, and C is a coefficient which is calculated from the value of _kfreq_, using the bilinear z-transform.

By slowly varying _kfreq_, and mixing the output of the allpass chain with the input, the classic "phase shifter" effect is created, with notches moving up and down in frequency. This works best with _iord_ between 4 and 16. When the input to the allpass chain is mixed with the output, 1 notch is generated for every 2 allpass stages, so that with _iord_ = 6, there will be 3 notches in the output. With higher values for _iord_, modulating _kfreq_ will result in a form of nonlinear pitch modulation.

## Examples

Here is an example of the phaser1 opcode. It uses the file [phaser1.csd](../examples/phaser1.csd).

``` csound-csd title="Example of the phaser1 opcode." linenums="1"
--8<-- "examples/phaser1.csd"
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

November 2002. Added a note about the _kord_ parameter, thanks to Rasmus Ekman.

New in Csound version 4.0

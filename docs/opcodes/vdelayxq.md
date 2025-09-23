<!--
id:vdelayxq
category:Signal Modifiers:Delay
-->
# vdelayxq
A 4-channel variable delay opcode with high quality interpolation.

## Syntax
=== "Modern"
    ``` csound-orc
    aout1, aout2, aout3, aout4 = vdelayxq(ain1, ain2, ain3, ain4, adl, imd, iws [, ist])
    ```

=== "Classic"
    ``` csound-orc
    aout1, aout2, aout3, aout4 vdelayxq ain1, ain2, ain3, ain4, adl, imd, iws [, ist]
    ```

### Initialization

_imd_ -- max. delay time (seconds)

_iws_ -- interpolation window size (see below)

_ist_ (optional) -- skip initialization if not zero

### Performance

_aout1, aout2, aout3, aout4_ -- output audio signals.

_ain1, ain2, ain3, ain4_ -- input audio signals.

_adl_ -- delay time in seconds

This opcode uses high quality (and slow) interpolation, that is much more accurate than the currently available linear and cubic interpolation. The _iws_ parameter sets the number of input samples used for calculating one output sample (allowed values are any integer multiply of 4 in the range 4 - 1024); higher values mean better quality and slower speed.

The multichannel opcodes (eg. _vdelayxq_) allow delaying 2 or 4 variables at once (stereo or quad signals); this is much more efficient than using separate opcodes for each channel.

> :memo: **Notes**
>
> * Delay time is measured in seconds (unlike in vdelay and vdelay3), and must be a-rate.
> * The minimum allowed delay is iws/2 samples.
> * Using the same variables as input and output is allowed in these opcodes.
> * In vdelayxw*, changing the delay time has some effects on output volume:
> ```
> a = 1 / (1 + dt)
> ```
>  where a is the output gain, and dt is the change of delay time per seconds.
> * These opcodes are best used in the double-precision version of Csound.

## Examples

Here is an example of the vdelayxq opcode. It uses the file [vdelayxq.csd](../examples/vdelayxq.csd).

``` csound-csd title="Example of the vdelayxq opcode." linenums="1"
--8<-- "examples/vdelayxq.csd"
```

Two important points here. First, the delay time must be always positive. And second, even though the delay time can be controlled in k-rate, it is not advised to do so, since sudden time changes will create clicks.

## See also

[Delay](../sigmod/delayops.md)

<!--
id:vdelayx
category:Signal Modifiers:Delay
-->
# vdelayx
A variable delay opcode with high quality interpolation.

## Syntax
=== "Modern"
    ``` csound-orc
    aout = vdelayx(ain, adl, imd, iws [, ist])
    ```

=== "Classic"
    ``` csound-orc
    aout vdelayx ain, adl, imd, iws [, ist]
    ```

### Initialization

_imd_ -- max. delay time (seconds)

_iws_ -- interpolation window size (see below)

_ist_ (optional) -- skip initialization if not zero

### Performance

_aout_ -- output audio signal

_ain_ -- input audio signal

_adl_ -- delay time in seconds

This opcode uses high quality (and slow) interpolation, that is much more accurate than the currently available linear and cubic interpolation. The _iws_ parameter sets the number of input samples used for calculating one output sample (allowed values are any integer multiply of 4 in the range 4 - 1024); higher values mean better quality and slower speed.

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

Here is an example of the use of the _vdelayx_ opcode. It uses the file [vdelayx.csd](../examples/vdelayx.csd).

``` csound-csd title="Example of the _vdelayx_ opcode." linenums="1"
--8<-- "examples/vdelayx.csd"
```

## See also

[Delay](../sigmod/delayops.md)

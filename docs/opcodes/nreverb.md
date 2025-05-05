<!--
id:nreverb
category:Signal Modifiers:Reverberation
-->
# nreverb
A reverberator consisting of 6 parallel comb-lowpass filters.

It is fed into a series of 5 allpass filters. _nreverb_ replaces [reverb2](../opcodes/reverb2.md) (version 3.48) and so both opcodes are identical.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = nreverb(asig, ktime, khdif [, iskip] [,inumCombs] [, ifnCombs] \
                   [, inumAlpas] [, ifnAlpas])
    ```

=== "Classic"
    ``` csound-orc
    ares nreverb asig, ktime, khdif [, iskip] [,inumCombs] [, ifnCombs] \
                 [, inumAlpas] [, ifnAlpas]
    ```

### Initialization

_iskip_ (optional, default=0) -- Skip initialization if present and non-zero.

_inumCombs_ (optional) -- number of filter constants in comb filter. If omitted, the values default to the nreverb constants. New in Csound version 4.09.

_ifnCombs_ - function table with _inumCombs_ comb filter time values, followed the same number of gain values.  The ftable should not be rescaled (use negative fgen number). Positive time values are in seconds. The time values are converted internally into number of samples, then set to the next greater prime number. If the time is negative, it is interpreted directly as time in sample frames, and no processing is done (except negation). New in Csound version 4.09.

_inumAlpas_, _ifnAlpas_ (optional) -- same as _inumCombs/ifnCombs_, for allpass filter. New in Csound 4.09.

### Performance

The input signal asig is reverberated for _ktime_ seconds. The parameter _khdif_ controls the high frequency diffusion amount. The values of _khdif_ should be from 0 to 1. If _khdif_ is set to 0 the all the frequencies decay with the same speed. If _khdif_ is 1, high frequencies decay faster than lower ones. If _ktime_ is inadvertently set to a non-positive number, _ktime_ will be reset automatically to 0.01. (New in Csound version 4.07.)

As of Csound version 4.09, _nreverb_ may read any number of comb and allpass filter from an ftable.

## Examples

Here is a simple example of the nreverb opcode. It uses the file [nreverb.csd](../examples/nreverb.csd).

``` csound-csd title="Simple example of the nreverb opcode." linenums="1"
--8<-- "examples/nreverb.csd"
```

Here is an example of the nreverb opcode using an ftable for filter constants. It uses the file [nreverb_ftable.csd](../examples/nreverb_ftable.csd), and [drumsMlp.wav](../examples/drumsMlp.wav).

``` csound-csd title="An example of the nreverb opcode using an ftable for filter constants." linenums="1"
--8<-- "examples/nreverb_ftable.csd"
```

## See also

[Reverberation](../sigmod/reverbtn.md)

## Credits

Authors: Paris Smaragdis (_reverb2_)<br>
MIT, Cambridge<br>
1995<br>

Author: Richard Karpen (_nreverb_)<br>
Seattle, Wash<br>
1998<br>

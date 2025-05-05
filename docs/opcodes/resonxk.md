<!--
id:resonxk
category:Signal Modifiers:Standard Filters:Control
-->
# resonxk
Control signal resonant filter stack.

_resonxk_ is equivalent to a group of resonk filters, with the same arguments, serially connected. Using a stack of a larger number of filters allows a sharper cutoff.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = resonxk(ksig, kcf, kbw[, inumlayer, iscl, istor])
    ```

=== "Classic"
    ``` csound-orc
    kres resonxk ksig, kcf, kbw[, inumlayer, iscl, istor]
    ```

### Initialization

_inumlayer_ - number of elements of filter stack. Default value is 4. Maximum value is 10

_iscl_ (optional, default=0) - coded scaling factor for resonators. A value of 1 signifies a peak response factor of 1, i.e. all frequencies other than kcf are attenuated in accordance with the (normalized) response curve. A value of 2 raises the response factor so that its overall RMS value equals 1. (This intended equalization of input and output power assumes all frequencies are physically present; hence it is most applicable to white noise.) A zero value signifies no scaling of the signal, leaving that to some later adjustment (see balance). The default value is 0.

_istor_ (optional, default=0) -- initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_kres_ - output signal

_ksig_ - input signal

_kcf_ -  the center frequency of the filter, or frequency position of the peak response.

_kbw_ - bandwidth of the filter (the Hz difference between the upper and lower half-power points)

_resonxk_ is a lot faster than using individual instances in Csound orchestra of the old opcodes, because only one initialization and 'k' cycle are needed at a time, and the audio loop falls enterely inside the cache memory of processor.

## Examples

Here is an example of the resonxk opcode. It uses the file [resonxk.csd](../examples/resonxk.csd).

``` csound-csd title="Example of the resonxk opcode." linenums="1"
--8<-- "examples/resonxk.csd"
```

## See also

[Standard Filters: Control signal filters](../sigmod/standard.md)

## Credits

Written by Gabriel Maldonado.

New in Csound 5 (Previously available only on CsoundAV)

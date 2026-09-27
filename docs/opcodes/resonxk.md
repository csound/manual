<!--
id:resonxk
category:Signal Modifiers:Standard Filters:Control
-->
# resonxk
Control signal resonant filter stack.

_resonxk_ connects several [resonk](../opcodes/resonk.md) filters in series, all with the same settings. More layers give a sharper response.

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

_inumlayer_ - number of filters in the stack. The default is 4.

_iscl_ (optional, default=0) - scaling for each filter. A value of 1 gives each filter a peak gain of 1. A value of 2 gives each filter an RMS gain of 1 for white noise; this does not give the whole stack an RMS gain of 1. A value of 0 leaves the signal unscaled.

_istor_ (optional, default=0) -- set to zero to clear the filter history, or nonzero to keep it on reinitialization. First use and a change in the number of filters always clear the history.

### Performance

_kres_ - output signal

_ksig_ - input signal

_kcf_ - center frequency in Hz, shared by all filters.

_kbw_ - bandwidth of each filter in Hz (the difference between the upper and lower half-power points).

The filters process one sample per control period. Their frequency range therefore depends on _kr_. The bandwidth setting applies to each filter; adding layers narrows the response of the whole stack.

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

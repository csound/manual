<!--
id:resonbnk
category:Spectral Processing:LPC
-->
# resonbnk
A resonator filter bank.

This opcode takes an array of filter paramerers in frequency-bandwidth pairs and constructs a bank of second-order resonators, in either parallel or serial connections.

## Syntax
=== "Modern"
    ``` csound-orc
    asig = resonbnk(ain, kPar[], kmin, kmax, iper [, imode, iscal, iskip])
    ```

=== "Classic"
    ``` csound-orc
    asig resonbnk ain, kPar[], kmin, kmax, iper [, imode, iscal, iskip]
    ```

### Initialization

_iper_ -- filter parameter interpolation period (in samples).

_imode_ -- filter connection mode (0 = serial, 1 = parallel, defaults to 1).

_iscal_ -- filter scaling mode (0 = no scaling, 1 and 2 modes as in reson, defaults to 0).

_iskip_ -- skip initialisation if non-zero (defaults to 0).

### Performance

_asig_ -- output signal

_ain_ -- input signal

_kPar[]_ -- filter parameters in freq-bandwidth pairs.

_kmin_ -- minimum filter frequency.

_kmax_ -- maximum filter frequency.

This opcode is part of a suite of streaming linear prediction opcodes. It takes in an array of filter parameters in frequency/bandwidth pairs and creates a bank of filters. The minimum and maximum filter frequencies used in the filterbank are set by kmin and kmax, and any filters whose frequencies are outside this range are excluded from the filterbank. Filter coefficients are computed every iper samples and linearly interpolated throughout.

## Examples

Here is an example of the resonbnk opcode using an audio input
signal as lpc source. It uses the file [resonbnk.csd](../examples/resonbnk.csd).

``` csound-csd title="Example of the resonbnk opcode." linenums="1"
--8<-- "examples/resonbnk.csd"
```

## See also

[Streaming Linear Predictive Coding (SLPC) Resynthesis](../spectral/lpcresyn.md)

<!--
id:resony
category:Signal Modifiers:Standard Filters:Resonant
-->
# resony
A bank of second-order bandpass filters, connected in parallel.


## Syntax
=== "Modern"
    ``` csound-orc
    ares = resony(asig, kbf, kbw, inum, ksep [, isepmode] [, iscl] [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares resony asig, kbf, kbw, inum, ksep [, isepmode] [, iscl] [, iskip]
    ```

### Initialization

_inum_ -- number of filters

_isepmode_ (optional, default=0) -- if _isepmode_ = 0, the separation of center frequencies of each filter is generated logarithmically (using octave as unit of measure). If _isepmode_ not equal to 0, the separation of center frequencies of each filter is generated linearly (using Hertz). Default value is 0.

_iscl_ (optional, default=0) -- coded scaling factor for resonators. A value of 1 signifies a peak response factor of 1, i.e. all frequencies other than _kcf_ are attenuated in accordance with the (normalized) response curve. A value of 2 raises the response factor so that its overall RMS value equals 1. (This intended equalization of input and output power assumes all frequencies are physically present; hence it is most applicable to white noise.) A zero value signifies no scaling of the signal, leaving that to some later adjustment (e.g. [balance](../opcodes/balance.md)). The default value is 0.

_iskip_ (optional, default=0) -- initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_asig_ -- audio input signal

_kbf_ -- base frequency, i.e. center frequency of lowest filter in Hz

_kbw_ -- bandwidth in Hz

_ksep_ -- separation of the center frequency of filters in octaves

_resony_ is a bank of second-order bandpass filters, with k-rate variant frequency separation, base frequency and bandwidth, connected in parallel (i.e. the resulting signal is a mix of the output of each filter). The center frequency of each filter depends of _kbf_ and _ksep_ variables. The maximum number of filters is set to 100.

## Examples

Here is an example of the resony opcode. It uses the file [resony.csd](../examples/resony.csd).

``` csound-csd title="Example of the resony opcode." linenums="1"
--8<-- "examples/resony.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
1999<br>

New in Csound version 3.56
